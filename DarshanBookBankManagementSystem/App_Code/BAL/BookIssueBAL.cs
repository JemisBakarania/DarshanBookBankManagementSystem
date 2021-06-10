using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookIssueBAL
/// </summary>
/// 
namespace DarshanBookBank.BAL
{
    public class BookIssueBAL
    {
        #region Constructor
        public BookIssueBAL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region Local Variable

        protected string _Message;

        public string Message
        {
            get
            {
                return _Message;
            }
            set
            {
                _Message = value;
            }
        }

        #endregion Local Variable

        #region Insert Operation

        public Boolean Insert(BookIssueENT entBookIssue)
        {
            BookIssueDAL dalBookIssue = new BookIssueDAL();

            if (dalBookIssue.Insert(entBookIssue))
            {
                return true;
            }
            else
            {
                Message = dalBookIssue.Message;
                return false;
            }


        }
        #endregion

        #region Select By Enrollemnt No With Book Details

        public DataTable SelectByEnrollemntNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
        {
            BookIssueDAL dalBookIssue = new BookIssueDAL();
            return dalBookIssue.SelectByEnrollemntNoWithBookDetails(InstituteID, BranchID, EnrollmentNo);
        }
        #endregion

        #region Select By Book Copy No With Book Details

        public DataTable SelectByBookCopyNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString BookCopyNo)
        {
            BookIssueDAL dalBookIssue = new BookIssueDAL();
            return dalBookIssue.SelectByBookCopyNoWithBookDetails(InstituteID, BranchID, BookCopyNo);
        }
        #endregion

        #region  Book Return Operation

        public Boolean BookReturn(BookIssueENT entBookIssue)
        {
            BookIssueDAL dalBookIssue = new BookIssueDAL();

            if (dalBookIssue.BookReturn(entBookIssue))
            {
                return true;
            }
            else
            {
                Message = dalBookIssue.Message;
                return false;
            }
        }
        #endregion

        #region View By Enrollemnt No With Book Details

        public StudentENT ViewByEnrollemntNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlInt32 StudentID)
        {
            BookIssueDAL dalBookIssue = new BookIssueDAL();
            return dalBookIssue.ViewByEnrollemntNoWithBookDetails(InstituteID, BranchID, StudentID);
        }
        #endregion
    }

}