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

public partial class DownloadPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["target"].ToString());
    CommonDB db = new CommonDB();
    string uname = "";
    SqlCommand cmd;

    string FileExt = "";
    byte[] Filebyte = null;


    JournalDataSet jds = new JournalDataSet();
 
    protected void getAllDownloadedFiles(string id)
    {
        try
        {
            JournalDataSetTableAdapters.tblDownloadTableAdapter dda = new JournalDataSetTableAdapters.tblDownloadTableAdapter();
            dda.FillByJournalId(jds.tblDownload, int.Parse(id));

            GridViewFiles.DataSource = jds.tblDownload;
            GridViewFiles.DataBind();
        }
        catch (Exception ex) { }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["Uname"].ToString();
        string ID = GetID(uname);
        if (ID == "")
        {
            ID = ddlJournalist.SelectedValue.ToString();
        }
        if (!Page.IsPostBack)
        {
            BindJournalist();
            getAllDownloadedFiles(ID);
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
            
        }
    }
  

    protected void setClear()
    {
        ddlJournalist.SelectedIndex = 0;
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string ID = GetID(uname);
        if (ID == "")
        {
            ID = ddlJournalist.SelectedValue.ToString();
        }
        try
        {
            HttpFileCollection filecolln = Request.Files;

            for (int i = 1; i <= filecolln.Count; i++)
            {
                HttpPostedFile file = filecolln[i - 1];


                if (file.ContentLength > 0)
                {
                    FileInfo fileinf = new FileInfo(file.FileName);
                    FileExt = fileinf.Extension;
                    if (FileExt == ".pdf" || FileExt == ".docx" || FileExt == ".txt" || FileExt == ".jpg")
                    {
                        //getting length of uploaded file
                        int length = file.ContentLength;
                        //create a byte array to store the binary image data
                        Filebyte = new byte[length];
                        //store the currently selected file in memeory
                        HttpPostedFile pdfFile = file;
                        //set the binary data
                        pdfFile.InputStream.Read(Filebyte, 0, length);

                        //save in tblDownload
                        //if (chckDwnload(int.Parse(ID)))
                        //{
                        string Title = Request.Form["txt" + i];
                        cmd = new SqlCommand("insert into tblDownload (JournalId,Title,DwnFile,DwnExt,DwnDate) values(@JournalId,@Title,@DwnFile,@DwnExt,@DwnDate)", con);
                        cmd.Parameters.AddWithValue("@JournalId", int.Parse(ID));
                        cmd.Parameters.AddWithValue("@Title", Title);
                        cmd.Parameters.AddWithValue("@DwnFile", Filebyte);
                        cmd.Parameters.AddWithValue("@DwnExt", FileExt);
                        cmd.Parameters.AddWithValue("@DwnDate", System.DateTime.Now.Date);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        //file.SaveAs(ConfigurationManager.AppSettings["FilePath"] + System.IO.Path.GetFileName(file.FileName));
                    }
                }
            }

            lblMessage.Text = "Uploaded Successfully!";
            getAllDownloadedFiles(ID);
        }

        catch (Exception ex)
        {
            //lblMessage.Text = ex.Message;
        }
        finally { }
    }
    protected bool chckDwnload(int id)
    {
        db.Query = "select * from tblDownload where JournalId="+id+"";
        DataTable dtdwn = db.FetchToDataBase();
        if (dtdwn.Rows.Count > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    protected void GridViewFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            db.Query = "delete from tblDownload where DwnId='" + GridViewFiles.DataKeys[e.RowIndex].Value + "'";
            db.Delete();
                ID = ddlJournalist.SelectedValue.ToString();
            getAllDownloadedFiles(ID);

            string script = @"alert('Delete Sucessful!');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "filesDeleted", script, true);
        }
        catch
        {
            string script = @"alert('Can Not Delete File!');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "filesDeleted", script, true);
        }
    }
    protected void ddlJournalist_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlJournalist.SelectedIndex > 0)
        {
            ID = ddlJournalist.SelectedValue.ToString();
            getAllDownloadedFiles(ID);
        }
    }
}