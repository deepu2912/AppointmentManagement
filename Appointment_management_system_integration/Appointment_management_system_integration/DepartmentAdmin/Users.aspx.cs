using Appointment_management_system_integration.Modals;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration.DepartmentAdmin
{
    public partial class Users : System.Web.UI.Page
    {
        encdec sec = new encdec();
        protected void Page_Load(object sender, EventArgs e)
        {
            string DepartmentID = Convert.ToString(Session["Department_ID"]);
            csCommon common = new csCommon();
            List<csEmployee> EmployeeList = new List<csEmployee>();

            EmployeeList = common.DepartmentEmployees(DepartmentID);

            string tableData = string.Empty;

            if (EmployeeList.Count > 0 && EmployeeList != null)
            {
                int count = 1;
                EmployeeList.ForEach(dep =>
                {
                    String Action = "";
                    if (dep.Role != "Admin")
                    {
                        Action = " <i class=\"fa fa-trash clickable_events deleteUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";

                        if (dep.Visible == "Y")
                        {
                            Action = Action + " <i class=\"fa fa-eye clickable_events HideUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";
                        }
                        else
                        {
                            Action = Action + " <i class=\"fa fa-eye-slash clickable_events ShowUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";
                        }
                    }



                    tableData = tableData + "  <tr> <td>" + count + "</td> <td>" + dep.EmpID + "</td> <td>" + dep.EmpName + "</td>  <td>" + dep.EmpMobile + "</td>  <td>" + dep.EmpEmail + "</td>   <td>" + dep.Department_Name + "</td>  <td>" + dep.Role + "</td>  <td>" + Action + "</td></tr>";
                    count++;
                });
                UserData.InnerHtml = "";
                UserData.InnerHtml = tableData;
            }
        }


        [WebMethod]
        public static string DeleteUserDepartment(string EmployeeID, string UserRowID)
        {
            string returnResult = "";
            encdec sec = new encdec();
            csDataLayer DL = new csDataLayer();
            EmployeeID = sec.convertHexToString(EmployeeID, 102);
            UserRowID = sec.convertHexToString(UserRowID, 102);

            string Query = "Update Tbl_User_Master Set Active_flag = 'N' ,  Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'  Where ID = '" + UserRowID + "' and EMP_ID = '" + EmployeeID + "'";
            string result = DL.ExecuteQueries(Query);

            if (result == "success")
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
                    data = "Error"
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            return returnResult;
        }

        [WebMethod]
        public static string HideUserDepartment(string EmployeeID, string UserRowID)
        {
            string returnResult = "";
            encdec sec = new encdec();
            csDataLayer DL = new csDataLayer();
            EmployeeID = sec.convertHexToString(EmployeeID, 102);
            UserRowID = sec.convertHexToString(UserRowID, 102);

            string Query = "Update Tbl_User_Master Set Visible = 'N' ,  Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'  Where ID = '" + UserRowID + "' and EMP_ID = '" + EmployeeID + "'";
            string result = DL.ExecuteQueries(Query);

            if (result == "success")
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
                    data = "Error"
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            return returnResult;
        }

        [WebMethod]
        public static string ShowUserDepartment(string EmployeeID, string UserRowID)
        {
            string returnResult = "";
            encdec sec = new encdec();
            csDataLayer DL = new csDataLayer();
            EmployeeID = sec.convertHexToString(EmployeeID, 102);
            UserRowID = sec.convertHexToString(UserRowID, 102);

            string Query = "Update Tbl_User_Master Set Visible = 'Y' ,  Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'  Where ID = '" + UserRowID + "' and EMP_ID = '" + EmployeeID + "'";
            string result = DL.ExecuteQueries(Query);

            if (result == "success")
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
                    data = "Error"
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            return returnResult;
        }



    }
}