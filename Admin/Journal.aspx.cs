using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class Admin_Journal : System.Web.UI.Page
{
    string uname = "";
    int id;
    CommonDB db = new CommonDB();
    JournalDataSet jds = new JournalDataSet();
    JournalDataSetTableAdapters.tblJournalMasterTableAdapter jda = new JournalDataSetTableAdapters.tblJournalMasterTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        uname = Session["Uname"].ToString();
        if (uname != "ADMIN")
        {
            string ID = GetID(uname);
            btnDelete.Visible = false;
        }
        else
        {
            uname = "ADMIN";
            btnDelete.Visible = true;
        }
        if (!IsPostBack)
        {
            FillAllJournal(uname);
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
    protected void FillAllJournal(string name)
    {
        ddlJournal.Items.Clear();
        DataTable dtjournal;
        if (name == "ADMIN")
        {
            db.Query = "select a.Id,a.Name,d.Title from tblJournalMaster as a LEFT OUTER JOIN tblDetail AS d on  a.Id=d.Id";
            dtjournal = db.FetchToDataBase();
            ddlJournal.Items.Add("Select");
        }
        else
        {
            string ID = GetID(name);
            db.Query = "select a.Id,a.Name,d.Title from tblJournalMaster as a LEFT OUTER JOIN tblDetail AS d on a.Id=d.Id where a.Id=" + ID + "";
            dtjournal = db.FetchToDataBase();
        }

        if (dtjournal.Rows.Count > 0)
        {
           
            for (int i = 0; i < dtjournal.Rows.Count; i++)
            {
                ListItem li = new ListItem(dtjournal.Rows[i]["Name"].ToString() + " - " + dtjournal.Rows[i]["Title"].ToString(), dtjournal.Rows[i]["Id"].ToString());
                ddlJournal.Items.Add(li);
            }
            FillJournalDetails();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (HiddenField1.Value != "")
        {
            #region Comment Code
            //if (uname == "ADMIN")
            //{
            //    jda.FillByID(jds.tblJournalMaster, int.Parse(HiddenField1.Value));
            //    jda.UpdateQuery(txtName.Text, txtMobile.Text, txtAddress.Text, txtEmailId.Text, txtCity.Text, txtPincode.Text, int.Parse(HiddenField1.Value.ToString()));
            //}
            //else
            //{
            #endregion
            jda.FillByID(jds.tblJournalMaster, int.Parse(HiddenField1.Value));
            if (txtPassword.Text != string.Empty && txtConfirmPass.Text != string.Empty && txtOldPassword.Text != string.Empty)
            {
                if (jds.tblJournalMaster.Rows[0]["Password"].ToString() == txtOldPassword.Text)
                {
                    jda.UpdateQuerywithPassword(txtName.Text, txtMobile.Text, txtAddress.Text, txtEmailId.Text, txtCity.Text, txtPincode.Text, txtPassword.Text, int.Parse(HiddenField1.Value.ToString()));
                }
                else
                {
                    string scriptmsg = @"alert('Enter Correct Password');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", scriptmsg, true);
                }
            }
            else
            {
                jda.UpdateQuery(txtName.Text, txtMobile.Text, txtAddress.Text, txtEmailId.Text, txtCity.Text, txtPincode.Text, int.Parse(HiddenField1.Value.ToString()));
            }
            //}
            string script = @"alert('Journal updated successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
            clearForm();
            FillJournalDetails();
        }
        else
        {
            if (uname == "ADMIN")
            {
                if (ddlJournal.SelectedIndex == 0)
                {
                    if (lblStatus.Text == "UserName Available")
                    {
                        jda.InsertQuery(txtName.Text, txtMobile.Text, txtAddress.Text, txtEmailId.Text, txtCity.Text, txtPincode.Text, txtUserName.Text, txtPassword.Text);

                        string script = @"alert('Journal created successfully');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Confirmation", script, true);
                        HiddenField1.Value = "";
                        clearForm();
                    }
                }
            }
        }

        FillAllJournal(uname);

    }
    protected void clearForm()
    {
        txtName.Text = "";
        txtMobile.Text = "";
        txtAddress.Text = "";
        txtEmailId.Text = "";
        txtCity.Text = "";
        txtPincode.Text = "";
        txtUserName.Text = "";
        txtPassword.Text = "";
        ddlJournal.SelectedIndex = 0;
        HiddenField1.Value = "";
        txtUserName.ReadOnly = false;
        txtOldPassword.Text = "";
        lblStatus.Text = "";
    }
    protected void ddlJournal_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillJournalDetails();
    }
    protected void FillJournalDetails()
    {
        if (ddlJournal.SelectedItem.Text != "Select")
        {
            jda.FillByID(jds.tblJournalMaster, int.Parse(ddlJournal.SelectedValue));
            if (jds.tblJournalMaster.Rows.Count > 0)
            {
                HiddenField1.Value = jds.tblJournalMaster.Rows[0]["Id"].ToString();
                txtName.Text = jds.tblJournalMaster.Rows[0]["Name"].ToString();
                txtMobile.Text = jds.tblJournalMaster.Rows[0]["Mobile"].ToString();
                txtAddress.Text = jds.tblJournalMaster.Rows[0]["Address"].ToString();
                txtEmailId.Text = jds.tblJournalMaster.Rows[0]["EmailId"].ToString();
                txtCity.Text = jds.tblJournalMaster.Rows[0]["City"].ToString();
                txtPincode.Text = jds.tblJournalMaster.Rows[0]["Pincode"].ToString();
                txtUserName.Text = jds.tblJournalMaster.Rows[0]["UserName"].ToString();
                if (uname == "ADMIN")
                {
                    txtOldPassword.TextMode = TextBoxMode.SingleLine;
                    txtOldPassword.Text = jds.tblJournalMaster.Rows[0]["Password"].ToString();
                }

                txtUserName.ReadOnly = true;
            }
            else
            {
                HiddenField1.Value = "";
                txtName.Text = "";
                txtMobile.Text = "";
                txtAddress.Text = "";
                txtEmailId.Text = "";
                txtCity.Text = "";
                txtPincode.Text = "";
                txtUserName.Text = "";
                txtOldPassword.Text = "";
            }
        }
        else
        {
            clearForm();
        }
    }

    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtUserName.Text))
        {
            db.Query = "select * from tblJournalMaster where UserName='" + txtUserName.Text + "'";
            DataTable dtuser = db.FetchToDataBase();
            if (dtuser.Rows.Count > 0)
            {
                checkusername.Visible = true;
                lblStatus.Text = "UserName Already Taken";
                lblStatus.ForeColor = Color.Red;
                id = int.Parse(dtuser.Rows[0]["Id"].ToString());
            }
            else
            {
                id = 0;
                checkusername.Visible = true;
                lblStatus.Text = "UserName Available";
                lblStatus.ForeColor = Color.Green;
            }
        }
        else
        {
            checkusername.Visible = false;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (uname == "ADMIN")
        {
                db.Query = "delete from tblDetail where Id='" + HiddenField1.Value.ToString() + "'";
                db.Delete();

                db.Query = "delete from tblDownload where JournalId='" + HiddenField1.Value.ToString() + "'";
                db.Delete();

                db.Query = "delete from  tblJournalMaster where Id='" + HiddenField1.Value.ToString() + "'";
                db.Delete();
                FillAllJournal(uname);

        }
    }

}