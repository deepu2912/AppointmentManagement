using Appointment_management_system_integration.Modals;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration.User
{
    public partial class mybin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetAppointmentData(string SelectedDate)
        {
            string returnResult = "";
            try
            {
                csDataLayer DL = new csDataLayer();
                DataSet ds = new DataSet();
                string Query = "";
                string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);
                string EmpNo = HttpContext.Current.Request.Cookies["UserName"].Value.ToString();

                if (DepartmentID == "")
                {
                    var Result = new
                    {
                        status = 501,
                        data = "Session Department ID NULL"
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                    return returnResult;
                }

                Query = "Select AT.ID,AT.Department_ID,AT.Department_Slot_ID,AT.Notification_No,AT.CA_No,AT.Email_ID,AT.Mob_No,DSM.Slot_Date,DSM.Slot_start_time,DSM.Slot_end_time , AT.Appointment_Created_Date,(Select Based_On from Tbl_Department_Master Where ID = AT.Department_ID ) Based_On ,Official_Assigned,Appointment_Status,Status_Of_Meeting,(Select MeetingUrl from Tbl_User_Master Where EMP_ID = AT.Official_Assigned and Active_flag = 'Y') Meeting from Tbl_Appointment_Transactions AT INNER JOIN Tbl_Department_Slot_Master DSM on  DSM.ID = AT.Department_Slot_ID Where Cast(Slot_Date as date) = Cast('" + SelectedDate + "' as date) AND AT.Department_ID = '" + DepartmentID + "' AND DSM.Active_flag = 'Y' and AT.Active_Flag = 'Y' and AT.Official_Assigned = '" + EmpNo + "' ORDER BY Cast(Slot_start_time as time)";

                ds = DL.ShowDataInGridView(Query);

                if (ds != null)
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
                    var Result = new
                    {
                        status = 300,
                        data = "No Result found"
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                }
            }
            catch (Exception ex)
            {
                var Result = new
                {
                    status = 401,
                    data = "Please login & then try again."
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                csLogs Log = new csLogs();
                Log.LogWrite("Get Appointment Data :== " + ex.Message);
            }
            return returnResult;

        }

        [WebMethod]
        public static string UpdateAppointmentStatus(string AppointmentStatus, string TxtRemarks, string AppointmentID)
        {
            string returnResult = "";

            try
            {
                csDataLayer DL = new csDataLayer();
                DataSet ds = new DataSet();
                string Query = "";
                string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);
                string EmpNo = HttpContext.Current.Request.Cookies["UserName"].Value.ToString();

                if (DepartmentID == "")
                {
                    var Result = new
                    {
                        status = 501,
                        data = "Session Department ID NULL"
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                    return returnResult;
                }

                Query = "Update Tbl_Appointment_Transactions SET Status_Of_Meeting = '" + AppointmentStatus + "' , Remarks = '" + HttpUtility.HtmlEncode(TxtRemarks) + "' , Appointment_Completion_Date = Getdate() , Appointment_Completed_By = '" + EmpNo + "' Where ID = " + AppointmentID + " And Active_Flag = 'Y'";

                string res = DL.ExecuteQueries(Query);

                if (res == "success")
                {
                    var Result = new
                    {
                        status = 200,
                        data = "Data Updated Succesfully."
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);

                }
                else
                {
                    var Result = new
                    {
                        status = 300,
                        data = "Error"
                    };

                    returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                }
            }
            catch (Exception ex)
            {
                var Result = new
                {
                    status = 401,
                    data = "Error try again."
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
                csLogs Log = new csLogs();
                Log.LogWrite("Update Appointment Status :== " + ex.Message);
            }

            return returnResult;
        }

    }
}