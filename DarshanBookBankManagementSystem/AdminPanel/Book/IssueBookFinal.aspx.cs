using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_IssueBookFinal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtReturnDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
    }




    protected void btnIssue_Click(object sender, EventArgs e)
    {
        #region Server Side Validation

        String strErrorMessage = "";

        if (txtEnrollmentNo.Text.Trim() == "")
            strErrorMessage += "Enter Enrollment No.";

        if (txtReturnDate.Text.Trim() == "")
            strErrorMessage += "Enter Date";

        if (strErrorMessage != "")
            lblMessage.Text = strErrorMessage;

        #endregion

        #region Collect Form Data

        BookIssueENT entBookIssue = new BookIssueENT();

        String EnrollmentNo = "";

        if (txtEnrollmentNo.Text.Trim() != "")
            EnrollmentNo = txtEnrollmentNo.Text.Trim();

        if (txtReturnDate.Text.Trim() != "")
            entBookIssue.BookDueDate = Convert.ToDateTime(txtReturnDate.Text.Trim());

        if (Session["AdminUserID"] != null)
            entBookIssue.IssuedByStaffID = Convert.ToInt32(Session["AdminUserID"]);

        #endregion

        StudentBAL balStudent = new StudentBAL();
        StudentENT entStudent = new StudentENT();

        entStudent = balStudent.SelectByEnrollmentNo(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]),EnrollmentNo);



        if (!entStudent.StudentID.IsNull)
            Session["StudentID"] = Convert.ToInt32(entStudent.StudentID.Value);

        if(Session["StudentID"] != null)
            entBookIssue.StudentID = Convert.ToInt32(Session["StudentID"]);
        else
        {
            lblMessage.Text = "Student Not Found.";
        }


        if (Session["BookCopyID"] !=null)
            entBookIssue.BookCopyID = Convert.ToInt32(Session["BookCopyID"]);

        if (Session["BookID"] != null)
            entBookIssue.BookID = Convert.ToInt32(Session["BookID"]);


        BookIssueBAL balBookIssue = new BookIssueBAL();
        if(balBookIssue.Insert(entBookIssue))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
            ClearAllValues();
            
        }
        
    }

    private void ClearAllValues()
    {
        txtEnrollmentNo.Text = "";
        txtReturnDate.Text = "";
        lblMessage.Text = "";
        Session["StudentID"] = null;
        //Session["BookCopyID"] = null;
        //Session["BookID"] = null;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}