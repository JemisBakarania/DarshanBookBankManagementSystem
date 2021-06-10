using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Book_ReturnBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    if(txtSearch.Text.Trim()!="")
    //    {
    //        string BookCopyNo = "";
    //        if (txtSearch.Text.Trim() != "")
    //            BookCopyNo = txtSearch.Text.Trim();

    //        pnlStudentBySerialNo.Visible = true;
    //        BookIssueBAL balBookIssue = new BookIssueBAL();
    //        DataTable dtStudent = new DataTable();
    //        dtStudent = balBookIssue.SelectByBookCopyNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), BookCopyNo);

    //        if (dtStudent != null && dtStudent.Rows.Count > 0)
    //        {
    //            gvStudentBySerialNo.DataSource = dtStudent;
    //            gvStudentBySerialNo.DataBind();
    //            lblErrorMessage.Text = "";
    //            pnlStudentByEnrollmentNo.Visible = false;
    //        }
    //        else
    //        {
    //            pnlStudentBySerialNo.Visible = false;
    //            lblErrorMessage.Text = "No Record Found";
    //        }
    //    }
    //    else if(txtStudentEnrollmentNo.Text.Trim()!="")
    //    {
    //        string EnrollmentNo = "";
    //        if (txtStudentEnrollmentNo.Text.Trim() != "")
    //            EnrollmentNo = txtStudentEnrollmentNo.Text.Trim();

    //        pnlStudentByEnrollmentNo.Visible = true;

    //        BookIssueBAL balBookIssue = new BookIssueBAL();
    //        DataTable dtStudent = new DataTable();
    //        dtStudent = balBookIssue.SelectByEnrollemntNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), EnrollmentNo);

    //        if (dtStudent != null && dtStudent.Rows.Count > 0)
    //        {
    //            gvStudentByEnrollmentNo.DataSource = dtStudent;
    //            gvStudentByEnrollmentNo.DataBind();
    //            lblErrorMessage.Text = "";
    //            pnlStudentBySerialNo.Visible = false;
    //        }
    //        else
    //        {
    //            pnlStudentByEnrollmentNo.Visible = false;
    //            lblErrorMessage.Text = "Student Profile Not Found";
    //        }
    //    }

    //}

    protected void gvStudentByEnrollmentNo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Return")
        {
            if(e.CommandArgument != null)
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

    //protected void txtStudentEnrollmentNo_TextChanged(object sender, EventArgs e)
    //{
    //    txtSearch.Text = "";
    //}

    //protected void txtSearch_TextChanged(object sender, EventArgs e)
    //{
    //    txtStudentEnrollmentNo.Text = "";
    //}

    protected void lnbtnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text.Length < 12)
        {
            string BookCopyNo = "";
            if (txtSearch.Text.Trim() != "")
                BookCopyNo = txtSearch.Text.Trim();

            pnlStudentBySerialNo.Visible = true;
            BookIssueBAL balBookIssue = new BookIssueBAL();
            DataTable dtStudent = new DataTable();
            dtStudent = balBookIssue.SelectByBookCopyNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), BookCopyNo);

            if (dtStudent != null && dtStudent.Rows.Count > 0)
            {
                gvStudentBySerialNo.DataSource = dtStudent;
                gvStudentBySerialNo.DataBind();
                lblErrorMessage.Text = "";
                txtSearch.Text = "";
                pnlStudentByEnrollmentNo.Visible = false;
            }
            else
            {
                pnlStudentBySerialNo.Visible = false;
                lblErrorMessage.Text = "No Record Found";
            }
        }
        else if (txtSearch.Text.Length == 12)
        {
            string EnrollmentNo = "";
            if (txtSearch.Text.Trim() != "")
                EnrollmentNo = txtSearch.Text.Trim();

            pnlStudentByEnrollmentNo.Visible = true;

            BookIssueBAL balBookIssue = new BookIssueBAL();
            DataTable dtStudent = new DataTable();
            dtStudent = balBookIssue.SelectByEnrollemntNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), EnrollmentNo);

            if (dtStudent != null && dtStudent.Rows.Count > 0)
            {
                gvStudentByEnrollmentNo.DataSource = dtStudent;
                gvStudentByEnrollmentNo.DataBind();
                lblErrorMessage.Text = "";
                txtSearch.Text = "";
                pnlStudentBySerialNo.Visible = false;
            }
            else
            {
                pnlStudentByEnrollmentNo.Visible = false;
                lblErrorMessage.Text = "Student Profile Not Found";
            }
        }
        else
        {
            pnlStudentByEnrollmentNo.Visible = false;
            pnlStudentBySerialNo.Visible = false;
            txtSearch.Text = "";
            lblErrorMessage.Text = "No Record Found";
        }
    }
}