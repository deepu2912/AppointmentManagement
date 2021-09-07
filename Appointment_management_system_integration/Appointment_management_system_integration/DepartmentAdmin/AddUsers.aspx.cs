using Appointment_management_system_integration.Modals;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration.DepartmentAdmin
{
    public partial class AddUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string FetchEmployeeDetailsTele(string EmpID)
        {
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string Query = "Select Employee_Number,AD_Display_Name,bfunction as Department from  tele.dbo.entity_details Where Employee_Number = '" + EmpID + "'";
            ds = Dl.ShowDataInGridView(Query);
            string json = string.Empty;
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                json = JsonConvert.SerializeObject(ds.Tables[0], Formatting.Indented);
            }

            return json;
        }

        [WebMethod]
        public static string AddUsersToDepartment(string EmpID)
        {
            string returnResult = "";
            try
            {
                csDataLayer DL = new csDataLayer();
                DataTable dt = new DataTable { TableName = "EMPRECORDS" };

                DataSet ds = new DataSet();

                dt.Clear();
                dt.Columns.Add("EmpID");
                dt.Columns.Add("Role");

                EmpID = EmpID.Substring(1);
                string[] Employees = EmpID.Split(',');

                for (int i = 0; i < Employees.Length; i++)
                {
                    DataRow _Emp_id = dt.NewRow();
                    string[] Employee = Employees[i].Split('~');
                    string _EmpID = Employee[0];
                    string _EmpRole = Employee[1];
                    _Emp_id["EmpID"] = _EmpID;
                    _Emp_id["Role"] = _EmpRole;
                    dt.Rows.Add(_Emp_id);
                }

                string result;
                using (StringWriter sw = new StringWriter())
                {
                    dt.WriteXml(sw);
                    result = sw.ToString();
                }

                ///
                /// First we have check any admin is not Connected with another Department.
                ///

                string Query = "Exec Proc_CheckEmp_ExistsWithDepartment @EMPDATA = '" + result + "'";

                ds = DL.ShowDataInGridView(Query);

                ///
                ///If not exists then simply enter into else statement else it goes to if condition true and return the result.

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    var Result = new
                    {
                        status = 100,
                        data = ds.Tables[0]
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);

                }
                else
                {
                    string DepartmentID = Convert.ToString(HttpContext.Current.Session["DepartmentID"]);

                    if (DepartmentID == "")
                    {
                        string EmpNo = HttpContext.Current.Request.Cookies["UserName"].Value.ToString();
                        List<csEmployee> emp = new List<csEmployee>();
                        List<csPageMaster> pages = new List<csPageMaster>();
                        csCommon common = new csCommon();
                        emp = common.EmployeeData(EmpNo);

                        if (emp.Count > 0 && emp != null)
                        {
                            HttpContext.Current.Session["DepartmentID"] = emp[0].Department_ID;
                            DepartmentID = emp[0].Department_ID;
                        }
                    }

                    Query = "Exec Proc_Create_Department_Users @Department_ID='" + DepartmentID + "',@EMPDATA='" + result + "',@CreatedBy='" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'";

                    ds = new DataSet();
                    ds = DL.ShowDataInGridView(Query);

                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        var Result = new
                        {
                            status = 200,
                            data = "Success"
                        };

                        returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                    }
                    else
                    {
                        var Result = new
                        {
                            status = 401,
                            data = "Failed"
                        };

                        returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                    }

                }
            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Add Department :== " + ex.Message);
            }
            return returnResult;
        }

    }
}