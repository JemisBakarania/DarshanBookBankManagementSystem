using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_MasterBookUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["BookID"] != null)
            {
                FillControls();
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
}