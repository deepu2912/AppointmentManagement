using Appointment_management_system_integration.Modals;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Appointment_management_system_integration.DepartmentAdmin
{
    public partial class Users : System.Web.UI.Page
    {
        encdec sec = new encdec();
        static Boolean MeetingWithUrl = true;
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
                    string MeetingUrl = "";

                    if (dep.Role != "Admin")
                    {
                        if (MeetingWithUrl == true)
                        {
                            Action = Action + " <i class=\"fa fa-link AddMeetingUrl\" title='Add Meeting URL' style='cursor:pointer;' userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "'  MeetingUrl='" + dep.Original_MeetingUrl + "'  ></i>";

                            if (dep.MeetingUrl == "")
                            {

                            }
                            else
                            {
                                MeetingUrl = "<a href='" + dep.MeetingUrl + "' style='cursor:pointer;' target='_blank' MeetingUrl='" + dep.MeetingUrl + "'>Meeting URL Attached</a>";
                            }
                        }

                        Action = Action + " <i class=\"fa fa-trash clickable_events deleteUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";


                        if (dep.Visible == "Y")
                        {
                            Action = Action + " <i class=\"fa fa-eye clickable_events HideUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";
                        }
                        else
                        {
                            Action = Action + " <i class=\"fa fa-eye-slash clickable_events ShowUser\" userrowid='" + sec.convertStringToHex(dep.UserRowID, 102) + "' empid='" + sec.convertStringToHex(dep.EmpID, 102) + "' ></i>";
                        }
                    }

                    tableData = tableData + "  <tr> <td>" + count + "</td> <td>" + dep.EmpID + "</td> <td>" + dep.EmpName + "</td>  <td>" + dep.EmpMobile + "</td>  <td>" + dep.EmpEmail + "</td>   <td>" + dep.Department_Name + "</td>  <td>" + dep.Role + "</td>   <td>" + MeetingUrl + "</td><td>" + Action + "</td></tr>";
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

        [WebMethod]
        public static string UpdateMeetingUrl(string EmployeeID, string UserRowID, string MeetingUrl, string SaveUrl)
        {
            string returnResult = "";
            try
            {

                encdec sec = new encdec();
                csDataLayer DL = new csDataLayer();
                csLogs Log2 = new csLogs();

                Log2.LogWrite("EmployeeID  :== " + EmployeeID);

                EmployeeID = sec.convertHexToString(EmployeeID, 102);
                UserRowID = sec.convertHexToString(UserRowID, 102);

                Log2.LogWrite("Long Service  :== " + MeetingUrl);

                string Encoded_MeetingUrl = sec.convertStringToHex(MeetingUrl, 102);

                Log2.LogWrite("Short Service  :== " + Encoded_MeetingUrl);

                string result = "";
                string URi = "https://webtest.tpdelhi.com/meeting/";
                string UrlParams = "api/shorturl";

                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(URi);

                // Add an Accept header for JSON format.
                client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));

                var content = new FormUrlEncodedContent(new[]
            {
                new KeyValuePair<string, string>("myURL", Encoded_MeetingUrl)
            });

                Log2.LogWrite("Continue.... :== ");

                HttpResponseMessage response = null;

                try
                {
                    Log2.LogWrite("Continue 1.... :== ");
                    response = client.PostAsync(UrlParams, content).Result;
                    Log2.LogWrite("Continue 2.... :== ");
                }
                catch (Exception ex)
                {
                    csLogs Log = new csLogs();
                    Log.LogWrite("Url Shortner Service  :== " + ex.Message + ", Response Status: =" + response.IsSuccessStatusCode);
                }
                // List data response.


                if (response.IsSuccessStatusCode)
                {
                    csLogs Log1 = new csLogs();
                    var ReturnResult = response.Content.ReadAsStringAsync();

                    var myData = JsonConvert.DeserializeObject<Url>(ReturnResult.Result);

                    Log1.LogWrite("Short Url  :== " + myData.data);
                    Log1.LogWrite("Long Url  :== " + MeetingUrl);

                    string Query = "Update Tbl_User_Master Set MeetingUrl = '" + myData.data + "', Original_MeetingURL = '" + MeetingUrl + "'  ,  Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'  Where ID = '" + UserRowID + "' and EMP_ID = '" + EmployeeID + "'";

                    Log1.LogWrite("Query  :== " + Query);

                    result = DL.ExecuteQueries(Query);
                }
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
            catch (Exception ex)
            {
                var Result = new
                {
                    status = 401,
                    data = "Error"
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                csLogs Log = new csLogs();
                Log.LogWrite("Url Shortner :== " + ex.Message);
                return returnResult;
            }
        }

        public class Url
        {
            public string data { get; set; }
        }

    }
}