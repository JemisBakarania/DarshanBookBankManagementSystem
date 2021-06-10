using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Student_AddStudent : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lnbtnViewAll.Visible = false;
        pnlStudentByEnrollmentNo.Visible = false;
        pnlStudent.Visible = true;
        if (!Page.IsPostBack)
        {
            ViewAllStudent();
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string EnrollmentNo = "";
        if (txtStudentEnrollmentNo.Text.Trim() != "")
            EnrollmentNo = txtStudentEnrollmentNo.Text.Trim();

        pnlStudentByEnrollmentNo.Visible = true;

        StudentBAL balStudent = new StudentBAL();
        DataTable dtStudent = new DataTable();
        dtStudent = balStudent.ViewByEnrollmentNo(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), EnrollmentNo);

        if (dtStudent != null && dtStudent.Rows.Count > 0)
        {
            gvStudentByEnrollment.DataSource = dtStudent;
            gvStudentByEnrollment.DataBind();
            lblErrorMessage.Text = "";
        }
        else
        {
            pnlStudentByEnrollmentNo.Visible = false;
            lblErrorMessage.Text = "Student Profile Not Found";
        }
    }

    //protected void btnViewAll_Click(object sender, EventArgs e)
    //{
    //    lblErrorMessage.Text = "";
    //    pnlStudent.Visible = true;
    //    StudentBAL balStudent = new StudentBAL();
    //    DataTable dtStudent = new DataTable();
    //    dtStudent = balStudent.SelectAllStudent(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

    //    if (dtStudent != null && dtStudent.Rows.Count > 0)
    //    {
    //        gvStudent.DataSource = dtStudent;
    //        gvStudent.DataBind();
    //    }

    //}

    protected void ViewAllStudent()
    {
        lblErrorMessage.Text = "";
        pnlStudent.Visible = true;
        StudentBAL balStudent = new StudentBAL();
        DataTable dtStudent = new DataTable();
        dtStudent = balStudent.SelectAllStudent(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtStudent != null && dtStudent.Rows.Count > 0)
        {
            gvStudent.DataSource = dtStudent;
            gvStudent.DataBind();
        }
    }

    protected void lnbtnSearch_Click(object sender, EventArgs e)
    {
        string EnrollmentNo = "";
        if (txtStudentEnrollmentNo.Text.Trim() != "")
            EnrollmentNo = txtStudentEnrollmentNo.Text.Trim();

        pnlStudentByEnrollmentNo.Visible = true;

        StudentBAL balStudent = new StudentBAL();
        DataTable dtStudent = new DataTable();
        dtStudent = balStudent.ViewByEnrollmentNo(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), EnrollmentNo);

        if (dtStudent != null && dtStudent.Rows.Count > 0)
        {
            gvStudentByEnrollment.DataSource = dtStudent;
            gvStudentByEnrollment.DataBind();
            lblErrorMessage.Text = "";
            pnlStudent.Visible = false;
            lnbtnViewAll.Visible = true;
        }
        else
        {
            pnlStudentByEnrollmentNo.Visible = false;
            lblErrorMessage.Text = "Student Profile Not Found";
        }
    }

    protected void lnbtnViewAll_Click(object sender, EventArgs e)
    {
        pnlStudentByEnrollmentNo.Visible = false;
        txtStudentEnrollmentNo.Text = "";
        lblErrorMessage.Text = "";
        pnlStudent.Visible = true;
        StudentBAL balStudent = new StudentBAL();
        DataTable dtStudent = new DataTable();
        dtStudent = balStudent.SelectAllStudent(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        if (dtStudent != null && dtStudent.Rows.Count > 0)
        {
            gvStudent.DataSource = dtStudent;
            gvStudent.DataBind();
        }
    }

    protected void gvStudentByEnrollment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "ViewStudent")
        {
            BookIssueBAL balBookIssue = new BookIssueBAL();
            StudentENT entStudent = new StudentENT();

            entStudent = balBookIssue.ViewByEnrollemntNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), Convert.ToInt32(e.CommandArgument.ToString().Trim()));

            if (!entStudent.StudentID.IsNull)
                Session["StudentID"] = Convert.ToInt32(entStudent.StudentID.Value);

            if (!entStudent.StudentName.IsNull)
                Session["StudentName"] = Convert.ToString(entStudent.StudentName.Value);

            if (!entStudent.Email.IsNull)
                Session["Email"] = Convert.ToString(entStudent.Email.Value);

            if (!entStudent.EntrollmentNo.IsNull)
                Session["EntrollmentNo"] = Convert.ToString(entStudent.EntrollmentNo.Value);

            if (!entStudent.CreationDate.IsNull)
                Session["CreationDate"] = Convert.ToString(entStudent.CreationDate.Value);

            if (!entStudent.ModificationDate.IsNull)
                Session["ModificationDate"] = Convert.ToString(entStudent.ModificationDate.Value);

            if (!entStudent.InstituteName.IsNull)
                Session["InstituteName"] = Convert.ToString(entStudent.InstituteName.Value);

            if (!entStudent.BranchName.IsNull)
                Session["BranchName"] = Convert.ToString(entStudent.BranchName.Value);


            Response.Redirect("~/AdminPanel/Student/ViewStudentProfile.aspx");


        }

        else if(e.CommandName == "DeleteStudent")
        {
            
            StudentBAL balStudent = new StudentBAL();
            if(balStudent.DeleteStudent(Convert.ToInt32(e.CommandArgument.ToString().Trim())))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
                ViewAllStudent();
            }
            else
            {

                lblErrorMessage.Text = balStudent.Message;
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Student/AddStudent.aspx");
    }
}