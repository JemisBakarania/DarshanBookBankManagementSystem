using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class StudentENT
    {
        #region Constructor
        public StudentENT()
        {
            //
            // TODO: Add constructor logic here
            //
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

        #region StudentName

        protected SqlString _StudentName;

        public SqlString StudentName
        {
            get
            {
                return _StudentName;
            }
            set
            {
                _StudentName = value;
            }
        }

        #endregion

        #region EntrollmentNo
        protected SqlString _EntrollmentNo;

        public SqlString EntrollmentNo
        {
            get
            {
                return _EntrollmentNo;
            }
            set
            {
                _EntrollmentNo = value;
            }
        }
        #endregion

        #region Email
        protected SqlString _Email;

        public SqlString Email
        {
            get
            {
                return _Email;
            }
            set
            {
                _Email = value;
            }
        }
        #endregion

        #region Institute

        protected SqlInt32 _InstituteID;

        public SqlInt32 InstituteID
        {
            get
            {
                return _InstituteID;
            }
            set
            {
                _InstituteID = value;
            }
        }

        #endregion Institute

        #region Branch

        protected SqlInt32 _BranchID;

        public SqlInt32 BranchID
        {
            get
            {
                return _BranchID;
            }
            set
            {
                _BranchID = value;
            }
        }

        #endregion Branch

        #region SemesterID
        protected SqlInt32 _SemesterID;

        public SqlInt32 SemesterID
        {
            get
            {
                return _SemesterID;
            }
            set
            {
                _SemesterID = value;
            }
        }
        #endregion

        #region AdminUserID
        protected SqlInt32 _AdminUserID;

        public SqlInt32 AdminUserID
        {
            get
            {
                return _AdminUserID;
            }
            set
            {
                _AdminUserID = value;
            }
        }
        #endregion

        #region Institute Name

        protected SqlString _InstituteName;

        public SqlString InstituteName
        {
            get
            {
                return _InstituteName;
            }
            set
            {
                _InstituteName = value;
            }
        }

        #endregion 

        #region Branch Name

        protected SqlString _BranchName;

        public SqlString BranchName
        {
            get
            {
                return _BranchName;
            }
            set
            {
                _BranchName = value;
            }
        }

        #endregion Branch

        #region CreationDate

        protected SqlString _CreationDate;

        public SqlString CreationDate
        {
            get
            {
                return _CreationDate;
            }
            set
            {
                _CreationDate = value;
            }
        }

        #endregion CreationDate

        #region ModificationDate

        protected SqlString _ModificationDate;

        public SqlString ModificationDate
        {
            get
            {
                return _ModificationDate;
            }
            set
            {
                _ModificationDate = value;
            }
        }

        #endregion ModificationDate

    }
}
