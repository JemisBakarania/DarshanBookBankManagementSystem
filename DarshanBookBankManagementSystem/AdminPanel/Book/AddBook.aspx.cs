using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_AddBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
            if (Request.QueryString["BookID"] != null)
            {
                FillControls();
                lblTitle.Text = "Edit Subject";
                lblBread.Text = "Edit Subject";
                btnAdd.Text = "Update";
                btnAdd.CssClass = "btn btn-outline-warning";
                btnAddCopy.Visible = false;
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        

        #region Server Side Validation

        String strErrorMessage = "";

        if (txtBookTitle.Text.Trim() == "")
            strErrorMessage += "Enter The Book Title.";

        if (txtAuthor.Text.Trim() == "")
            strErrorMessage += "Enter The Author Name.";

        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
        }

        #endregion Server Side Validation

        #region Collect Form Data

        BookENT entBook = new BookENT();

        if (txtBookTitle.Text.Trim() != "")
            entBook.BookTitle = txtBookTitle.Text.Trim();

        if (txtAuthor.Text.Trim() != "")
            entBook.Author = txtAuthor.Text.Trim();

        if (txtDetails.Text.Trim() != "")
            entBook.Details = txtDetails.Text.Trim();

        if (Session["AdminUserID"] != null)
            entBook.AdminUserID = Convert.ToInt32(Session["AdminUserID"]);

        String picpath = Server.MapPath("~/UploadData/BookPicture/");
        if (fuBook.HasFile)
        {
            String fileExt = Path.GetExtension(fuBook.FileName);
            if (fileExt.ToLower() == ".jpg" || fileExt.ToLower() == ".JPG" || fileExt.ToLower() == ".jpeg" || fileExt.ToLower() == ".JPEG" || fileExt.ToLower() == ".png" || fileExt.ToLower() == ".PNG")
            {
                fuBook.SaveAs(picpath + fuBook.FileName);
                String picname = "~/UploadData/BookPicture/" + fuBook.FileName;
                entBook.Image = picname;
            }
            else
            {
                lblMessage.Text = "Upload Only(.jpeg or.png) File";
            }
        }

        #endregion Collect Form Data

        BookBAL balBook = new BookBAL();

        if(Request.QueryString["BookID"] == null)
        {
            if (balBook.Insert(entBook))
            {

                ClearAllValues();
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            }
            else
            {
                lblMessage.Text = balBook.Message;
            }
        }
        else
        {
            entBook.BookID = Convert.ToInt32(Request.QueryString["BookID"]);

            if (balBook.UpdateBook(entBook))
            {
                ClearAllValues();
                Response.Redirect("~/AdminPanel/Book/EditBook.aspx");
            }
            else
            {
                lblMessage.Text = balBook.Message;
            }
        }

        



    }

    private void ClearAllValues()
    {
        txtAuthor.Text = "";
        txtBookTitle.Text = "";
        txtDetails.Text = "";
        lblMessage.Text = "";
    }


    protected void btnAddCopy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/AddBookCopy.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/EditBook.aspx");
    }

    protected void FillControls()
    {
        BookBAL balBook = new BookBAL();
        BookENT entBook = new BookENT();

        entBook = balBook.ViewByBookID(Convert.ToInt32(Request.QueryString["BookID"]));

        if (!entBook.BookTitle.IsNull)
            txtBookTitle.Text = entBook.BookTitle.Value.ToString();

        if (!entBook.Author.IsNull)
            txtAuthor.Text = entBook.Author.Value.ToString();

        if (!entBook.Details.IsNull)
            txtDetails.Text = entBook.Details.Value.ToString();

    }
}