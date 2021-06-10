using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentDAL
/// </summary>
namespace DarshanBookBank.DAL
{
    public class StudentDAL : DatabaseConfig
    {
        #region Constructor
        public StudentDAL()
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

        public Boolean Insert(StudentENT entStudent)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                using(SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Perpare Command

                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_Student_Insert";

                        objCmd.Parameters.Add("@StudentID", SqlDbType.Int).Direction = ParameterDirection.Output;
                        objCmd.Parameters.AddWithValue("@StudentName", entStudent.StudentName);
                        objCmd.Parameters.AddWithValue("@EntrollmentNo", entStudent.EntrollmentNo);
                        objCmd.Parameters.AddWithValue("@Email", entStudent.Email);
                        objCmd.Parameters.AddWithValue("@InstituteID", entStudent.InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", entStudent.BranchID);
                        objCmd.Parameters.AddWithValue("@SemesterID", entStudent.SemesterID);
                        objCmd.Parameters.AddWithValue("@AdminUserID", entStudent.AdminUserID);

                        #endregion

                        objCmd.ExecuteNonQuery();
                        if(objCmd.Parameters["@StudentID"] !=null)
                        {
                            entStudent.StudentID = Convert.ToInt32(objCmd.Parameters["@StudentID"].Value);
                        }

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

        #region Select By Enrollment No

        public StudentENT SelectByEnrollmentNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
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
                        objCmd.CommandText = "PR_Student_SelectByEnrollemntNo";

                        objCmd.Parameters.AddWithValue("@EnrollmentNo", EnrollmentNo);
                        objCmd.Parameters.AddWithValue("@InstituteID", InstituteID);
                        objCmd.Parameters.AddWithValue("@BranchID", BranchID);
                        #endregion

                        #region ReadData and Set Controls
                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {
                            while(objSDR.Read())
                            {
                                if (!objSDR["StudentID"].Equals(DBNull.Value))
                                    entStudent.StudentID = Convert.ToInt32(objSDR["StudentID"]);

                            }
                        }
                        #endregion
                        return entStudent;
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

        #region View By Enrollment No

        public DataTable ViewByEnrollmentNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
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
                        objCmd.CommandText = "PR_Student_SelectByEnrollemntNo";

                        objCmd.Parameters.AddWithValue("@EnrollmentNo", EnrollmentNo);
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

        #region Select All Student

        public DataTable SelectAllStudent(SqlInt32 InstituteID, SqlInt32 BranchID)
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
                        objCmd.CommandText = "PR_Student_SelectAll";

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

        #region Delete Book

        public Boolean DeleteStudent(SqlInt32 StudentID)
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
                        objCmd.CommandText = "PR_Student_DeleteByPK";

                        objCmd.Parameters.AddWithValue("@StudentID", StudentID);
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

        #region Update Student

        public Boolean UpdateStudent(StudentENT entStudent)
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
                        objCmd.CommandText = "PR_Student_UpdateByPK";

                        objCmd.Parameters.AddWithValue("@StudentID", entStudent.StudentID);
                        objCmd.Parameters.AddWithValue("@StudentName", entStudent.StudentName);
                        objCmd.Parameters.AddWithValue("@EntrollmentNo", entStudent.EntrollmentNo);
                        objCmd.Parameters.AddWithValue("@Email", entStudent.Email);
                        objCmd.Parameters.AddWithValue("@SemesterID", entStudent.SemesterID);
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
