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

public partial class AdminPanel_Book_EditBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lnbtnViewAll.Visible = false;
        lnbtnUpdateBookCopy.Visible = false;
        pnlBook.Visible = true;
        pnlBookCopy.Visible = false;
        pnlSubject.Visible = false;
        if (!Page.IsPostBack)
        {
            ViewAllBook();
            //FillGridView(Convert.ToInt32(Session["AdminUserID"]), Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));
        }
    }

    //protected void btnView_Click(object sender, EventArgs e)
    //{
        

    //    Response.Redirect("~/AdminPanel/Book/BookView.aspx");
    //}

    //private void FillGridView(SqlInt32 AdminUserID, SqlInt32 InstituteID, SqlInt32 BranchID)
    //{

    //}

 

    protected void gvBookCopy_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "ViewBook")
        {
            BookCopyBAL balBookCopy = new BookCopyBAL();
            BookViewENT entBookView = new BookViewENT();

            entBookView = balBookCopy.ViewByBookCopyNo(Convert.ToInt32(e.CommandArgument.ToString().Trim()));

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
        else if(e.CommandName == "DeleteBook")
        {
            if(e.CommandArgument != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
                BookCopyBAL balBookCopy = new BookCopyBAL();
                if(balBookCopy.DeleteBookCopy(Convert.ToInt32(e.CommandArgument.ToString().Trim())))
                {
                    
                    ViewAllBook();
                }
                else
                {
                    lblErrorMessage.Text = balBookCopy.Message;
                }
            }
        }
    }

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





    protected void lnbtnViewAll_Click(object sender, EventArgs e)
    {
        txtBookSerialNo.Text = "";
        lblErrorMessage.Text = "";
        pnlBookCopy.Visible = false;
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

    protected void lnbtnSearch_Click(object sender, EventArgs e)
    {
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
            pnlBook.Visible = false;
            lnbtnViewAll.Visible = true;
        }
        else
        {
            lnbtnViewAll.Visible = true;
            pnlBook.Visible = false;
            pnlBookCopy.Visible = false;
            lblErrorMessage.Text = "No Record Found";
        }
    }


    protected void lnbtnAddNewBook_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/AddBook.aspx");
    }

    protected void lnbtnUpdateSubject_Click(object sender, EventArgs e)
    {
        txtBookSerialNo.Text = "Can't Search...";
        txtBookSerialNo.ReadOnly = true;
        lnbtnSearch.Visible = false;
        lnbtnUpdateBookCopy.Visible = true;
        lnbtnUpdateSubject.Visible = false;
        lblErrorMessage.Text = "";
        pnlBook.Visible = false;
        pnlBookCopy.Visible = false;
        pnlSubject.Visible = true;
        BookBAL balBookCopy = new BookBAL();
        DataTable dtBook = new DataTable();
        dtBook = balBookCopy.SelectByBookID(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtBook != null && dtBook.Rows.Count > 0)
        {
            gvSubject.DataSource = dtBook;
            gvSubject.DataBind();
        }
    }

    protected void lnbtnUpdateBookCopy_Click(object sender, EventArgs e)
    {
        lnbtnUpdateSubject.Visible = true;
        lnbtnUpdateBookCopy.Visible = false;
        txtBookSerialNo.ReadOnly = false;
        txtBookSerialNo.Text = "Book Serial No....";
        lnbtnSearch.Visible = true;
        pnlBook.Visible = true;
    }

    protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandArgument != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            BookBAL balBookCopy = new BookBAL();
            if (balBookCopy.DeleteBook(Convert.ToInt32(e.CommandArgument.ToString().Trim())))
            {

                ViewAllSubject();
            }
            else
            {
                lblErrorMessage.Text = balBookCopy.Message;
            }
        }
    }

    protected void ViewAllSubject()
    {
        txtBookSerialNo.Text = "Can't Search...";
        txtBookSerialNo.ReadOnly = true;
        lnbtnSearch.Visible = false;
        lnbtnUpdateBookCopy.Visible = true;
        lnbtnUpdateSubject.Visible = false;
        lblErrorMessage.Text = "";
        pnlBook.Visible = false;
        pnlBookCopy.Visible = false;
        pnlSubject.Visible = true;
        BookBAL balBookCopy = new BookBAL();
        DataTable dtBook = new DataTable();
        dtBook = balBookCopy.SelectByBookID(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtBook != null && dtBook.Rows.Count > 0)
        {
            gvSubject.DataSource = dtBook;
            gvSubject.DataBind();
        }
    }
}