using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Student_ViewStudentProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillStudentDetails();
            FillGridView();
           
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void gvStudentByEnrollmentNo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Return")
        {
            if (e.CommandArgument != null)
            {
                BookCopyBAL balBookCopy = new BookCopyBAL();
                BookCopyENT entBookCopy = new BookCopyENT();

                entBookCopy = balBookCopy.SelectByBookCopyNo(Convert.ToString(e.CommandArgument.ToString().Trim()));

                if (!entBookCopy.BookCopyID.IsNull)
                    Session["BookCopyID"] = Convert.ToInt32(entBookCopy.BookCopyID.Value);

                Response.Redirect("~/AdminPanel/Book/ReturnBookList.aspx");
            }
        }
    }

    protected void FillGridView()
    {
        BookIssueBAL balBookIssue = new BookIssueBAL();
        DataTable dtStudent = new DataTable();
        dtStudent = balBookIssue.SelectByEnrollemntNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), Convert.ToString(Session["EntrollmentNo"]));

        if (dtStudent != null && dtStudent.Rows.Count > 0)
        {
            gvStudentByEnrollmentNo.DataSource = dtStudent;
            gvStudentByEnrollmentNo.DataBind();
            lblErrorMessage.Text = "";
            ClearAllValues();
        }
        else
        {
            FillStudentDetails();
            lblErrorMessage.Text = "* Student has no Book Records";
            
        }
    }

    protected void FillStudentDetails()
    {
        StudentENT entStudent = new StudentENT();
        if (Session["StudentName"] != null)
            txtStudentName.Text = Session["StudentName"].ToString().Trim();

        if (Session["EntrollmentNo"] != null)
            txtStudentEnrollmentNo.Text = Session["EntrollmentNo"].ToString().Trim();

        if (Session["Email"] != null)
            txtEmail.Text = Session["Email"].ToString().Trim();

        if (Session["CreationDate"] != null)
            lblRegisteredDate.Text = Session["CreationDate"].ToString().Trim();

        if (Session["ModificationDate"] != null)
            lblUpdatedDate.Text = Session["ModificationDate"].ToString().Trim();

        if (Session["InstituteName"] != null)
            txtInstitute.Text = Session["InstituteName"].ToString().Trim();

        if (Session["BranchName"] != null)
            txtBracnh.Text = Session["BranchName"].ToString().Trim();

        
    }

    private void ClearAllValues()
    {
        Session["StudentName"] = null;
        Session["CreationDate"] = null;
        Session["EntrollmentNo"] = null;
        Session["ModificationDate"] = null;
        Session["InstituteName"] = null;
        Session["BranchName"] = null;
        Session["Email"] = null;

        //Session["BookCopyID"] = null;
        //Session["BookID"] = null;
    }
}