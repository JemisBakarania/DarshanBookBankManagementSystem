using DarshanBookBank.DAL;
using DarshanBookBank.ENT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentBAL
/// </summary>
namespace DarshanBookBank.BAL
{
    public class StudentBAL
    {
        #region onstructor
        public StudentBAL()
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
            StudentDAL dalStudent = new StudentDAL();
            if (dalStudent.Insert(entStudent))
            {
                return true;
            }
            else
            {
                Message = dalStudent.Message;
                return false;
            }
        }

        #endregion Insert Operation 

        #region Select By Enrollment No
        public StudentENT SelectByEnrollmentNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
        {
            StudentDAL dalStudent = new StudentDAL();
            return dalStudent.SelectByEnrollmentNo(InstituteID, BranchID, EnrollmentNo);
        }
        #endregion

        #region ViewByEnrollmentNo

        public DataTable ViewByEnrollmentNo(SqlInt32 InstituteID, SqlInt32 BranchID, SqlString EnrollmentNo)
        {
            StudentDAL dalStudent = new StudentDAL();
            return dalStudent.ViewByEnrollmentNo(InstituteID, BranchID, EnrollmentNo);
        }
        #endregion

        #region Select All Student

        public DataTable SelectAllStudent(SqlInt32 InstituteID, SqlInt32 BranchID)
        {
            StudentDAL dalStudent = new StudentDAL();
            return dalStudent.SelectAllStudent(InstituteID, BranchID);
        }
        #endregion

        #region Delete Student

        public Boolean DeleteStudent(SqlInt32 StudentID)
        {
            StudentDAL dalStudent = new StudentDAL();
            if(dalStudent.DeleteStudent(StudentID))
            {
                return true;
            }
            else
            {
                Message = dalStudent.Message;
                return false;
            }

        }
        #endregion

        #region Update Student

        public Boolean UpdateStudent(StudentENT entStudent)
        {
            StudentDAL dalStudent = new StudentDAL();
            if (dalStudent.UpdateStudent(entStudent))
            {
                return true;
            }
            else
            {
                Message = dalStudent.Message;
                return false;
            }
        }
        #endregion
    }
}