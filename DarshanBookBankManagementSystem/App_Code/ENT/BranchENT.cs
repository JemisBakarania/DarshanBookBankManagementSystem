using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BranchENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class BranchENT
    {
        #region Constructor
        public BranchENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region BranchID
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
        #endregion BranchID

        #region BranchName

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

        #endregion BranchName

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

        #region CreationDate

        protected SqlDateTime _CreationDate;

        public SqlDateTime CreationDate
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

        protected SqlDateTime _ModificationDate;

        public SqlDateTime ModificationDate
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
