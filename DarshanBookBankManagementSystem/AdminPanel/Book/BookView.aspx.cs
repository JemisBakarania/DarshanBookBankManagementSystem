using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_BookList : System.Web.UI.Page
{
    #region Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillBookDetails();
        }
    }
    #endregion Load Event

  
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/IssueBookFinal.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void FillBookDetails()
    {
        BookViewENT entBookView = new BookViewENT();
        if (Session["Author"] != null)
            lblAuthorName.Text = Session["Author"].ToString().Trim();

        if (Session["BookCopyNo"] != null)
            lblBookCopyNo.Text = Session["BookCopyNo"].ToString().Trim();

        if (Session["Details"] != null)
            lblBookDetails.Text = Session["Details"].ToString().Trim();

        if (Session["BookTitle"] != null)
            lblBookName.Text = Session["BookTitle"].ToString().Trim();

        if (Session["Image"] != null)
            imgBook.ImageUrl = Session["Image"].ToString().Trim();

        ClearAllValues();
    }

    private void ClearAllValues()
    {
        Session["Author"] = null;
        Session["BookCopyNo"] = null;
        Session["Details"] = null;
        Session["BookTitle"] = null;
        Session["Image"] = null;
        //Session["BookCopyID"] = null;
        //Session["BookID"] = null;
    }
}