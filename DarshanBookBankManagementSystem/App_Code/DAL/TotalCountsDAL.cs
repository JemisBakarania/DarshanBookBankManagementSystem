using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TotalConutsDAL
/// </summary>
/// 
namespace DarshanBookBank.DAL
{
    public class TotalCountsDAL : DatabaseConfig
    {
        #region Constructor
        public TotalCountsDAL()
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

        #region Total Books

        public TotalCountsENT SelectTotalBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                TotalCountsENT entTotalCounts = new TotalCountsENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Book_Count";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while(objSDR.Read())
                            {
                                if (!objSDR["TotalBooks"].Equals(DBNull.Value))
                                    entTotalCounts.TotalBooks = Convert.ToInt32(objSDR["TotalBooks"]);
                            }
                        }
                        return entTotalCounts;
                    }
                    catch (Exception ex)
                    {
                        Message = ex.Message;
                        return null;
                    }
                    finally
                    {
                        if(objConn.State == ConnectionState.Open)
                        {
                            objConn.Close();
                        }
                    }
                }
            }
        }

        #endregion

        #region Total Book Copy

        public TotalCountsENT SelectTotalBookCopy(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                TotalCountsENT entTotalCounts = new TotalCountsENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_Count";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["TotalBookCopy"].Equals(DBNull.Value))
                                    entTotalCounts.TotalBookCopy = Convert.ToInt32(objSDR["TotalBookCopy"]);
                            }
                        }
                        return entTotalCounts;
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

        #region Total Available Books

        public TotalCountsENT SelectAvailableBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                TotalCountsENT entTotalCounts = new TotalCountsENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_CountOfAvailableBooks";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["TotalBooksAvailable"].Equals(DBNull.Value))
                                    entTotalCounts.TotalBooksAvailable = Convert.ToInt32(objSDR["TotalBooksAvailable"]);
                            }
                        }
                        return entTotalCounts;
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

        #region Total Issued Books

        public TotalCountsENT SelectIssuedBooks(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                TotalCountsENT entTotalCounts = new TotalCountsENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookCopy_CountOfIssedBooks";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["TotalBooksIssued"].Equals(DBNull.Value))
                                    entTotalCounts.TotalBooksIssued = Convert.ToInt32(objSDR["TotalBooksIssued"]);
                            }
                        }
                        return entTotalCounts;
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

        #region Total Students

        public TotalCountsENT SelectStudents(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                TotalCountsENT entTotalCounts = new TotalCountsENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Student_Count";

                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);

                        #endregion

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while (objSDR.Read())
                            {
                                if (!objSDR["TotalStudent"].Equals(DBNull.Value))
                                    entTotalCounts.TotalStudent = Convert.ToInt32(objSDR["TotalStudent"]);
                            }
                        }
                        return entTotalCounts;
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
    }
}
