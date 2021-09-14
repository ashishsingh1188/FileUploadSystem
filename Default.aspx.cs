using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Configuration;

using ASPSnippets.FaceBookAPI;

public partial class AdminNew_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DocumentUpload"].ToString());

    string dep = "";
    InsertUpdateDelete Com = new InsertUpdateDelete();
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "<Google Client ID>";
        GoogleConnect.ClientSecret = "<Google Client Secret>";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

        if (!this.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                lblId.Text = profile.Id;
                lblName.Text = profile.Name;
                lblEmail.Text = profile.Email;
                lblVerified.Text = profile.Verified_Email;
                ProfileImage.ImageUrl = profile.Picture;
                pnlProfile.Visible = true;
                ImageButton1.Enabled = false;
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }




            FaceBookConnect.API_Key = "<Your API Key>";
            FaceBookConnect.API_Secret = "<Your API Secret>";
            if (!IsPostBack)
            {
                if (Request.QueryString["error"] == "access_denied")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                    return;
                }

                string code = Request.QueryString["code"];
                if (!string.IsNullOrEmpty(code))
                {
                    string data = FaceBookConnect.Fetch(code, "me?fields=id,name,email");
                    FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                    faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);
                    pnlProfile.Visible = true;
                    lblId.Text = faceBookUser.Id;
                    lblUserName.Text = faceBookUser.UserName;
                    lblName.Text = faceBookUser.Name;
                    lblEmail.Text = faceBookUser.Email;
                    ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                    ImageButton2.Enabled = false;
                }
            }
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
          GoogleConnect.Authorize("profile", "ashishsngh97@gmail.com");

    }

    protected void Clear(object sender, EventArgs e)
    {
        GoogleConnect.Clear(Request.QueryString["code"]);
    }

    public class GoogleProfile
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public string Email { get; set; }
        public string Verified_Email { get; set; }
    }

    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string PictureUrl { get; set; }
        public string Email { get; set; }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
}