using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminUserENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class AdminUserENT
    {
        #region Constructor
        public AdminUserENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion Constructor

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

        #endregion AdminUserID

        #region AdminUserName
        protected SqlString _AdminUserName;

        public SqlString AdminUserName
        {
            get
            {
                return _AdminUserName;
            }
            set
            {
                _AdminUserName = value;
            }
        }
        #endregion AdminUserName

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

        #endregion Email

        #region Password

        protected SqlString _Password;

        public SqlString Password
        {
            get
            {
                return _Password;
            }
            set
            {
                _Password = value;
            }
        }

        #endregion Password

        #region MobileNo

        protected SqlString _MobileNo;

        public SqlString MobileNo
        {
            get
            {
                return _MobileNo;
            }
            set
            {
                _MobileNo = value;
            }
        }

        #endregion MobileNo

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

        #region Profile Picuture

        protected SqlString _ProfilePicture;

        public SqlString ProfilePicture
        {
            get
            {
                return _ProfilePicture;
            }
            set
            {
                _ProfilePicture = value;
            }
        }

        #endregion Profile Picuture

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

    }
}
