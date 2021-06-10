using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookDAL
/// </summary>
namespace DarshanBookBank.DAL
{
    public class BookDAL : DatabaseConfig
    {
        #region Constructor
        public BookDAL()
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

        #endregion

        #region Insert Operation

        public Boolean Insert(BookENT entBook)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Book_InsertByUserID";

                        objCmd.Parameters.Add("@BookID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        objCmd.Parameters.Add("@BookTitle", SqlDbType.VarChar).Value = entBook.BookTitle;
                        objCmd.Parameters.Add("@Author", SqlDbType.VarChar).Value = entBook.Author;
                        objCmd.Parameters.Add("@Details", SqlDbType.VarChar).Value = entBook.Details;
                        objCmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = entBook.Image;
                        objCmd.Parameters.AddWithValue("@AdminUserID", entBook.AdminUserID);

                        #endregion

                        objCmd.ExecuteNonQuery();

                        if (objCmd.Parameters["@BookID"] != null)
                        {
                            entBook.BookID = Convert.ToInt32(objCmd.Parameters["@BookID"].Value);
                        }
                        return true;
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return false;
                    }
                }
            }
        }
        #endregion

        #region Select For Drop Down List

        public DataTable SelectForDropDownList(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using (SqlCommand objCmn = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmn.CommandType = CommandType.StoredProcedure;
                        objCmn.CommandText = "PR_Book_SelectForDropdownList";

                        objCmn.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmn.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion Prepare Command

                        #region Read Data and Set Controls

                        DataTable dt = new DataTable();
                        using (SqlDataReader objSDR = objCmn.ExecuteReader())
                        {
                            dt.Load(objSDR);
                        }
                        return dt;

                        #endregion Read Data and Set Controls
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
                    }
                }
            }
        }

        #endregion Select For Drop Down List

        #region Select By BookID

        public DataTable SelectByBookID(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using (SqlCommand objCmn = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmn.CommandType = CommandType.StoredProcedure;
                        objCmn.CommandText = "PR_Book_SelectAll";

                        objCmn.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmn.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion Prepare Command

                        #region Read Data and Set Controls

                        DataTable dt = new DataTable();
                        using (SqlDataReader objSDR = objCmn.ExecuteReader())
                        {
                            dt.Load(objSDR);
                        }
                        return dt;

                        #endregion Read Data and Set Controls
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
                    }
                }
            }
        }

        #endregion Select For Drop Down List

        #region Delete Book

        public Boolean DeleteBook(SqlInt32 BookID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using (SqlCommand objCmn = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmn.CommandType = CommandType.StoredProcedure;
                        objCmn.CommandText = "PR_Book_DeleteByPK";

                        objCmn.Parameters.AddWithValue("@BookID", BookID);

                        #endregion

                        objCmn.ExecuteNonQuery();
                        return true;

                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return false;
                    }
                    finally
                    {
                        if (objConn.State == ConnectionState.Open)
                            objConn.Close();
                    }
                }
            }
        }

        #endregion

        #region ViewByEnrollmentNo

        public BookENT ViewByBookID(SqlInt32 BookID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                BookENT entBook = new BookENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Book_SelectByPK";

                        objCmd.Parameters.AddWithValue("@BookID", BookID);
                        #endregion

                        using (SqlDataReader objSDRR = objCmd.ExecuteReader())
                        {
                            while (objSDRR.Read())
                            {
                                if (!objSDRR["BookID"].Equals(DBNull.Value))
                                    entBook.BookID = Convert.ToInt32(objSDRR["BookID"]);

                                if (!objSDRR["BookTitle"].Equals(DBNull.Value))
                                    entBook.BookTitle = Convert.ToString(objSDRR["BookTitle"]);

                                if (!objSDRR["Author"].Equals(DBNull.Value))
                                    entBook.Author = Convert.ToString(objSDRR["Author"]);

                                if (!objSDRR["Details"].Equals(DBNull.Value))
                                    entBook.Details = Convert.ToString(objSDRR["Details"]);

                            }
                        }
                        return entBook;

                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
                    }
                    finally
                    {
                        if (objConn.State == ConnectionState.Open)
                        {
                            objConn.Close();
                        }
                    }
                }
            }
        }
        #endregion\

        #region Update Book

        public Boolean UpdateBook(BookENT entBook)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Book_UpdateByPK";

                        objCmd.Parameters.AddWithValue("@BookID", entBook.BookID);
                        objCmd.Parameters.AddWithValue("@BookTitle", entBook.BookTitle);
                        objCmd.Parameters.AddWithValue("@Author", entBook.Author);
                        objCmd.Parameters.AddWithValue("@Details", entBook.Details);
                        objCmd.Parameters.AddWithValue("@Image", entBook.Image);
                        #endregion Prepare Command

                        objCmd.ExecuteNonQuery();

                        return true;

                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message.ToString();
                        return false;
                    }
                    finally
                    {
                        if (objConn.State == ConnectionState.Open)
                            objConn.Close();
                    }
                }
            }
        }

        #endregion
    }
}
