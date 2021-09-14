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


public partial class Admin_AimScope : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["target"].ToString());
    CommonDB db = new CommonDB();
    string uname = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["Uname"].ToString();
        if (!IsPostBack)
        {
            db.Query = "select Description from tblDefaultPageAER";
            DataTable dt = db.FetchToDataBase();
            if (dt.Rows.Count > 0)
            {
                txtEditorDescription.Text = dt.Rows[0][0].ToString();
            }
            else
                txtEditorDescription.Text = "";
        }
    }
   
    protected void setClear()
    {
        txtEditorDescription.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        db.Query = "select Description from tblDefaultPageAER";
        DataTable dt = db.FetchToDataBase();
        if (dt.Rows.Count > 0)
        {
            cmd = new SqlCommand("update tblDefaultPageAER set Description=@Description where Id=1", con);
            cmd.Parameters.AddWithValue("@Description", txtEditorDescription.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string script = @"alert('Default Page description updated successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
            setClear();
        }
        else
        {
            cmd = new SqlCommand("insert into tblDefaultPageAER (Description) values (@Description)", con);
            cmd.Parameters.AddWithValue("@Description", txtEditorDescription.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string script = @"alert('Default Page description inserted successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
            setClear();
        }
    }
    protected void btnSubmit0_Click(object sender, EventArgs e)
    {

        if (fu_product2_english.HasFile)
        {
            try
            {
                string Path = Server.MapPath("~//journalproposal");
                string UploadFileName = fu_product2_english.FileName;
                string GetExtension = UploadFileName.Substring(UploadFileName.IndexOf('.'));
                string FileName = Path+"\\Propose-a-new-journal" + GetExtension;
                fu_product2_english.SaveAs(FileName);

            }
            catch
            {
           
            }
        }
    
        string script = @"alert('Save Successfully !');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "confirmation", script, true);

    }
}