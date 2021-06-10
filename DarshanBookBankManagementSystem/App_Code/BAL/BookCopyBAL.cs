using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookCopyBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class BookCopyBAL
    {
        #region Contructor
        public BookCopyBAL()
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

        public Boolean Insert(BookCopyENT entBookCopy)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            if (dalBookCopy.Insert(entBookCopy))
            {
                return true;
            }
            else
            {
                Message = dalBookCopy.Message;
                return false;
            }
        }

        #endregion

        #region Select All By userID

        public DataTable SelectByUserID(SqlInt32 InstituteID, SqlInt32 BranchID)
        {

            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.SelectByUserID(InstituteID, BranchID);
        }
        #endregion

        #region Select All By userID By Book Copy No

        public DataTable SelectByUserIDByBookCopyNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString BookCopyNo)
        {

            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.SelectByUserIDByBookCopyNo(InstituteID, BranchID, BookCopyNo);
        }
        #endregion

        #region Select By BookCopy ID

        public BookCopyENT SelectByBookCopyID(SqlInt32 BookCopyID)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.SelectByBookCopyID(BookCopyID);
        }
        #endregion

        #region Select By BookCopy No

        public BookCopyENT SelectByBookCopyNo(SqlString BookCopyNo)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.SelectByBookCopyNo(BookCopyNo);
        }
        #endregion

        #region View By Book Copy No

        public BookViewENT ViewByBookCopyNo(SqlInt32 BookCopyID)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.ViewByBookCopyNo(BookCopyID);
        }

        #endregion

        #region Select By BookCopy ID

        public BookViewENT ViewByBookCopyID(SqlInt32 BookCopyID)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            return dalBookCopy.ViewByBookCopyID(BookCopyID);
        }
        #endregion

        #region Delete Book

        public Boolean DeleteBookCopy(SqlInt32 BookCopyID)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            if (dalBookCopy.DeleteBookCopy(BookCopyID))
            {
                return true;
            }
            else
            {
                Message = dalBookCopy.Message;
                return false;
            }
        }
        #endregion

        #region Update Book

        public Boolean UpdateBook(BookViewENT entBookView)
        {
            BookCopyDAL dalBookCopy = new BookCopyDAL();
            if(dalBookCopy.UpdateBook(entBookView))
            {
                return true;
            }
            else
            {
                Message = dalBookCopy.Message;
                return false;
            }
        }
        #endregion
    }
}