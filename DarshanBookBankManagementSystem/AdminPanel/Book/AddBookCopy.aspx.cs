using DarshanBookBank;
using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_BookCopy : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillDropDownList();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        #region Server Side Validaiton

        String strErrorMessage = "";

        if (txtBookSerialNo.Text.Trim() == "")
            strErrorMessage += "Enter The Book Serial No.";

        if (ddlBook.SelectedIndex < 0)
            strErrorMessage += "Select Book";

        if (strErrorMessage != "")
            lblMessage.Text = strErrorMessage;

        #endregion Server Side Validaiton

        #region Collect Form Data

        BookCopyENT entBookCopy = new BookCopyENT();

        if (ddlBook.SelectedIndex > 0)
            entBookCopy.BookID = Convert.ToInt32(ddlBook.SelectedValue);

        if (txtBookSerialNo.Text.Trim() != "")
            entBookCopy.BookCopyNo = txtBookSerialNo.Text.Trim();

        if (Session["AdminUserID"] != null)
            entBookCopy.AdminUserID = Convert.ToInt32(Session["AdminUserID"]);

        #endregion Collect Form Data

        BookCopyBAL balBookCopy = new BookCopyBAL();
        if(balBookCopy.Insert(entBookCopy))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            ClearAllValues();
        }
        else
        {
            lblMessage.Text = balBookCopy.Message;
        }

        
    }

    protected void btnDone_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Book/BookInventory.aspx");
    }

    private void FillDropDownList()
    {
        int InstituteID = Convert.ToInt32(Session["InstituteID"]);
        int BranchID = Convert.ToInt32(Session["BranchID"]);

        CommanFillMethods.FillDropDownListBook(ddlBook, InstituteID, BranchID);
    }

    private void ClearAllValues()
    {
        txtBookSerialNo.Text = "";
        ddlBook.SelectedIndex = -1;
        lblMessage.Text = "";
    }
}