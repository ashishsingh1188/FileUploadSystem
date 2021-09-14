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

public partial class CS2 : System.Web.UI.Page
{
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
                btnLogin.Enabled = false;
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }
    }

    protected void Login(object sender, EventArgs e)
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
}