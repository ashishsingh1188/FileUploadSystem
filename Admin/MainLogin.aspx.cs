using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class MainLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["target"].ToString());
    CommonDB Com = new CommonDB();
    string dep = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string folderPath = Server.MapPath("~/Admin/pdf");
            //string[] AllPdf = Directory.GetFiles(folderPath);
            //foreach (string AFile in AllPdf)
            //{
            //    File.Delete(AFile);
            //}
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Calling Login_Authenticate Stored Procedure..............//
        SqlCommand cmd = new SqlCommand("Login_Authenticate", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@UNameid", SqlDbType.VarChar));
        cmd.Parameters["@UNameid"].Value = txt_username.Text;
        cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar));
        cmd.Parameters["@Password"].Value = txt_password.Text;
        SqlParameter sp_o1 = new SqlParameter();
        sp_o1.ParameterName = "@Designation";
        sp_o1.SqlDbType = SqlDbType.VarChar;
        sp_o1.Size = 1000;
        sp_o1.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(sp_o1);
        con.Open();
        cmd.ExecuteNonQuery();
        string Designation = cmd.Parameters["@Designation"].Value.ToString();
        con.Close();
        if (Designation == "")
        {
            Com.Query = "Select UserName,Password from tblJournalMaster Where UserName='" + txt_username.Text + "' And Password='" + txt_password.Text + "'";
            DataTable dtlog = Com.FetchToDataBase();
            if (dtlog.Rows.Count > 0)
            {
                Designation = "JOURNAL";
                //dep = dtlog.Rows[0]["DepotId"].ToString();
                Session["Designation"] = Designation;
                Session["Uname"] = txt_username.Text.ToUpper();

            }
        }
        if (Designation != "")
        {
            Session["Designation"] = Designation;
            Session["Uname"] = txt_username.Text.ToUpper();

            //...for login_log
            string LasetLoginTime = "";
            Com.Query = "select top(1) rectimestamp from Login_Log where loginby ='" + Designation + "' order by rectimestamp desc";
            DataTable dt_loginLog = Com.FetchToDataBase();
            if (dt_loginLog.Rows.Count > 0)
            {
                DateTime date_login = Convert.ToDateTime(dt_loginLog.Rows[0]["rectimestamp"]);
                int i1 = date_login.Hour;
                int i2 = date_login.Minute;
                LasetLoginTime = date_login.ToString("dd-MMM-yyyy") + "-" + i1.ToString() + ":" + i2.ToString();
                Session["LastLoginTime"] = LasetLoginTime;
            }
            Com.Query = "insert into Login_Log values('" + Designation + "',getdate())";
            Com.Insert();
            //...END for login_log

            if (Session["Designation"].ToString().ToUpper() == "ADMIN")
                Response.Redirect("~/Admin/Admin_Home.aspx");

            else if (Session["Designation"].ToString().ToUpper() == "JOURNAL")
                Response.Redirect("~/Admin/Admin_Home.aspx");
        }
        else
        {
            string script = @"alert('Login Failed!');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "filesDeleted", script, true);
        }
    }
}