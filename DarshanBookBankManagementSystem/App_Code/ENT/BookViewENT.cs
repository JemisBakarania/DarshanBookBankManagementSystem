using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookViewENT
/// </summary>
/// 
namespace DarshanBookBank.ENT
{
    public class BookViewENT
    {
        #region Constructor
        public BookViewENT()
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
    }

}
