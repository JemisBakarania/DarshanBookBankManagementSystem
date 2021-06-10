using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookCopyENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class BookCopyENT
    {
        #region Constructor
        public BookCopyENT()
        {
            //
            // TODO: Add constructor logic here
            //
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

        #region BookCopyNo

        protected SqlString _BookCopyNo;

        public SqlString BookCopyNo
        {
            get
            {
                return _BookCopyNo;
            }
            set
            {
                _BookCopyNo = value;
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

    }
}
