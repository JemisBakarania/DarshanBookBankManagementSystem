using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class BookBAL
    {
        #region Constuctor
        public BookBAL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region Local Variable

        protected string _Message;

        public string Message
        {
            get
            {
                return _Message;
            }
            set
            {
                _Message = value;
            }
        }

        #endregion Local Variable

        #region Insert Operation

        public Boolean Insert(BookENT entBook)
        {
            BookDAL dalBook = new BookDAL();
            if (dalBook.Insert(entBook))
            {
                return true;
            }
            else
            {
                Message = dalBook.Message;
                return false;
            }
        }

        #endregion

        #region SelectForDropDownList
        public DataTable SelectForDropDownList(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            BookDAL dalBook = new BookDAL();
            return dalBook.SelectForDropDownList(InstituteID, BranchID);
        }
        #endregion SelectForDropDownList

        #region Select By BookID

        public DataTable SelectByBookID(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            BookDAL dalBook = new BookDAL();
            return dalBook.SelectByBookID(InstituteID, BranchID);
        }
        #endregion

        #region Delete Book

        public Boolean DeleteBook(SqlInt32 BookID)
        {
            BookDAL dalBook = new BookDAL();
            if (dalBook.DeleteBook(BookID))
            {
                return true;
            }
            else
            {
                Message = dalBook.Message;
                return false;
            }
        }
        #endregion

        #region ViewByEnrollmentNo

        public BookENT ViewByBookID(SqlInt32 BookID)
        {
            BookDAL dalBook = new BookDAL();
            return dalBook.ViewByBookID(BookID);
        }
        #endregion

        #region Update Book

        public Boolean UpdateBook(BookENT entBook)
        {
            BookDAL dalBook = new BookDAL();
            if (dalBook.UpdateBook(entBook))
            {
                return true;
            }
            else
            {
                Message = dalBook.Message;
                return false;
            }
        }
        #endregion
    }
}
