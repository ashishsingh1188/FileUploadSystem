using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections;
using AjaxControlToolkit.HTMLEditor;

public partial class Admin_EditorialBoard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["target"].ToString());
    CommonDB db = new CommonDB();
    string uname = "";
    SqlCommand cmd;

    JournalDataSet jds = new JournalDataSet();
    JournalDataSetTableAdapters.tblDetailTableAdapter jda = new JournalDataSetTableAdapters.tblDetailTableAdapter();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["Uname"].ToString();
        if (!IsPostBack)
        {
            BindJournalist();
        }
    }
    protected string GetID(string UName)
    {
        string Uname = "";
        if (!UName.StartsWith("ADMIN"))
        {
            db.Query = "select Id from tblJournalMaster where UserName='" + UName + "'";
            DataTable dt = db.FetchToDataBase();
            Uname = dt.Rows[0]["Id"].ToString();
        }
        return Uname;
    }
    protected void BindJournalist()
    {
        DataTable dtjournal;
        if (uname.StartsWith("ADMIN"))
        {
            db.Query = "select a.Id,a.Name,d.Title from tblJournalMaster as a LEFT OUTER JOIN tblDetail AS d on a.Id=d.Id";
            dtjournal = db.FetchToDataBase();
            ddlJournalist.Items.Add("Select");
        }
        else
        {
            string id = GetID(uname);
            db.Query = "select a.Id,a.Name,d.Title from tblJournalMaster as a LEFT OUTER JOIN tblDetail AS d on a.Id=d.Id where a.Id=" + id + "";
            dtjournal = db.FetchToDataBase();
        }
        
        if (dtjournal.Rows.Count > 0)
        {
            for (int i = 0; i < dtjournal.Rows.Count; i++)
            {
                ListItem li = new ListItem(dtjournal.Rows[i]["Name"].ToString() + " - " + dtjournal.Rows[i]["Title"].ToString(), dtjournal.Rows[i]["Id"].ToString());
                ddlJournalist.Items.Add(li);
            }
            FillJournalDetails();
        }
    }
    protected void FillJournalDetails()
    {
        if (ddlJournalist.SelectedItem.Text != "Select")
        {
            db.Query = "select Editorial from tblDetail where Id=" + ddlJournalist.SelectedValue + "";
            DataTable dt = db.FetchToDataBase();
            if (dt.Rows.Count > 0)
            {
                txtEditorEditorialBoard.Text = dt.Rows[0]["Editorial"].ToString();
            }
            else
                txtEditorEditorialBoard.Text = "";
        }
    }
    protected void ddlJournalist_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillJournalDetails();
    }
    protected void setClear()
    {
        ddlJournalist.SelectedIndex = 0;
        txtEditorEditorialBoard.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ID = GetID(uname);
        if (ID == "")
        {
            ID = ddlJournalist.SelectedValue.ToString();
        }
        db.Query = "select Editorial from tblDetail where Id=" + ID + "";
        DataTable dt = db.FetchToDataBase();
        if (dt.Rows.Count > 0)
        {
            cmd = new SqlCommand("update tblDetail set Editorial=@Editorial where Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", int.Parse(ID));
            cmd.Parameters.AddWithValue("@Editorial", txtEditorEditorialBoard.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string script = @"alert('Editorial Board Page details updated successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
            setClear();
        }
        else
        {
            cmd = new SqlCommand("insert into tblDetail (Id,Editorial) values (@Id,@Editorial)", con);
            cmd.Parameters.AddWithValue("@Id", int.Parse(ID));
            cmd.Parameters.AddWithValue("@Editorial", txtEditorEditorialBoard.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string script = @"alert('Editorial Board Page details inserted successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
            setClear();
        }
    }
}