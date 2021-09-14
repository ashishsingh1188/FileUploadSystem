using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_Home : System.Web.UI.Page
{
    CommonDB db = new CommonDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Designation"] == "")
            Response.Redirect("~/Admin/MainLogin.aspx");
        if (!IsPostBack)
        {
            lbl_DateandTime.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            lbl_Time.Text = DateTime.Now.ToString("hh:mm");
            if (Session["Designation"].ToString().ToUpper() == "ADMIN")
            {
                lblDesignation.Text = "Administrator";
                PHDefault.Visible = true;
            }
            else
            {
                string uname = Session["Uname"].ToString();
                db.Query = "select Name from tblJournalMaster where UserName='" + uname + "'";
                DataTable dt = db.FetchToDataBase();
                lblDesignation.Text = dt.Rows[0][0].ToString();
            }

        }
    }
    protected void link_signout_Click(object sender, EventArgs e)
    {
        Session["Designation"] = "";
        Session["Uname"] = "";
        Response.Redirect("~/Default.aspx");
    }
}