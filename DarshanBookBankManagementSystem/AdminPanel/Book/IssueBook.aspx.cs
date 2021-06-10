using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_Book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lnbtnViewAll.Visible = false;
        pnlBook.Visible = false;
        pnlBookCopy.Visible = false;
        if (!Page.IsPostBack)
        {
            ViewAllBook();
            //FillGridView(Convert.ToInt32(Session["AdminUserID"]), Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));
        }
    }



    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    string BookCopyNo = "";
    //    if (txtBookSerialNo.Text.Trim() != "")
    //        BookCopyNo = txtBookSerialNo.Text.Trim();

    //    pnlBookCopy.Visible = true;
    //    BookCopyBAL balBookCopy = new BookCopyBAL();
    //    DataTable dtBook = new DataTable();
    //    dtBook = balBookCopy.SelectByUserIDByBookCopyNo(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), BookCopyNo);

    //    if (dtBook != null && dtBook.Rows.Count > 0)
    //    {
    //        gvBookCopy.DataSource = dtBook;
    //        gvBookCopy.DataBind();
    //        lblErrorMessage.Text = "";
    //    }
    //    else
    //    {
    //        pnlBookCopy.Visible = false;
    //        lblErrorMessage.Text = "No Record Found";
    //    }
    //}

    //protected void btnViewAll_Click(object sender, EventArgs e)
    //{
    //    lblErrorMessage.Text = "";
    //    pnlBook.Visible = true;
    //    BookCopyBAL balBookCopy = new BookCopyBAL();
    //    DataTable dtBook = new DataTable();
    //    dtBook = balBookCopy.SelectByUserID(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

    //    if (dtBook != null && dtBook.Rows.Count > 0)
    //    {
    //        gvBook.DataSource = dtBook;
    //        gvBook.DataBind();
    //    }
    //}

    protected void ViewAllBook()
    {
        lblErrorMessage.Text = "";
        pnlBook.Visible = true;
        BookCopyBAL balBookCopy = new BookCopyBAL();
        DataTable dtBook = new DataTable();
        dtBook = balBookCopy.SelectByUserID(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtBook != null && dtBook.Rows.Count > 0)
        {
            gvBook.DataSource = dtBook;
            gvBook.DataBind();
        }
    }

    protected void gvBookCopy_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "IssueBook")
        {
            if (e.CommandArgument != null)
            {

                BookCopyBAL balBookCopy = new BookCopyBAL();
                BookCopyENT entBookCopy = new BookCopyENT();

                entBookCopy = balBookCopy.SelectByBookCopyID(Convert.ToInt32(e.CommandArgument.ToString().Trim()));

                if (!entBookCopy.BookCopyID.IsNull)
                    Session["BookCopyID"] = Convert.ToInt32(entBookCopy.BookCopyID.Value);

                if (!entBookCopy.BookID.IsNull)
                    Session["BookID"] = Convert.ToInt32(entBookCopy.BookID.Value);

                Response.Redirect("~/AdminPanel/Book/IssueBookFinal.aspx");

            }

        }
        else if (e.CommandName == "ViewBook")
        {
            BookCopyBAL balBookCopy = new BookCopyBAL();
            BookViewENT entBookView = new BookViewENT();

            entBookView = balBookCopy.ViewByBookCopyID(Convert.ToInt32(e.CommandArgument.ToString().Trim()));

            if (!entBookView.BookCopyID.IsNull)
                Session["BookCopyID"] = Convert.ToInt32(entBookView.BookCopyID.Value);

            if (!entBookView.BookCopyNo.IsNull)
                Session["BookCopyNo"] = Convert.ToString(entBookView.BookCopyNo.Value);

            if (!entBookView.BookTitle.IsNull)
                Session["BookTitle"] = Convert.ToString(entBookView.BookTitle.Value);

            if (!entBookView.Details.IsNull)
                Session["Details"] = Convert.ToString(entBookView.Details.Value);

            if (!entBookView.Image.IsNull)
                Session["Image"] = Convert.ToString(entBookView.Image.Value);

            if (!entBookView.Author.IsNull)
                Session["Author"] = Convert.ToString(entBookView.Author.Value);
            Response.Redirect("~/AdminPanel/Book/BookView.aspx");
        }
    }


    protected void lnbtnSearch_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";
        string BookCopyNo = "";
        if (txtBookSerialNo.Text.Trim() != "")
            BookCopyNo = txtBookSerialNo.Text.Trim();

        pnlBookCopy.Visible = true;
        BookCopyBAL balBookCopy = new BookCopyBAL();
        DataTable dtBook = new DataTable();
        dtBook = balBookCopy.SelectByUserIDByBookCopyNo(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), BookCopyNo);

        if (dtBook != null && dtBook.Rows.Count > 0)
        {
            gvBookCopy.DataSource = dtBook;
            gvBookCopy.DataBind();
            lblErrorMessage.Text = "";
            lnbtnViewAll.Visible = true;
        }
        else
        {
            pnlBookCopy.Visible = false;
            lblErrorMessage.Text = "No Record Found";
        }
    }

    protected void lnbtnViewAll_Click(object sender, EventArgs e)
    {
        txtBookSerialNo.Text = "";
        lblErrorMessage.Text = "";
        pnlBook.Visible = true;
        BookCopyBAL balBookCopy = new BookCopyBAL();
        DataTable dtBook = new DataTable();
        dtBook = balBookCopy.SelectByUserID(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtBook != null && dtBook.Rows.Count > 0)
        {
            gvBook.DataSource = dtBook;
            gvBook.DataBind();
        }
    }
}