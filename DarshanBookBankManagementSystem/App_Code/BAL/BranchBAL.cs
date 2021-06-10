using DarshanBookBank.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BranchBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    
    public class BranchBAL
    {
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

        #region Constructor
        public BranchBAL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion Constructor

        #region SelectForDropDownList
        public DataTable SelectForDropDownList()
        {
            BranchDAL dalBranch = new BranchDAL();
            return dalBranch.SelectForDropDownList();
        }
        #endregion SelectForDropDownList
    }
}
