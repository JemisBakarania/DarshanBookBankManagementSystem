using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TotalCounts
/// </summary>
/// 

namespace DarshanBookBank.ENT
{
    public class TotalCountsENT
    {
        #region Constructor
        public TotalCountsENT()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region TotalBooks

        protected SqlInt32 _TotalBooks;

        public SqlInt32 TotalBooks
        {
            get
            {
                return _TotalBooks;
            }
            set
            {
                _TotalBooks = value;
            }
        }

        #endregion

        #region TotalBookCopy

        protected SqlInt32 _TotalBookCopy;

        public SqlInt32 TotalBookCopy
        {
            get
            {
                return _TotalBookCopy;
            }
            set
            {
                _TotalBookCopy = value;
            }
        }

        #endregion

        #region TotalBooksIssued

        protected SqlInt32 _TotalBooksIssued;

        public SqlInt32 TotalBooksIssued
        {
            get
            {
                return _TotalBooksIssued;
            }
            set
            {
                _TotalBooksIssued = value;
            }
        }

        #endregion

        #region TotalBooksAvailable

        protected SqlInt32 _TotalBooksAvailable;

        public SqlInt32 TotalBooksAvailable
        {
            get
            {
                return _TotalBooksAvailable;
            }
            set
            {
                _TotalBooksAvailable = value;
            }
        }

        #endregion

        #region TotalStudent

        protected SqlInt32 _TotalStudent;

        public SqlInt32 TotalStudent
        {
            get
            {
                return _TotalStudent;
            }
            set
            {
                _TotalStudent = value;
            }
        }

        #endregion
    }
}
