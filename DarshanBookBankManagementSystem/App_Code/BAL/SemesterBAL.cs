using DarshanBookBank.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SemesterBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class SemesterBAL
    {
        #region Constructor
        public SemesterBAL()
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

        #region SelectForDropDownList
        public DataTable SelectForDropDownList()
        {
            SemesterDAL dalSemester = new SemesterDAL();
            return dalSemester.SelectForDropDownList();
        }
        #endregion SelectForDropDownList
    }
}
