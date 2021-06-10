using DarshanBookBank;
using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Student_AddStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillDropDownList();
            if (Request.QueryString["StudentID"] != null)
            {
                FillControls();
                lblTitle.Text = "Edit Student";
                lblBread.Text = "Edit Student";
                btnAdd.Text = "Update";
                btnAdd.CssClass = "btn btn-outline-warning";
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        #region Server Side Validation

        String strErrorMessage = "";

        if (txtStudentName.Text.Trim() == "")
            strErrorMessage += "Enter Name <br/>";

        if (txtEmail.Text.Trim() == "")
            strErrorMessage += "Enter Email <br/>";

        if (txtEnrollmentNo.Text.Trim() == "")
            strErrorMessage += "Enter Pasword <br/>";

        if (ddlSemester.SelectedIndex == 0)
            strErrorMessage += "Select Institute <br/>";

        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
        }

        #endregion Server Side Validation 

        #region Collect Form Data

        StudentENT entStudent = new StudentENT();

        if (txtStudentName.Text.Trim() != "")
            entStudent.StudentName = txtStudentName.Text.Trim();

        if (txtEmail.Text.Trim() != "")
            entStudent.Email = txtEmail.Text.Trim();

        if (txtEnrollmentNo.Text.Trim() != "")
            entStudent.EntrollmentNo = txtEnrollmentNo.Text.Trim();

        if (ddlSemester.SelectedIndex > 0)
            entStudent.SemesterID = Convert.ToInt32(ddlSemester.SelectedValue);

        if (Session["InstituteID"] != null)
            entStudent.InstituteID = Convert.ToInt32(Session["InstituteID"]);

        if (Session["BranchID"] != null)
            entStudent.BranchID = Convert.ToInt32(Session["BranchID"]);

        if (Session["AdminUserID"] != null)
            entStudent.AdminUserID = Convert.ToInt32(Session["AdminUserID"]);

        #endregion Collect Form Data

        StudentBAL balStudent = new StudentBAL();

        if(Request.QueryString["StudentID"] == null)
        {
            if (balStudent.Insert(entStudent))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "radomtext", "alertme()", true);
                ClearAllValues();

            }
            else
            {
                lblMessage.Text = balStudent.Message;
            }
        }
        else
        {
            entStudent.StudentID = Convert.ToInt32(Request.QueryString["StudentID"]);

            if(balStudent.UpdateStudent(entStudent))
            {
                ClearAllValues();
                Response.Redirect("~/AdminPanel/Student/EditStudent.aspx");
            }
            else
            {
                lblMessage.Text = balStudent.Message;
            }
        }


        

    }

    private void ClearAllValues()
    {
        txtStudentName.Text = "";
        txtEmail.Text = "";
        txtEnrollmentNo.Text = "";
        ddlSemester.SelectedIndex = -1;
        lblMessage.Text = "";

    }

    private void FillDropDownList()
    {
        CommanFillMethods.FillDropDownListSemester(ddlSemester);
    }

    protected void FillControls()
    {
        BookIssueBAL balBookIssue = new BookIssueBAL();
        StudentENT entStudent = new StudentENT();

        entStudent = balBookIssue.ViewByEnrollemntNoWithBookDetails(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]), Convert.ToInt32(Request.QueryString["StudentID"]));

        if (!entStudent.StudentName.IsNull)
            txtStudentName.Text = entStudent.StudentName.Value.ToString();

        if (!entStudent.EntrollmentNo.IsNull)
            txtEnrollmentNo.Text = entStudent.EntrollmentNo.Value.ToString();

        if (!entStudent.Email.IsNull)
            txtEmail.Text = entStudent.Email.Value.ToString();

        if (!entStudent.SemesterID.IsNull)
            ddlSemester.SelectedValue = entStudent.SemesterID.Value.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/Student/EditStudent.aspx");
    }
}