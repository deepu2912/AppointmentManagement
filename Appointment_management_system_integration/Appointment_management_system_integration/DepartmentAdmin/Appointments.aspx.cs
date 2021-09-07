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

namespace Appointment_management_system_integration.DepartmentAdmin
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetAppointmentData(string SelectedDate, string appointmentType)
        {
            string returnResult = "";
            try
            {
                csDataLayer DL = new csDataLayer();
                DataSet ds = new DataSet();
                string Query = "";
                string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);

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

                if (appointmentType == "Assigned")
                {
                    Query = "Select AT.ID,AT.Department_ID,AT.Department_Slot_ID,AT.Notification_No,AT.CA_No,AT.Email_ID,AT.Mob_No,DSM.Slot_Date,DSM.Slot_start_time,DSM.Slot_end_time , AT.Appointment_Created_Date,(Select Based_On from Tbl_Department_Master Where ID = AT.Department_ID ) Based_On ,Official_Assigned from Tbl_Appointment_Transactions AT INNER JOIN Tbl_Department_Slot_Master DSM on  DSM.ID = AT.Department_Slot_ID Where Cast(Slot_Date as date) = Cast('" + SelectedDate + "' as date) AND AT.Department_ID = '" + DepartmentID + "' AND DSM.Active_flag = 'Y' and Appointment_Status like '%Assigned%' AND Official_Assigned IS NOT NULL";
                }
                else
                {
                    Query = "Select AT.ID,AT.Department_ID,AT.Department_Slot_ID,AT.Notification_No,AT.CA_No,AT.Email_ID,AT.Mob_No,DSM.Slot_Date,DSM.Slot_start_time,DSM.Slot_end_time , AT.Appointment_Created_Date ,(Select Based_On from Tbl_Department_Master Where ID = AT.Department_ID ) Based_On ,Official_Assigned from Tbl_Appointment_Transactions AT INNER JOIN Tbl_Department_Slot_Master DSM on  DSM.ID = AT.Department_Slot_ID Where  Cast(Slot_Date as date) = Cast('" + SelectedDate + "' as date) AND AT.Department_ID = '" + DepartmentID + "' AND DSM.Active_flag = 'Y' And Appointment_Status = 'NEW' AND Official_Assigned IS NULL";
                }



                ds = DL.ShowDataInGridView(Query);

                if (ds != null)
                {

                    string UserUqery = "Select ID, Department_ID, EMP_ID, Name, Mob_No, Email_ID, Role from tbl_user_Master Where Department_ID = '" + DepartmentID + "' and Role = 'User' And Active_flag = 'Y' and Visible = 'Y' ";

                    DataSet ds1 = DL.ShowDataInGridView(UserUqery);

                    var Result = new
                    {
                        status = 100,
                        data = ds.Tables[0],
                        users = ds1.Tables[0]
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

        public static string AssignedUser(string AppointmentID, string EmpiD)
        {
            string returnResult = "";
            csDataLayer DL = new csDataLayer();
            DataSet ds = new DataSet();
            string Query = "";
            string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);
            string EmpNo = HttpContext.Current.Request.Cookies["UserName"].Value.ToString();
            Query = "UPDATE Tbl_Appointment_Transactions Set Official_Assigned = '" + EmpiD + "',Updated_by = '" + EmpNo + "',Updated_date = getdate(),Appointment_Status='Assigned to User' Where ID = '" + AppointmentID + "' ";

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