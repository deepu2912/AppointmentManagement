using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Appointment_management_system_integration.Modals
{
    public class csCommon
    {
        csDataLayer Dl = new csDataLayer();
        /// <summary>
        /// Common function to fetch Employee Details existing to particular Department
        /// </summary>
        /// <param name="EmpID"></param>
        /// <returns></returns>
        public List<csEmployee> EmployeeData(string EmpID)
        {
            List<csEmployee> EmpList = new List<csEmployee>();

            DataSet ds = new DataSet();

            //string Query = "Select * from  Tbl_User_Master TU , [dbo].[Tbl_Department_Master] DM Where EMP_ID = '" + EmpID + "' AND Tu.Department_ID = DM.ID  And Tu.Active_flag = 'Y' And DM.Active_flag = 'Y'";
            string Query = "Select * from  Tbl_User_Master TU LEFT Join [dbo].[Tbl_Department_Master] DM  On Tu.Department_ID = DM.ID  Where EMP_ID = '" + EmpID + "'    And Tu.Active_flag = 'Y' ";

            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                EmpList = ds.Tables[0].AsEnumerable().Select(DataRow => new csEmployee
                {
                    EmpID = DataRow.Field<object>("EMP_ID").ToString(),
                    EmpName = DataRow.Field<string>("Name"),
                    EmpMobile = DataRow.Field<string>("Mob_No"),
                    EmpEmail = DataRow.Field<string>("Email_ID"),
                    Role = DataRow.Field<string>("Role"),
                    Department_ID = Convert.ToString(DataRow.Field<object>("Department_ID")),
                    Department_Name = Convert.ToString(DataRow.Field<object>("Department_Name"))

                }).ToList();
            }

            return EmpList;
        }


        /// <summary>
        /// Fetch All Navigation Pages from Database according to particular roles of a user,
        /// </summary>
        /// <param name="Role"></param>
        /// <param name="Department_ID"></param>
        /// <returns></returns>
        /// 
        public List<csPageMaster> PagesData(string Role, string Department_ID)
        {

            List<csPageMaster> PageList = new List<csPageMaster>();

            DataSet ds = new DataSet();

            if (Department_ID == "")
            {
                Department_ID = "0";
            }

            string Query = "Select * from tbl_Page_master Where Department_id = '" + Department_ID + "' and  (Role = '" + Role + "' or Role = 'Default') and Active_flag = 'Y' Order by Sno";

            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                PageList = ds.Tables[0].AsEnumerable().Select(DataRow => new csPageMaster
                {
                    PageID = DataRow.Field<object>("ID").ToString(),
                    SNO = Convert.ToString(DataRow.Field<object>("SNO")),
                    PageName = Convert.ToString(DataRow.Field<string>("PAGENAME")),
                    PagePath = Convert.ToString(DataRow.Field<string>("PagePath")),
                    PageIcon = Convert.ToString(DataRow.Field<string>("PageIcon"))
                }).ToList();
            }

            return PageList;
        }

        /// <summary>
        /// Get All Department Data
        /// </summary>
        /// <returns></returns>
        public List<csDepartmentMaster> DepartmentData()
        {
            List<csDepartmentMaster> DepartmentData = new List<csDepartmentMaster>();

            DataSet ds = new DataSet();

            string Query = " Select * from [dbo].[Tbl_Department_Master] Where Active_flag = 'Y' order by 1";

            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DepartmentData = ds.Tables[0].AsEnumerable().Select(DataRow => new csDepartmentMaster
                {
                    DepartmentID = DataRow.Field<object>("ID").ToString(),
                    DepartmentName = DataRow.Field<object>("Department_Name").ToString(),
                    No_of_officials = DataRow.Field<object>("No_of_officials").ToString(),
                    Slot_duration = DataRow.Field<object>("Slot_duration").ToString(),
                    Slot_start_time = DataRow.Field<object>("Slot_start_time").ToString(),
                    Slot_end_time = DataRow.Field<object>("Slot_end_time").ToString(),
                    No_of_days = DataRow.Field<object>("No_of_days").ToString(),
                    Based_On = DataRow.Field<object>("Based_On").ToString()
                }).ToList();
            }

            return DepartmentData;
        }

        /// <summary>
        /// Get Department Employees Associated with Particular Departments
        /// </summary>
        /// <param name="DepartmentID"></param>
        /// <returns></returns>
        /// 
        public List<csEmployee> DepartmentEmployees(string DepartmentID)
        {
            List<csEmployee> EmployeesData = new List<csEmployee>();

            DataSet ds = new DataSet();

            string Query = "Select * from [dbo].[Tbl_User_Master] Where Active_flag = 'Y' and Department_ID = " + DepartmentID + " order by 1";

            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                EmployeesData = ds.Tables[0].AsEnumerable().Select(DataRow => new csEmployee
                {
                    UserRowID = DataRow.Field<object>("ID").ToString(),
                    Department_ID = DataRow.Field<object>("Department_ID").ToString(),
                    EmpID = DataRow.Field<object>("EMP_ID").ToString(),
                    EmpName = DataRow.Field<object>("Name").ToString(),
                    EmpMobile = DataRow.Field<object>("Mob_No").ToString(),
                    EmpEmail = DataRow.Field<object>("Email_ID").ToString(),
                    Department_Name = DataRow.Field<object>("EmpDepartment").ToString(),
                    Role = DataRow.Field<object>("Role").ToString(),
                    Visible = DataRow.Field<object>("Visible").ToString(),
                    MeetingUrl = Convert.ToString(DataRow.Field<object>("MeetingUrl")),
                    Original_MeetingUrl = Convert.ToString(DataRow.Field<object>("Original_MeetingURL")),
                }).ToList();
            }

            return EmployeesData;
        }

        
        /// <summary>
        /// Get Particular Department Details from ID
        /// </summary>
        /// <param name="DepartmentID"></param>
        /// <returns></returns>

        public List<csDepartmentMaster> DepartmentDetailsByID(string DepartmentID)
        {
            List<csDepartmentMaster> DepartmentData = new List<csDepartmentMaster>();

            DataSet ds = new DataSet();

            string Query = "Select * from [dbo].[Tbl_Department_Master] Where Active_flag = 'Y' and ID = " + DepartmentID + "  ";

            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DepartmentData = ds.Tables[0].AsEnumerable().Select(DataRow => new csDepartmentMaster
                {
                    DepartmentID = DataRow.Field<object>("ID").ToString(),
                    DepartmentName = DataRow.Field<object>("Department_Name").ToString()
                }).ToList();
            }

            return DepartmentData;
        }
    }
}