using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TotalCountsBAL
/// </summary>.
/// 
namespace DarshanBookBank.BAL
{
    public class TotalCountsBAL
    {
        #region Constructor
        public TotalCountsBAL()
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

        #endregion

        #region Total Books

        public TotalCountsENT SelectTotalBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            TotalCountsDAL dalTotalCounts = new TotalCountsDAL();
            return dalTotalCounts.SelectTotalBooks(InstituteID, BranchID);
        }
        #endregion

        #region Total Book Copy

        public TotalCountsENT SelectTotalBookCopy(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            TotalCountsDAL dalTotalCounts = new TotalCountsDAL();
            return dalTotalCounts.SelectTotalBookCopy(InstituteID, BranchID);
        }
        #endregion

        #region Total Available Books

        public TotalCountsENT SelectAvailableBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            TotalCountsDAL dalTotalCounts = new TotalCountsDAL();
            return dalTotalCounts.SelectAvailableBooks(InstituteID, BranchID);
        }
        #endregion

        #region Total Issued Books

        public TotalCountsENT SelectIssuedBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            TotalCountsDAL dalTotalCounts = new TotalCountsDAL();
            return dalTotalCounts.SelectIssuedBooks(InstituteID, BranchID);
        }
        #endregion

        #region Total Students

        public TotalCountsENT SelectStudents(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            TotalCountsDAL dalTotalCounts = new TotalCountsDAL();
            return dalTotalCounts.SelectStudents(InstituteID, BranchID);
        }
        #endregion
    }
}
