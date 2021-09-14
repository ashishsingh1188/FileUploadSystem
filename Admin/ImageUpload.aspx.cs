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
using System.Collections.Generic;



public partial class Admin_ImageUpload : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["target"].ToString());
    CommonDB db = new CommonDB();
    string uname = "";
    SqlCommand cmd;

    string FileExt = "";
   

    JournalDataSet jds = new JournalDataSet();
    JournalDataSetTableAdapters.tblDetailTableAdapter jda = new JournalDataSetTableAdapters.tblDetailTableAdapter();
    
    protected void getAllDownloadedFiles(string id)
    {
        try
        {
            JournalDataSetTableAdapters.tblDownloadTableAdapter dda = new JournalDataSetTableAdapters.tblDownloadTableAdapter();
            dda.FillByJournalId(jds.tblDownload, int.Parse(id));
        }
        catch (Exception ex)
        {
        }
        finally{}
        //GridViewFiles.DataSource = jds.tblDownload;
        //GridViewFiles.DataBind();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["Uname"].ToString();
        string ID = GetID(uname);
        //getAllDownloadedFiles(ID);
        if (!Page.IsPostBack)
        {
            //BindJournalist();
            getAllDownloadedFiles(ID);
        }
        ListImages();
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
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string ID = GetID(uname);
       
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
                    if (FileExt == ".gif" || FileExt == ".jpeg" || FileExt == ".jpg")
                    {
                        string FilePath = Server.MapPath("UploadedImages");
                        string FileComplete = FilePath + "\\" + System.IO.Path.GetFileName(file.FileName);

                        file.SaveAs(FileComplete);

                    }
                }
            }

            lblMessage.Text = "Uploaded Successfully!";
            ListImages();
        }

        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
    private void ListImages()
    {
        DirectoryInfo dir = new DirectoryInfo(MapPath("~/Admin/UploadedImages"));
        FileInfo[] file = dir.GetFiles();
        ArrayList list = new ArrayList();
        DataTable Dt = new DataTable();

        Dt.Columns.Add("Image"); Dt.Columns.Add("Path");
        int i = 0;
        foreach (FileInfo file2 in file)
        {
            if (file2.Extension == ".jpg" || file2.Extension == ".jpeg" || file2.Extension == ".gif")
            {
                list.Add(file2);
                DataRow Dr = Dt.NewRow();
                Dr["Image"] = "~/Admin/UploadedImages/" + list[i].ToString();
                Dr["Path"] = Server.MapPath("Admin/UploadedImages/") + list[i].ToString();
                Dt.Rows.Add(Dr);
                i++;

            }
        }
        DataList1.DataSource = Dt;
        DataList1.DataBind();
    }
}
