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

namespace Appointment_management_system_integration.Appointment
{
    public partial class home : System.Web.UI.Page
    {
        encdec security = new encdec();
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            string[] Url = path.Split('/');
            csCommon common = new csCommon();
            List<csDepartmentMaster> Dept = new List<csDepartmentMaster>();

            if (HttpContext.Current.Request.Url.Authority.Contains("localhost"))
            {
                if (Url.Count() == 7)
                {
                    string Department = security.convertHexToString(Url[3].ToString(), 102);
                    Dept = common.DepartmentDetailsByID(Department);

                    if (Dept.Count > 0 && Dept != null)
                    {
                        DepartmentName.InnerHtml = Dept[0].DepartmentName.ToString();
                        BookAppointmentTagline.InnerHtml = "Book Appointment for " + Dept[0].DepartmentName.ToString() + " :";
                        BookAppointmentTagline1.InnerHtml = "Book Appointment for " + Dept[0].DepartmentName.ToString() + " :";
                        Session["Dep_ID"] = Url[3].ToString();
                        Session["Based_ON"] = Url[5].ToString();
                        Session["Noti_CA_NO"] = Url[6].ToString();
                    }
                    else
                    {
                        if (Session["Dep_ID"] != null)
                        {
                            Response.Redirect("~/Appointment/home.aspx/" + Session["Dep_ID"] + "/Dept/" + Session["Based_ON"] + "/" + Session["Noti_CA_NO"], false);
                        }
                    }

                }
                else
                {
                    Response.Redirect("~/Appointment/bookappointment.aspx", false);
                }

            }
            else
            {
                if (Url.Count() == 8)
                {
                    string Department = security.convertHexToString(Url[4].ToString(), 102);
                    Dept = common.DepartmentDetailsByID(Department);

                    if (Dept.Count > 0 && Dept != null)
                    {
                        DepartmentName.InnerHtml = Dept[0].DepartmentName.ToString();
                        BookAppointmentTagline.InnerHtml = "Book Appointment for " + Dept[0].DepartmentName.ToString() + " :";
                        Session["Dep_ID"] = Url[4].ToString();
                        Session["Based_ON"] = Url[6].ToString();
                        Session["Noti_CA_NO"] = Url[7].ToString();
                    }
                    else
                    {
                        if (Session["Dep_ID"] != null)
                        {
                            Response.Redirect("~/Appointment/home.aspx/" + Session["Dep_ID"] + "/Dept/" + Session["Based_ON"] + "/" + Session["Noti_CA_NO"], false);
                        }
                    }

                }
                else
                {
                    Response.Redirect("~/Appointment/bookappointment.aspx", false);
                }

            }

        }

        [WebMethod]
        public static string GetDates()
        {
            encdec security = new encdec();

            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string DepartmentID = security.convertHexToString(Convert.ToString(HttpContext.Current.Session["Dep_ID"]), 102);

            string Query = " Select Top (Select No_of_days from Tbl_Department_Master Where ID ='" + DepartmentID + "'  and Active_flag = 'Y') Slot_Date From( Select Distinct  Slot_Date from Tbl_Department_Slot_Master Where Department_ID ='" + DepartmentID + "' and Active_flag = 'Y' and Cast(Slot_Date as Date) >= cast(GETDATE() as Date)  ) a ";

            ds = Dl.ShowDataInGridView(Query);
            string json = string.Empty;
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    data = ds.Tables[0]
                };
                var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                json = JsonConvert.SerializeObject(Result, settings);
            }
            return json;

        }

        [WebMethod]
        public static string GetSlotsData(string Date)
        {
            encdec security = new encdec();

            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string DepartmentID = security.convertHexToString(Convert.ToString(HttpContext.Current.Session["Dep_ID"]), 102);

            string Query = "Exec Proc_Get_Department_USer_Slots @Department_ID = '" + DepartmentID + "',@Date= '" + Date + "'";

            ds = Dl.ShowDataInGridView(Query);
            string json = string.Empty;
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    data = ds.Tables[0]
                };
                var settings = new JsonSerializerSettings { DateFormatString = "hh:mm tt" };
                json = JsonConvert.SerializeObject(Result, settings);
            }
            return json;

        }

        [WebMethod]

        public static string CheckPreviousAppointments(string DepartmentID, string BasedOn, string Noti_Ca_no)
        {
            encdec sec = new encdec();
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();
            string json = "";

            try
            {
                string Department_ID = sec.convertHexToString(DepartmentID, 102);
                string NotiCa_no = sec.convertHexToString(Noti_Ca_no, 102);


                string Query = "Exec Proc_CheckAppointmentStatus @DepartmentID = '" + Department_ID + "',@Noti_CA_No = '" + NotiCa_no + "',@BasedON = '" + BasedOn + "'";

                ds = Dl.ShowDataInGridView(Query);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    var Result = new
                    {
                        status = 200,
                        data = ds.Tables[0]
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }
                else
                {
                    var Result = new
                    {
                        status = 200,
                        data = "New Appointment"
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }

            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Check Previous Appointent Data :== Notification No ~ " + Noti_Ca_no + " ~ DepartmentID ID " + DepartmentID + " ~ -- Messgae --" + ex.Message);
            }

            return json;
        }

        [WebMethod]
        public static string CancelAppointment(string AppointmentID)
        {
            encdec sec = new encdec();
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();
            string json = "";

            try
            {
                string Appointment_ID = AppointmentID;

                string Query = "Update Tbl_Appointment_Transactions Set Appointment_Status = 'Cancel', Updated_by='User' Where ID =  '" + Appointment_ID + "'";

                string result = Dl.ExecuteQueries(Query);

                if (result == "success")
                {
                    var Result = new
                    {
                        status = 200,
                        data = "Success"
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }
                else
                {
                    var Result = new
                    {
                        status = 401,
                        data = "Failure"
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }

            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Reschedule Appointment :== Appointment ID~ " + AppointmentID + " --Messgae --" + ex.Message);
            }

            return json;


        }

        [WebMethod]
        public static string BookUserApppointment(string Emailid, string MobileNo, string DepartmentSlotID, string Reschedule, string process, string SlotDate, string SlotTime)
        {
            encdec sec = new encdec();
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();
            string json = "";

            try
            {

                string DepartmentID = sec.convertHexToString(Convert.ToString(HttpContext.Current.Session["Dep_ID"]), 102);
                string Basedon = Convert.ToString(HttpContext.Current.Session["Based_ON"]);
                string Noti_CA_NO = sec.convertHexToString(Convert.ToString(HttpContext.Current.Session["Noti_CA_NO"]), 102);
                string Email_ID = Emailid;
                string Mobile_No = MobileNo;
                string Department_Slot_ID = DepartmentSlotID;
                string Reschedule_Appointment = Reschedule;
                string AppointmentID = process;
                string NotificationNO = string.Empty;
                string CANO = string.Empty;

                if (Basedon == "NN")
                {
                    NotificationNO = Noti_CA_NO;
                }
                else
                {
                    CANO = Noti_CA_NO;
                }
                

                string Query = "Exec Proc_Book_User_Appointment @Department_ID = '" + DepartmentID + "',@Department_Slot_ID = '" + Department_Slot_ID + "',@Notification_No = '" + NotificationNO + "',@CA_No = '" + CANO + "',@Contract_No = '" + Mobile_No
                    + "',@Email_ID = '" + Email_ID + "',@Mob_No = '" + Mobile_No + "',@Appointment_Status = 'New',@Created_By = 'Customer',@Reschedule = '" + Reschedule_Appointment + "',@AppointmentID = '" + AppointmentID + "'";

                ds = Dl.ShowDataInGridView(Query);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    SmsService.Service1 sms = new SmsService.Service1();
                    string txtMsg = "Dear Customer, you have successfully registered for Virtual Hearing for Notification " + Noti_CA_NO + " on " + SlotDate + ", " + SlotTime.Split('-')[0].Trim() + ".Meeting link will be shared soon. TPDDL";
                    sms.sendsms(Mobile_No, txtMsg, "TPDDL");
                    var Result = new
                    {
                        status = 200,
                        data = ds.Tables[0]
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }
                else
                {
                    var Result = new
                    {
                        status = 401,
                        data = "Failure"
                    };
                    var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                    json = JsonConvert.SerializeObject(Result, settings);
                }

            }
            catch (Exception ex)
            {
                var Result = new
                {
                    status = 401,
                    data = "Failure"
                };
                var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                json = JsonConvert.SerializeObject(Result, settings);

                csLogs Log = new csLogs();
                Log.LogWrite("Book User Apppointment:== Email_ID~ " + Emailid + " --Messgae --" + ex.Message);
            }

            return json;
        }

    }
}