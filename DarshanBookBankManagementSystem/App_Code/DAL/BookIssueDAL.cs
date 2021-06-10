using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookIssue
/// </summary>
/// 
namespace DarshanBookBank.DAL
{
    public class BookIssueDAL : DatabaseConfig
    {
        #region Constructor
        public BookIssueDAL()
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

        public Boolean Insert(BookIssueENT entBookIssue)
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
                        objCmd.CommandText = "PR_BookIssue_SelectByBookcopyNo";

                        objCmd.Parameters.Add("@BookIssueID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        objCmd.Parameters.AddWithValue("@BookDueDate", entBookIssue.BookDueDate);
                        objCmd.Parameters.AddWithValue("@BookID", entBookIssue.BookID);
                        objCmd.Parameters.AddWithValue("@BookCopyID", entBookIssue.BookCopyID);
                        objCmd.Parameters.AddWithValue("@StudentID", entBookIssue.StudentID);
                        objCmd.Parameters.AddWithValue("@IssuedByStaffID", entBookIssue.IssuedByStaffID);
                        #endregion

                        objCmd.ExecuteNonQuery();

                        if (objCmd.Parameters["@BookIssueID"] != null)
                            entBookIssue.BookIssueID = Convert.ToInt32(objCmd.Parameters["@BookIssueID"].Value);

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


        #region Select By Enrollemnt No With Book Details

        public DataTable SelectByEnrollemntNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                StudentENT entStudent = new StudentENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookIssue_SelectByEnrollemntNoWithBookDetails";

                        objCmd.Parameters.AddWithValue("@EnrollmentNo", EnrollmentNo);
                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);
                        #endregion

                        using (SqlDataReader objSDRR = objCmd.ExecuteReader())
                        {
                            while(objSDRR.Read())
                            {
                                if (!objSDRR["StudentID"].Equals(DBNull.Value))
                                    entStudent.StudentID = Convert.ToInt32(objSDRR["StudentID"]);

                                if (!objSDRR["EntrollmentNo"].Equals(DBNull.Value))
                                    entStudent.EntrollmentNo = Convert.ToString(objSDRR["EntrollmentNo"]);

                                if (!objSDRR["StudentName"].Equals(DBNull.Value))
                                    entStudent.StudentName = Convert.ToString(objSDRR["StudentName"]);

                                if (!objSDRR["CreationDate"].Equals(DBNull.Value))
                                    entStudent.CreationDate = Convert.ToString(objSDRR["CreationDate"]);

                                if (!objSDRR["ModificationDate"].Equals(DBNull.Value))
                                    entStudent.ModificationDate = Convert.ToString(objSDRR["ModificationDate"]);

                                if (!objSDRR["InstituteName"].Equals(DBNull.Value))
                                    entStudent.InstituteName = Convert.ToString(objSDRR["InstituteName"]);

                                if (!objSDRR["BranchName"].Equals(DBNull.Value))
                                    entStudent.BranchName = Convert.ToString(objSDRR["BranchName"]);
                            }
                        }

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
                        {
                            objConn.Close();
                        }
                    }
                }
            }
        }

        #endregion

        #region Select By Book Copy No With Book Details

        public DataTable SelectByBookCopyNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString BookCopyNo)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                StudentENT entStudent = new StudentENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookIssue_SelectByBookCopyNoWithBookDetails";

                        objCmd.Parameters.AddWithValue("@BookCopyNo", BookCopyNo);
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
                        {
                            objConn.Close();
                        }
                    }
                }
            }
        }

        #endregion

        #region  Book Return Operation

        public Boolean BookReturn(BookIssueENT entBookIssue)
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
                        objCmd.CommandText = "PR_BookIssue_ReturnBookByUserID";

                        objCmd.Parameters.AddWithValue("@BookCopyID", entBookIssue.BookCopyID);
                        objCmd.Parameters.AddWithValue("@ReturnByStaffID", entBookIssue.ReturnByStaffID);
                        objCmd.Parameters.AddWithValue("@ReturnRemarks", entBookIssue.ReturnRemarks);

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

        #region View By Enrollemnt No With Book Details

        public StudentENT ViewByEnrollemntNoWithBookDetails(SqlInt32 InstituteID, SqlInt32 BranchID, SqlInt32 StudentID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                StudentENT entStudent = new StudentENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_BookIssue_SelectByStudentNoWithBookDetails";

                        objCmd.Parameters.AddWithValue("@StudentID", StudentID);
                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);
                        #endregion

                        using (SqlDataReader objSDRR = objCmd.ExecuteReader())
                        {
                            while (objSDRR.Read())
                            {
                                if (!objSDRR["StudentID"].Equals(DBNull.Value))
                                    entStudent.StudentID = Convert.ToInt32(objSDRR["StudentID"]);

                                if (!objSDRR["EntrollmentNo"].Equals(DBNull.Value))
                                    entStudent.EntrollmentNo = Convert.ToString(objSDRR["EntrollmentNo"]);

                                if (!objSDRR["StudentName"].Equals(DBNull.Value))
                                    entStudent.StudentName = Convert.ToString(objSDRR["StudentName"]);

                                if (!objSDRR["Email"].Equals(DBNull.Value))
                                    entStudent.Email = Convert.ToString(objSDRR["Email"]);

                                if (!objSDRR["SemesterID"].Equals(DBNull.Value))
                                    entStudent.SemesterID = Convert.ToInt32(objSDRR["SemesterID"]);

                                if (!objSDRR["CreationDate"].Equals(DBNull.Value))
                                    entStudent.CreationDate = Convert.ToString(objSDRR["CreationDate"]);

                                if (!objSDRR["ModificationDate"].Equals(DBNull.Value))
                                    entStudent.ModificationDate = Convert.ToString(objSDRR["ModificationDate"]);

                                if (!objSDRR["InstituteName"].Equals(DBNull.Value))
                                    entStudent.InstituteName = Convert.ToString(objSDRR["InstituteName"]);

                                if (!objSDRR["BranchName"].Equals(DBNull.Value))
                                    entStudent.BranchName = Convert.ToString(objSDRR["BranchName"]);
                            }
                        }
                        return entStudent;

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
