using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        #region Server Side Validation 

        String strErrorMessage = "";

        if (txtName.Text.Trim() == "")
            strErrorMessage += "Enter Admin User Name";

        if (txtPassword.Text.Trim() == "")
            strErrorMessage += "Enter Password";

        if (strErrorMessage != "")
            lblMessage.Text = strErrorMessage;

        #endregion

        #region Collect Form Data

        AdminUserENT entAdminUser = new AdminUserENT();

        if (txtName.Text.Trim() != "")
            entAdminUser.AdminUserName = txtName.Text.Trim();

        if (txtPassword.Text.Trim() != "")
            entAdminUser.Password = txtPassword.Text.Trim();

        #endregion

        
            FillControls(entAdminUser.AdminUserName, entAdminUser.Password);     
         
        
    }

    #region Fill Controls
    private void FillControls(SqlString AdminUsername, SqlString Password)
    {
        AdminUserENT entAdminUser = new AdminUserENT();
        AdminUserBAL balAdminUser = new AdminUserBAL();

        entAdminUser = balAdminUser.SelectByUsernamePassword(AdminUsername, Password);
        if (!entAdminUser.AdminUserID.IsNull)
        {
            Session["AdminUserID"] = Convert.ToInt32(entAdminUser.AdminUserID.Value);
        }
        else
        {
            lblMessage.Text = "Invalid Username or Password";
            return;
        }
        if (!entAdminUser.AdminUserName.IsNull)
        {
            Session["AdminUserName"] = entAdminUser.AdminUserName.Value.ToString();
        }

        if (!entAdminUser.InstituteID.IsNull)
        {
            Session["InstituteID"] = Convert.ToInt32(entAdminUser.InstituteID.Value);
        }

        if(!entAdminUser.BranchID.IsNull)
        {
            Session["BranchID"] = Convert.ToInt32(entAdminUser.BranchID.Value);
        }

        if(!entAdminUser.ProfilePicture.IsNull)
        {
            Session["ProfilePicture"] = Convert.ToString(entAdminUser.ProfilePicture.Value);
        }


        Response.Redirect("~/HomePage.aspx");

    }

    #endregion Fill Controls
}