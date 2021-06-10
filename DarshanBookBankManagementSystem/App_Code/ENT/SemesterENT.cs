using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Semester
/// </summary>
namespace DarshanBookBank.ENT
{
    public class SemesterENT
    {
        #region Contructor
        public SemesterENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

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
        #endregion SemesterID

        #region SemesterName

        protected SqlString _SemesterName;

        public SqlString SemesterName
        {
            get
            {
                return _SemesterName;
            }
            set
            {
                _SemesterName = value;
            }
        }

        #endregion SemesterName

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
