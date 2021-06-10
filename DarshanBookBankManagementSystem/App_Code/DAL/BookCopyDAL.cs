using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookCopyDAL
/// </summary>
namespace DarshanBookBank.DAL
{
    public class BookCopyDAL : DatabaseConfig
    {
        #region Construtor
        public BookCopyDAL()
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

        #region Inset Operation

        public Boolean Insert(BookCopyENT entBookCopy)
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
                        objCmn.CommandText = "PR_BookCopy_InsertByUserID";

                        objCmn.Parameters.Add("@BookCopyID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        objCmn.Parameters.Add("@BookID", SqlDbType.Int).Value = entBookCopy.BookID;
                        objCmn.Parameters.Add("@BookCopyNo", SqlDbType.VarChar).Value = entBookCopy.BookCopyNo;
                        objCmn.Parameters.AddWithValue("@AdminUserID", entBookCopy.AdminUserID);

                        #endregion Prepare Command

                        objCmn.ExecuteNonQuery();


                        if (objCmn.Parameters["@BookCopyID"] != null)
                        {
                            //entBookCopy.BookCopyID = Convert.ToInt32(objCmn.Parameters["@BookCopyID"].Value);
                            entBookCopy.BookCopyID = Convert.ToInt32("0");
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

        #region Select All By userID

        public DataTable SelectByUserID(SqlInt32 InstituteID, SqlInt32 BranchID)
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
                        objCmd.CommandText = "PR_BookCopy_SelectByPK";


                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        #region Data read

                        DataTable dt = new DataTable();
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            dt.Load(objSDR);
                        }

                        #endregion
                        return dt;
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
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

        #region Select All By userID By BookCopyNo

        public DataTable SelectByUserIDByBookCopyNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString BookCopyNo)
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
                        objCmd.CommandText = "PR_BookCopy_SelectByPKBySerialNo";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);
                        objCmd.Parameters.AddWithValue("@BookCopyNo", BookCopyNo);

                        #endregion

                        #region Data read

                        DataTable dt = new DataTable();
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            dt.Load(objSDR);
                        }

                        #endregion
                        return dt;
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
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

        #region Select By BookCopyID

        public BookCopyENT SelectByBookCopyID(SqlInt32 BookCopyID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                BookCopyENT entBookCopy = new BookCopyENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_SelectByBookCopyID";

                        objCmd.Parameters.AddWithValue("@BookCopyID", BookCopyID);
                        #endregion

                        #region ReadData and Set Controls
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["BookCopyID"].Equals(DBNull.Value))
                                    entBookCopy.BookCopyID = Convert.ToInt32(objSDR["BookCopyID"]);

                                if (!objSDR["BookID"].Equals(DBNull.Value))
                                    entBookCopy.BookID = Convert.ToInt32(objSDR["BookID"]);
                            }
                        }
                        #endregion
                        return entBookCopy;
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

        #endregion

        #region Select By BookCopy No

        public BookCopyENT SelectByBookCopyNo(SqlString BookCopyNo)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                BookCopyENT entBookCopy = new BookCopyENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_SelectByBookCopyNo";

                        objCmd.Parameters.AddWithValue("@BookCopyNo", BookCopyNo);
                        #endregion

                        #region ReadData and Set Controls
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["BookCopyID"].Equals(DBNull.Value))
                                    entBookCopy.BookCopyID = Convert.ToInt32(objSDR["BookCopyID"]);

                                if (!objSDR["BookID"].Equals(DBNull.Value))
                                    entBookCopy.BookID = Convert.ToInt32(objSDR["BookID"]);
                            }
                        }
                        #endregion
                        return entBookCopy;
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

        #endregion

        #region View By Book Copy No

        public BookViewENT ViewByBookCopyNo(SqlInt32 BookCopyID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                BookViewENT entBookView = new BookViewENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_SelectByPKByBookCopyID";

                        objCmd.Parameters.AddWithValue("@BookCopyID", BookCopyID);

                        #endregion
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["BookCopyID"].Equals(DBNull.Value))
                                    entBookView.BookCopyID = Convert.ToInt32(objSDR["BookCopyID"]);

                                if (!objSDR["Image"].Equals(DBNull.Value))
                                    entBookView.Image = Convert.ToString(objSDR["Image"]);

                                if (!objSDR["BookTitle"].Equals(DBNull.Value))
                                    entBookView.BookTitle = Convert.ToString(objSDR["BookTitle"]);

                                if (!objSDR["BookCopyNo"].Equals(DBNull.Value))
                                    entBookView.BookCopyNo = Convert.ToString(objSDR["BookCopyNo"]);

                                if (!objSDR["Details"].Equals(DBNull.Value))
                                    entBookView.Details = Convert.ToString(objSDR["Details"]);

                                if (!objSDR["Author"].Equals(DBNull.Value))
                                    entBookView.Author = Convert.ToString(objSDR["Author"]);

                            }
                        }
                        return entBookView;
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
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

        #region View By BookCopyID

        public BookViewENT ViewByBookCopyID(SqlInt32 BookCopyID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                BookViewENT entBookView = new BookViewENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_SelectByPKByBookCopyID";

                        objCmd.Parameters.AddWithValue("@BookCopyID", BookCopyID);
                        #endregion

                        #region ReadData and Set Controls
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["BookCopyID"].Equals(DBNull.Value))
                                    entBookView.BookCopyID = Convert.ToInt32(objSDR["BookCopyID"]);

                                if (!objSDR["Image"].Equals(DBNull.Value))
                                    entBookView.Image = Convert.ToString(objSDR["Image"]);

                                if (!objSDR["BookTitle"].Equals(DBNull.Value))
                                    entBookView.BookTitle = Convert.ToString(objSDR["BookTitle"]);

                                if (!objSDR["BookCopyNo"].Equals(DBNull.Value))
                                    entBookView.BookCopyNo = Convert.ToString(objSDR["BookCopyNo"]);

                                if (!objSDR["Details"].Equals(DBNull.Value))
                                    entBookView.Details = Convert.ToString(objSDR["Details"]);

                                if (!objSDR["Author"].Equals(DBNull.Value))
                                    entBookView.Author = Convert.ToString(objSDR["Author"]);

                            }
                        }
                        #endregion
                        return entBookView;
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

        #endregion

        #region Delete Book

        public Boolean DeleteBookCopy(SqlInt32 BookCopyID)
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
                        objCmd.CommandText = "PR_BookCopy_DeleteByPK";

                        objCmd.Parameters.AddWithValue("@BookCopyID", BookCopyID);
                        #endregion

                        objCmd.ExecuteNonQuery();
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

        #region Update Book

        public Boolean UpdateBook(BookViewENT entBookView)
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
                        objCmd.CommandText = "PR_BookCopy_UpdateByPK";

                        objCmd.Parameters.AddWithValue("@BookCopyID", entBookView.BookCopyID);
                        objCmd.Parameters.AddWithValue("@BookCopyNo", entBookView.BookCopyNo);
                        objCmd.Parameters.AddWithValue("@Author", entBookView.Author);
                        objCmd.Parameters.AddWithValue("@Details", entBookView.Details);
                        objCmd.Parameters.AddWithValue("@BookTitle", entBookView.BookTitle);
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
