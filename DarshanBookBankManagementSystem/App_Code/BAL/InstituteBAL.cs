using DarshanBookBank.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InstituteBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class InstituteBAL
    {
        #region Constructor
        public InstituteBAL()
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

        #region SelectForDropDownList

        public DataTable SelectForDropDownList()
        {
            InstituteDAL dalInstitute = new InstituteDAL();
            return dalInstitute.SelectForDropDownList();
        }

        #endregion SelectForDropDownList
    }
}
