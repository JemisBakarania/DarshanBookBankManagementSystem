using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_ViewBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBookTitle.ReadOnly = true;
        txtAuthor.ReadOnly = true;
        txtDetails.ReadOnly = true;
        if(!Page.IsPostBack)
        {
            if (Request.QueryString["BookCopyID"] != null)
            { 
                FillControls();
            }
        }

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Student/ViewStudentProfile.aspx");
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {

    }

    protected void btnUploadPic_Click(object sender, EventArgs e)
    {
        #region Server Side Validation

        String strErrorMessage = "";

        if (txtAuthor.Text.Trim() == "")
            strErrorMessage += "Enter Author Name";

        if (txtBookCopyNo.Text.Trim() == "")
            strErrorMessage += "Enter BookCopy No";

        if (txtBookTitle.Text.Trim() == "")
            strErrorMessage += "Enter BookTitle";

        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
            return;
        }

        #endregion Server Side Validation

        #region Collect Form Data

        BookViewENT entBookView = new BookViewENT();

        if (txtAuthor.Text.Trim() != "")
            entBookView.Author = txtAuthor.Text.Trim();

        if (txtBookCopyNo.Text.Trim() != "")
            entBookView.BookCopyNo = txtBookCopyNo.Text.Trim();

        if (txtBookTitle.Text.Trim() != "")
            entBookView.BookTitle = txtBookTitle.Text.Trim();

        if (txtDetails.Text.Trim() != "")
            entBookView.Details = txtDetails.Text.Trim();

        #endregion Collect Form Data

        BookCopyBAL balBookCopy = new BookCopyBAL();

        if (Request.QueryString["BookCopyID"] != null)
        {
            entBookView.BookCopyID = Convert.ToInt32(Request.QueryString["BookCopyID"]);
            if(balBookCopy.UpdateBook(entBookView))
            {
                Response.Redirect("~/AdminPanel/Book/EditBook.aspx");
            }
            else
            {
                lblMessage.Text = balBookCopy.Message;
            }
        }
    }

    protected void FillControls()
    {
        BookCopyBAL balBookCopy = new BookCopyBAL();
        BookViewENT entBookView = new BookViewENT();

        entBookView = balBookCopy.ViewByBookCopyID(Convert.ToInt32(Request.QueryString["BookCopyID"]));

        if (!entBookView.BookCopyNo.IsNull)
            txtBookCopyNo.Text = Convert.ToString(entBookView.BookCopyNo);

        if (!entBookView.BookTitle.IsNull)
            txtBookTitle.Text = Convert.ToString(entBookView.BookTitle);

        if (!entBookView.Details.IsNull)
            txtDetails.Text = Convert.ToString(entBookView.Details);

        if (!entBookView.Author.IsNull)
            txtAuthor.Text = Convert.ToString(entBookView.Author);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/EditBook.aspx");
    }
}