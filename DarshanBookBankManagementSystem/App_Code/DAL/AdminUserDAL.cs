using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminUserDAL
/// </summary>

namespace DarshanBookBank.DAL
{
    public class AdminUserDAL : DatabaseConfig
    {
        #region Constructor
        public AdminUserDAL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion Constructor

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

        public Boolean Insert(AdminUserENT entAdminUser)
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
                        objCmd.CommandText = "PR_AdminUser_Insert";
                        objCmd.Parameters.Add("@AdminUserID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                        objCmd.Parameters.Add("@AdminUserName", SqlDbType.VarChar).Value = entAdminUser.AdminUserName;
                        objCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = entAdminUser.Email;
                        objCmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = entAdminUser.Password;
                        objCmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = entAdminUser.MobileNo;
                        objCmd.Parameters.Add("@InstituteID", SqlDbType.Int).Value = entAdminUser.InstituteID;
                        objCmd.Parameters.Add("@BranchID", SqlDbType.Int).Value = entAdminUser.BranchID;
                        objCmd.Parameters.Add("@ProfilePicture", SqlDbType.VarChar).Value = entAdminUser.ProfilePicture;

                        #endregion Prepare Command

                        objCmd.ExecuteNonQuery();
                        if (objCmd.Parameters["@AdminUserID"] != null)
                        {
                            entAdminUser.AdminUserID = Convert.ToInt32(objCmd.Parameters["@AdminUserID"].Value);
                        }


                        return true;
                    }
                    //catch (SqlException sqlex)
                    //{
                    //    Message = sqlex.InnerException.Message.ToString();
                    //    return false;
                    //}
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

        #endregion Insert Operation

        #region Login Operation

        #region Select By Username Password Operation
        public AdminUserENT SelectByUsernamePassword(SqlString AdminUserName, SqlString Password)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                AdminUserENT entAdminUser = new AdminUserENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_AdminUser_SelectByAdminUserNamePassword";
                        objCmd.Parameters.Add("@AdminUserName", SqlDbType.VarChar).Value = AdminUserName;
                        objCmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;

                        #endregion Prepare Command

                        #region ReadData and Set Controls

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {

                            while (objSDR.Read())
                            {
                                if (!objSDR["AdminUserID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.AdminUserID = Convert.ToInt32(objSDR["AdminUserID"]);
                                }
                                if (!objSDR["AdminUserName"].Equals(DBNull.Value))
                                {
                                    entAdminUser.AdminUserName = Convert.ToString(objSDR["AdminUserName"]);
                                }
                                if (!objSDR["Password"].Equals(DBNull.Value))
                                {
                                    entAdminUser.Password = Convert.ToString(objSDR["Password"]);
                                }
                                if (!objSDR["InstituteID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.InstituteID = Convert.ToInt32(objSDR["InstituteID"]);
                                }
                                if (!objSDR["BranchID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.BranchID = Convert.ToInt32(objSDR["BranchID"]);
                                }
                                if (!objSDR["ProfilePicture"].Equals(DBNull.Value))
                                {
                                    entAdminUser.ProfilePicture = Convert.ToString(objSDR["ProfilePicture"]);
                                }
                            }




                            return entAdminUser;
                        }

                        #endregion ReadData and Set Controls
                    }

                    catch (SqlException sqlex)
                    {
                        Message = sqlex.Message.ToString();
                        return null;
                    }

                    catch (Exception ex)
                    {
                        Message = ex.Message.ToString();
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
        #endregion Select By Username Password Operation

        #endregion

        #region Select By User ID

        public AdminUserENT SelectByUserID(SqlString AdminUserID)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                objConn.Open();
                AdminUserENT entAdminUser = new AdminUserENT();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_AdminUser_SelectByAdminUserID";
                        objCmd.Parameters.AddWithValue("@AdminUserID", AdminUserID);

                        #endregion Prepare Command

                        #region ReadData and Set Controls

                        using (SqlDataReader objSDR = objCmd.ExecuteReader())
                        {

                            while (objSDR.Read())
                            {
                                if (!objSDR["AdminUserID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.AdminUserID = Convert.ToInt32(objSDR["AdminUserID"]);
                                }
                                if (!objSDR["AdminUserName"].Equals(DBNull.Value))
                                {
                                    entAdminUser.AdminUserName = Convert.ToString(objSDR["AdminUserName"]);
                                }
                                if (!objSDR["Password"].Equals(DBNull.Value))
                                {
                                    entAdminUser.Password = Convert.ToString(objSDR["Password"]);
                                }
                                if (!objSDR["Email"].Equals(DBNull.Value))
                                {
                                    entAdminUser.Email = Convert.ToString(objSDR["Email"]);
                                }
                                if (!objSDR["MobileNo"].Equals(DBNull.Value))
                                {
                                    entAdminUser.MobileNo = Convert.ToString(objSDR["MobileNo"]);
                                }
                                if (!objSDR["InstituteID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.InstituteID = Convert.ToInt32(objSDR["InstituteID"]);
                                }
                                if (!objSDR["BranchID"].Equals(DBNull.Value))
                                {
                                    entAdminUser.BranchID = Convert.ToInt32(objSDR["BranchID"]);
                                }
                                if (!objSDR["ProfilePicture"].Equals(DBNull.Value))
                                {
                                    entAdminUser.ProfilePicture = Convert.ToString(objSDR["ProfilePicture"]);
                                }
                                if (!objSDR["InstituteName"].Equals(DBNull.Value))
                                {
                                    entAdminUser.InstituteName = Convert.ToString(objSDR["InstituteName"]);
                                }
                                if (!objSDR["BranchName"].Equals(DBNull.Value))
                                {
                                    entAdminUser.BranchName = Convert.ToString(objSDR["BranchName"]);
                                }
                                if (!objSDR["CreationDate"].Equals(DBNull.Value))
                                {
                                    entAdminUser.CreationDate = Convert.ToString(objSDR["CreationDate"]);
                                }
                                if (!objSDR["ModificationDate"].Equals(DBNull.Value))
                                {
                                    entAdminUser.ModificationDate = Convert.ToString(objSDR["ModificationDate"]);
                                }
                            }




                            return entAdminUser;
                        }

                        #endregion ReadData and Set Controls
                    }

                    catch (SqlException sqlex)
                    {
                        Message = sqlex.Message.ToString();
                        return null;
                    }

                    catch (Exception ex)
                    {
                        Message = ex.Message.ToString();
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

        #region Update AdminUser

        public Boolean UpdateAdminUser(AdminUserENT entAdminUser)
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
                        objCmd.CommandText = "PR_AdminUser_UpdateByPK";

                        objCmd.Parameters.AddWithValue("@AdminUserID", entAdminUser.AdminUserID);
                        objCmd.Parameters.AddWithValue("@AdminUserName", entAdminUser.AdminUserName);
                        objCmd.Parameters.AddWithValue("@Email", entAdminUser.Email);
                        objCmd.Parameters.AddWithValue("@Password", entAdminUser.Password);
                        objCmd.Parameters.AddWithValue("@MobileNo", entAdminUser.MobileNo);
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

        #region Update AdminUser Profile Picture

        public Boolean UpdateAdminUserProfilePicture(SqlInt32 AdminUserID, SqlString ProfilePicture)
        {
            using (SqlConnection objConn = new SqlConnection(ConnectionString))
            {
                AdminUserENT entAdminUser = new AdminUserENT();
                objConn.Open();
                using (SqlCommand objCmd = objConn.CreateCommand())
                {
                    try
                    {
                        #region Prepare Command
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_AdminUser_UpdateProfilePictureByPK";

                        objCmd.Parameters.AddWithValue("@AdminUserID", AdminUserID);
                        objCmd.Parameters.AddWithValue("@ProfilePicture", ProfilePicture);
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
