using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookIssueENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class BookIssueENT
    {
        #region Constructor
        public BookIssueENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region BookIssueID

        protected SqlInt32 _BookIssueID;
        
        public SqlInt32 BookIssueID
        {
            get
            {
                return _BookIssueID;
            }
            set
            {
                _BookIssueID = value;
            }
        }

        #endregion

        #region BookIssueDate

        protected SqlDateTime _BookIssueDate;

        public SqlDateTime BookIssueDate
        {
            get
            {
                return _BookIssueDate;
            }
            set
            {
                _BookIssueDate = value;
            }
        }

        #endregion

        #region BookDueDate

        protected SqlDateTime _BookDueDate;

        public SqlDateTime BookDueDate
        {
            get
            {
                return _BookDueDate;
            }
            set
            {
                _BookDueDate = value;
            }
        }

        #endregion

        #region BookReturnDate

        protected SqlDateTime _BookReturnDate;

        public SqlDateTime BookReturnDate
        {
            get
            {
                return _BookReturnDate;
            }
            set
            {
                _BookReturnDate = value;
            }
        }

        #endregion

        #region BookID

        protected SqlInt32 _BookID;

        public SqlInt32 BookID
        {
            get
            {
                return _BookID;
            }
            set
            {
                _BookID = value;
            }
        }

        #endregion

        #region BookCopyID

        protected SqlInt32 _BookCopyID;

        public SqlInt32 BookCopyID
        {
            get
            {
                return _BookCopyID;
            }
            set
            {
                _BookCopyID = value;
            }
        }

        #endregion

        #region StudentID

        protected SqlInt32 _StudentID;

        public SqlInt32 StudentID
        {
            get
            {
                return _StudentID;
            }
            set
            {
                _StudentID = value;
            }
        }

        #endregion

        #region IssuedByStaffID

        protected SqlInt32 _IssuedByStaffID;

        public SqlInt32 IssuedByStaffID
        {
            get
            {
                return _IssuedByStaffID;
            }
            set
            {
                _IssuedByStaffID = value;
            }
        }

        #endregion

        #region ReturnByStaffID

        protected SqlInt32 _ReturnByStaffID;

        public SqlInt32 ReturnByStaffID
        {
            get
            {
                return _ReturnByStaffID;
            }
            set
            {
                _ReturnByStaffID = value;
            }
        }

        #endregion

        #region ReturnRemarks

        protected SqlString _ReturnRemarks;

        public SqlString ReturnRemarks
        {
            get
            {
                return _ReturnRemarks;
            }
            set
            {
                _ReturnRemarks = value;
            }
        }

        #endregion
    }
}
