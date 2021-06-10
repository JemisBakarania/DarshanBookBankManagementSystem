using DarshanBookBank;
using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillDropDownList();
        }
    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {

        #region Server Side Validation

        String strErrorMessage = "";

        if (txtName.Text.Trim() == "")
            strErrorMessage += "Enter Name <br/>";

        if (txtEmail.Text.Trim() == "")
            strErrorMessage += "Enter Email <br/>";

        if (txtPassword.Text.Trim() == "")
            strErrorMessage += "Enter Pasword <br/>";

        if (ddlInstitute.SelectedIndex == 0)
            strErrorMessage += "Select Institute <br/>";

        if (ddlBranch.SelectedIndex == 0)
            strErrorMessage += "Select Branch <br/>";

        if(strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
        }

        #endregion Server Side Validation 

        #region Collect Form Data

        AdminUserENT entAdminUser = new AdminUserENT();

        if (txtName.Text.Trim() != "")
            entAdminUser.AdminUserName = txtName.Text.Trim();

        if (txtPassword.Text.Trim() != "")
            entAdminUser.Password = txtPassword.Text.Trim();

        if (txtEmail.Text.Trim() != "")
            entAdminUser.Email = txtEmail.Text.Trim();

        if (txtMobile.Text.Trim() != "")
            entAdminUser.MobileNo = txtMobile.Text.Trim();

        if (ddlInstitute.SelectedIndex > 0)
            entAdminUser.InstituteID = Convert.ToInt32(ddlInstitute.SelectedValue);

        if (ddlBranch.SelectedIndex > 0)
            entAdminUser.BranchID = Convert.ToInt32(ddlBranch.SelectedValue);




        String picpath = Server.MapPath("~/UploadData/ProfilePicture/");

        if (fuAdminpic.HasFile)
        {
            String fileExt = Path.GetExtension(fuAdminpic.FileName);
            if(fileExt.ToLower() == ".jpg" || fileExt.ToLower() == ".JPG" || fileExt.ToLower() == ".jpeg" || fileExt.ToLower() == ".JPEG" || fileExt.ToLower() == ".png" || fileExt.ToLower() == ".PNG")
            {
                fuAdminpic.SaveAs(picpath+ fuAdminpic.FileName);
                String picname = "~/UploadData/ProfilePicture/" + fuAdminpic.FileName; 
                entAdminUser.ProfilePicture = picname;
            }
            else
            {
                lblFileUploadMessge.Text = "Upload Only (.jpeg or .png) File";
                return;
            }
        }

        #endregion Collect Form Data

        AdminUserBAL balAdminUser = new AdminUserBAL();
        
        if(balAdminUser.Insert(entAdminUser))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            ClearAllValues();

        }
        else
        {       
            lblMessage.Text = balAdminUser.Message;
        }
    }

    private void ClearAllValues()
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtMobile.Text = "";
        txtPassword.Text = "";
        txtReTypePassword.Text = "";
        ddlBranch.SelectedIndex = -1;
        ddlInstitute.SelectedIndex = -1;
        lblMessage.Text = "";
    }

    private void FillDropDownList()
    {
        CommanFillMethods.FillDropDownListInstitute(ddlInstitute);
        CommanFillMethods.FillDropDownListBranch(ddlBranch);
    }
}