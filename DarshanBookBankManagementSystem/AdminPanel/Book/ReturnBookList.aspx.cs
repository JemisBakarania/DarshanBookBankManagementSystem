using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_ReturnBookList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        #region Read And Collect Data


        BookIssueENT entBookIssue = new BookIssueENT();
        if (txtDetails.Text.Trim() != "")
            entBookIssue.ReturnRemarks = txtDetails.Text.Trim();

        if (Session["AdminUserID"] != null)
            entBookIssue.ReturnByStaffID = Convert.ToInt32(Session["AdminUserID"]);

        if (Session["BookCopyID"] != null)
            entBookIssue.BookCopyID = Convert.ToInt32(Session["BookCopyID"]);

        #endregion

        BookIssueBAL balBookIssue = new BookIssueBAL();
        if(balBookIssue.BookReturn(entBookIssue))
        {
            
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            ClearAllValues();
            Response.Redirect("~/HomePage.aspx");
        }
    }

    private void ClearAllValues()
    {
        txtDetails.Text = "";
        lblMessage.Text = "";
    }
}