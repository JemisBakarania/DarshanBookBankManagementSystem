using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUser_AdminUserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            if (Session["AdminUserID"] != null)
            {
                AdminUserENT entAdminUser = new AdminUserENT();
                AdminUserBAL balAdminUser = new AdminUserBAL();
                entAdminUser = balAdminUser.SelectByUserID(Session["AdminUserID"].ToString().Trim());
                lblNameMassege.Text = Session["AdminUserName"].ToString().Trim();
                lblNameMassege2.Text = Session["AdminUserName"].ToString().Trim();
                lblNameMassege3.Text = Session["AdminUserName"].ToString().Trim();
                

                if (!entAdminUser.ProfilePicture.IsNull)
                {
                    imgProfile.ImageUrl = entAdminUser.ProfilePicture.ToString().Trim();
                    imgProfile2.ImageUrl = entAdminUser.ProfilePicture.ToString().Trim();
                }


                if (entAdminUser.InstituteName.ToString().Trim() != null)
                    lblInstitute.Text = entAdminUser.InstituteName.ToString().Trim();

                if (entAdminUser.BranchName.ToString().Trim() != null)
                    lblDepartment.Text = entAdminUser.BranchName.ToString().Trim();

                if (entAdminUser.CreationDate.ToString().Trim() != null)
                    lblRegisteredDate.Text = entAdminUser.CreationDate.ToString().Trim();

                if (entAdminUser.ModificationDate.ToString().Trim() != null)
                    lblUpdatedDate.Text = entAdminUser.ModificationDate.ToString().Trim();

                if (entAdminUser.Email.ToString().Trim() != null)
                    lblEmailDisplay.Text = entAdminUser.Email.ToString().Trim();

                if (entAdminUser.MobileNo.ToString().Trim() != null)
                    lblMobileNoDisplay.Text = entAdminUser.MobileNo.ToString().Trim();

                FillControls();

            }
            else
            {

                Response.Redirect("~/Login.aspx");
            }
        }
    }

    protected void Unnamed5_Click(object sender, EventArgs e)
    {

    }

    protected void FillControls()
    {
        AdminUserENT entAdminUser = new AdminUserENT();
        AdminUserBAL balAdminUser = new AdminUserBAL();
        entAdminUser = balAdminUser.SelectByUserID(Session["AdminUserID"].ToString().Trim());

        if (!entAdminUser.AdminUserName.IsNull)
            txtUserName.Text = entAdminUser.AdminUserName.Value.ToString();

        if (!entAdminUser.Password.IsNull)
            txtPassword.Text = entAdminUser.Password.Value.ToString();

        if (!entAdminUser.Email.IsNull)
            txtEmail.Text = entAdminUser.Email.Value.ToString();

        if (!entAdminUser.MobileNo.IsNull)
            txtMobileNo.Text = entAdminUser.MobileNo.Value.ToString();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        #region Server Side Validation

        String strErrorMessage = "";

        if (txtUserName.Text.Trim() == "")
            strErrorMessage += "Enter Name <br/>";

        if (txtEmail.Text.Trim() == "")
            strErrorMessage += "Enter Email <br/>";

        if (txtMobileNo.Text.Trim() == "")
            strErrorMessage += "Enter Mobile No <br/>";

        if (txtPassword.Text.Trim() == "")
            strErrorMessage += "Enter Password No <br/>";


        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
        }

        #endregion Server Side Validation 

        #region Collect Form Data

        AdminUserENT entAdminUser = new AdminUserENT();

        if (txtUserName.Text.Trim() != "")
            entAdminUser.AdminUserName = txtUserName.Text.Trim();

        if (txtEmail.Text.Trim() != "")
            entAdminUser.Email = txtEmail.Text.Trim();

        if (txtMobileNo.Text.Trim() != "")
            entAdminUser.MobileNo = txtMobileNo.Text.Trim();

        if (txtPassword.Text.Trim() != "")
            entAdminUser.Password = txtPassword.Text.Trim();

        if (Session["AdminUserID"] != null)
            entAdminUser.AdminUserID = Convert.ToInt32(Session["AdminUserID"]);

        #endregion Collect Form Data

        AdminUserBAL balAdminUser = new AdminUserBAL();

        if(balAdminUser.UpdateAdminUser(entAdminUser))
        {
            Response.Redirect("~/Login.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
        }
    }

    protected void btnUploadProfilepic_Click(object sender, EventArgs e)
    {
        if (fuAdminpic.HasFile)
        {
            String picpath = Server.MapPath("~/UploadData/ProfilePicture/");

            if (fuAdminpic.HasFile)
            {
                String fileExt = Path.GetExtension(fuAdminpic.FileName);
                if (fileExt.ToLower() == ".jpg" || fileExt.ToLower() == ".JPG" || fileExt.ToLower() == ".jpeg" || fileExt.ToLower() == ".JPEG" || fileExt.ToLower() == ".png" || fileExt.ToLower() == ".PNG")
                {
                    fuAdminpic.SaveAs(picpath + fuAdminpic.FileName);
                    String picname = "~/UploadData/ProfilePicture/" + fuAdminpic.FileName;
                    AdminUserENT entAdminUser = new AdminUserENT();
                    entAdminUser.ProfilePicture = picname;
                    AdminUserBAL balAdminUser = new AdminUserBAL();
                    if (balAdminUser.UpdateAdminUserProfilePicture(Convert.ToInt32(Session["AdminUserID"].ToString().Trim()), Convert.ToString(entAdminUser.ProfilePicture)))
                    {
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                        ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alert()", true);
                    }
                }
                else
                {
                    lblFileUploadMessge.Text = "Upload Only (.jpeg or .png) File";
                }
            }
        }
    }

    protected void Unnamed7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}