using DarshanBookBank.BAL;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for CommanFillMethods
/// </summary>
namespace DarshanBookBank
{
    public class CommanFillMethods
    {
        public CommanFillMethods()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void FillDropDownListInstitute(DropDownList ddl)
        {
            InstituteBAL balInstitute = new InstituteBAL();
            ddl.DataSource = balInstitute.SelectForDropDownList();
            ddl.DataValueField = "InstituteID";
            ddl.DataTextField = "InstituteName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem(" -- Select Institute -- ", "-1"));
        }

        public static void FillDropDownListBranch(DropDownList ddl)
        {
            BranchBAL balBranch = new BranchBAL();
            ddl.DataSource = balBranch.SelectForDropDownList();
            ddl.DataValueField = "BranchID";
            ddl.DataTextField = "BranchName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem(" -- Select Branch -- ", "-1"));
        }

        public static void FillDropDownListBook(DropDownList ddl, SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            BookBAL balBook = new BookBAL();
            ddl.DataSource = balBook.SelectForDropDownList(InstituteID, BranchID);
            ddl.DataValueField = "BookID";
            ddl.DataTextField = "BookTitle";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem(" -- Select Book -- ", "-1"));
        }

        public static void FillDropDownListSemester(DropDownList ddl)
        {
            SemesterBAL balSemester = new SemesterBAL();
            ddl.DataSource = balSemester.SelectForDropDownList();
            ddl.DataValueField = "SemesterID";
            ddl.DataTextField = "SemesterName";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem(" -- Select Semester -- ", "-1"));
        }
    }
}
