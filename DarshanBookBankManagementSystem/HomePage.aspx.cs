using DarshanBookBank.BAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!Page.IsPostBack)
        {
            SelectTotalBooks();
            SelectTotalStudents();
            SelectIssuedBooks();
            SelectAvailableBooks();
            SelectBookCopy();
        }

    }

    protected void SelectTotalBooks()
    {
        TotalCountsENT entTotalCounts = new TotalCountsENT();
        TotalCountsBAL balTotalCounts = new TotalCountsBAL();

        entTotalCounts = balTotalCounts.SelectTotalBookCopy(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        lblTotalBooks.Text = entTotalCounts.TotalBookCopy.ToString().Trim();
    }

    protected void SelectTotalStudents()
    {
        TotalCountsENT entTotalCounts = new TotalCountsENT();
        TotalCountsBAL balTotalCounts = new TotalCountsBAL();

        entTotalCounts = balTotalCounts.SelectStudents(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        lblTotalStudent.Text = entTotalCounts.TotalStudent.ToString().Trim();
    }

    protected void SelectIssuedBooks()
    {
        TotalCountsENT entTotalCounts = new TotalCountsENT();
        TotalCountsBAL balTotalCounts = new TotalCountsBAL();

        entTotalCounts = balTotalCounts.SelectIssuedBooks(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        lblIssuedBooks.Text = entTotalCounts.TotalBooksIssued.ToString().Trim();
    }

    protected void SelectAvailableBooks()
    {
        TotalCountsENT entTotalCounts = new TotalCountsENT();
        TotalCountsBAL balTotalCounts = new TotalCountsBAL();

        entTotalCounts = balTotalCounts.SelectAvailableBooks(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        lblAvailableBooks.Text = entTotalCounts.TotalBooksAvailable.ToString().Trim();
    }

    protected void SelectBookCopy()
    {
        TotalCountsENT entTotalCounts = new TotalCountsENT();
        TotalCountsBAL balTotalCounts = new TotalCountsBAL();

        entTotalCounts = balTotalCounts.SelectTotalBooks(Convert.ToInt32(Session["InstituteID"]), Convert.ToInt32(Session["BranchID"]));

        lblTotalSubjects.Text = entTotalCounts.TotalBooks.ToString().Trim();
    }

    
 }