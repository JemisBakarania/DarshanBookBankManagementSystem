using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminUserBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class AdminUserBAL
    {
        #region Constructor
        public AdminUserBAL()
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
            AdminUserDAL dalAdminUser = new AdminUserDAL();
            if (dalAdminUser.Insert(entAdminUser))
            {
                return true;
            }
            else
            {
                Message = dalAdminUser.Message;
                return false;
            }
        }

        #endregion Insert Operation 

        #region Login Operation

        public AdminUserENT SelectByUsernamePassword(SqlString AdminUserName, SqlString Password)
        {
            AdminUserDAL dalAdminUser = new AdminUserDAL();
            return dalAdminUser.SelectByUsernamePassword(AdminUserName, Password);

        }
        #endregion

        #region Select By User ID

        public AdminUserENT SelectByUserID(SqlString AdminUserID)
        {
            AdminUserDAL dalAdminUser = new AdminUserDAL();
            return dalAdminUser.SelectByUserID(AdminUserID);
        }
        #endregion

        #region Update AdminUser

        public Boolean UpdateAdminUser(AdminUserENT entAdminUser)
        {
            AdminUserDAL dalentAdminUser = new AdminUserDAL();
            if (dalentAdminUser.UpdateAdminUser(entAdminUser))
            {
                return true;
            }
            else
            {
                Message = dalentAdminUser.Message;
                return false;
            }
        }
        #endregion

        #region Update AdminUser Profile Picture

        public Boolean UpdateAdminUserProfilePicture(SqlInt32 AdminUserID, SqlString ProfilePicture)
        {
            AdminUserDAL dalentAdminUser = new AdminUserDAL();
            if (dalentAdminUser.UpdateAdminUserProfilePicture(AdminUserID, ProfilePicture))
            {
                return true;
            }
            else
            {
                Message = dalentAdminUser.Message;
                return false;
            }

        }

        #endregion
    }
}
