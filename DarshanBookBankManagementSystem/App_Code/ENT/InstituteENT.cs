using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InstituteENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class InstituteENT
    {
        #region Constructor
        public InstituteENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion Constructor

        #region InstituteID
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
        #endregion InstituteID

        #region InstituteName

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

        #endregion InstituteName

        #region Code

        protected SqlInt32 _Code;

        public SqlInt32 Code
        {
            get
            {
                return _Code;
            }
            set
            {
                _Code = value;
            }
        }
        #endregion Code

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
