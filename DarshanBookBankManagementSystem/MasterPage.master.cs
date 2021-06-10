using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            if(Session["AdminUserID"]!=null)
            {
                lblNameMassege.Text = Session["AdminUserName"].ToString().Trim();

                if (Session["ProfilePicture"] != null)
                    imgProfile.ImageUrl = Session["ProfilePicture"].ToString().Trim();
            }
            else
            {
                
                Response.Redirect("~/Login.aspx");
            }
        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
}
