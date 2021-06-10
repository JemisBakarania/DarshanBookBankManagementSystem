using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookENT
/// </summary>
namespace DarshanBookBank.ENT
{
    public class BookENT
    {
        #region Constructor
        public BookENT()
        {
            //
            // TODO: Add constructor logic here
            //
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

        #region BookTitle

        protected SqlString _BookTitle;

        public SqlString BookTitle
        {
            get
            {
                return _BookTitle;
            }
            set
            {
                _BookTitle = value;
            }
        }

        #endregion

        #region Author

        protected SqlString _Author;

        public SqlString Author
        {
            get
            {
                return _Author;
            }
            set
            {
                _Author = value;
            }
        }

        #endregion

        #region Details

        protected SqlString _Details;

        public SqlString Details
        {
            get
            {
                return _Details;
            }
            set
            {
                _Details = value;
            }
        }

        #endregion

        #region Image

        protected SqlString _Image;

        public SqlString Image
        {
            get
            {
                return _Image;
            }
            set
            {
                _Image = value;
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
