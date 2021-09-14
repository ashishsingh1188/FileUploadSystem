using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminHome : System.Web.UI.Page
{
    CommonDB iud = new CommonDB();
    protected string GetUname(string Uid)
    {
        string Uname = "";
        if (!Uid.StartsWith("ADMIN"))
        {
            iud.Query = "select Name from tblJournalMaster where UserName='" + Uid + "'";
            DataTable dt = iud.FetchToDataBase();
            Uname = dt.Rows[0]["Name"].ToString();
        }
        return Uname;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Designation"] == "" && Session["Designation"].ToString().ToUpper() != "JOURNAL")
            Response.Redirect("~/Admin/MainLogin.aspx");
        if (!IsPostBack)
        {
            string uname = Session["Uname"].ToString();
            lbl_username.Text = GetUname(uname);
            //lbl_fyear.Text = Session["fyear"].ToString();
            lbl_DateandTime.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            MultiView1.ActiveViewIndex = 0;
        }
    }
   
    protected void link_signout_Click(object sender, EventArgs e)
    {
        Session["fyear"] = "";
        Session["companyname"] = "";
        Session["Designation"] = "";
        Session["Uname"] = "";
        Response.Redirect("~/Default.aspx");
    }
   
}