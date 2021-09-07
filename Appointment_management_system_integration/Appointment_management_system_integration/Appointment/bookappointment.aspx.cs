using Appointment_management_system_integration.Modals;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration.Appointment
{
    public partial class bookappointment : System.Web.UI.Page
    {
        public static List<csDepartmentMaster> DeptData = new List<csDepartmentMaster>(){
             new csDepartmentMaster(){DepartmentName="CMG",NotificationType="NC/CFIN"},
             new csDepartmentMaster(){DepartmentName="EAC",NotificationType="23/HERP"}
         };


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GetDepartmentData()
        {
            encdec security = new encdec();
            List<csDepartmentMaster> DepartmentList = new List<csDepartmentMaster>();
            csCommon common = new csCommon();

            DepartmentList = common.DepartmentData();

            string json = string.Empty;

            if (DepartmentList != null && DepartmentList.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    data = DepartmentList
                };
                json = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            return json;
        }


        [WebMethod]
        public static string ProceedAppointment(string DepartmentID, string BasedOn, string Noti_Ca_no, string DepartmentName)
        {
            encdec sec = new encdec();

            var Result = new
            {
                status = 401,
                result = "Incorrect",
                DeptID = "0",
                Notification = "0",
                BasedOn = "",
                Url = ""
            };

            string url = string.Empty;
            if (HttpContext.Current.Request.Url.Authority.Contains("localhost"))
            {
                url = "https://" + HttpContext.Current.Request.Url.Authority + "/appointment/home.aspx";
            }
            else
            {
                url = "https://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath + "/appointment/home.aspx";
            }

            if (BasedOn == "Contract Account Number")
            {
                string CanoStatus = CheckCANumberStatus(Noti_Ca_no);

                if (CanoStatus == "Valid")
                {
                    Result = new
                    {
                        status = 200,
                        result = "Valid",
                        DeptID = sec.convertStringToHex(DepartmentID, 102),
                        Notification = sec.convertStringToHex(Noti_Ca_no, 102),
                        BasedOn = "CN",
                        Url = url + "/" + sec.convertStringToHex(DepartmentID, 102) + "/Dept/CN/" + sec.convertStringToHex(Noti_Ca_no, 102)
                    };
                }

            }
            else if (BasedOn == "Notification Number")
            {
                var resultData = DeptData.Find(x => x.DepartmentName == DepartmentName);

                string NotificationStatus = CheckNotificationStatus(Noti_Ca_no);

                if (String.IsNullOrEmpty(NotificationStatus))
                {

                }
                else
                {
                    if (resultData.NotificationType.Contains(NotificationStatus))
                    {
                        Result = new
                        {
                            status = 200,
                            result = "Valid",
                            DeptID = sec.convertStringToHex(DepartmentID, 102),
                            Notification = sec.convertStringToHex(Noti_Ca_no, 102),
                            BasedOn = "NN",
                            Url = url + "/" + sec.convertStringToHex(DepartmentID, 102) + "/Dept/NN/" + sec.convertStringToHex(Noti_Ca_no, 102)
                        };
                    }
                }
            }
            else if (BasedOn == "Notification Number / Contract Account Number")
            {
                string Number = Noti_Ca_no.TrimStart(new Char[] { '0' });

                if (Number[0].ToString() == "6")
                {
                    string CanoStatus = CheckCANumberStatus(Noti_Ca_no);

                    if (CanoStatus == "Valid")
                    {
                        Result = new
                        {
                            status = 200,
                            result = "Valid",
                            DeptID = sec.convertStringToHex(DepartmentID, 102),
                            Notification = sec.convertStringToHex(Noti_Ca_no, 102),
                            BasedOn = "CN",
                            Url = url + "/" + sec.convertStringToHex(DepartmentID, 102) + "/Dept/CN/" + sec.convertStringToHex(Noti_Ca_no, 102)
                        };
                    }
                }
                else
                {

                    string NotificationStatus = CheckNotificationStatus(Noti_Ca_no);

                    if (String.IsNullOrEmpty(NotificationStatus))
                    {

                    }
                    else
                    {

                        Result = new
                        {
                            status = 200,
                            result = "Valid",
                            DeptID = sec.convertStringToHex(DepartmentID, 102),
                            Notification = sec.convertStringToHex(Noti_Ca_no, 102),
                            BasedOn = "NN",
                            Url = url + "/" + sec.convertStringToHex(DepartmentID, 102) + "/Dept/NN/" + sec.convertStringToHex(Noti_Ca_no, 102)
                        };

                    }
                }
            }

            string JsonResult = JsonConvert.SerializeObject(Result, Formatting.Indented);

            return JsonResult;
        }

        public static string CheckNotificationStatus(string NotificationNumber)
        {
            string status = "";

            try
            {
                notificationstatus.RequestTracking_Website_OutService webcons = new notificationstatus.RequestTracking_Website_OutService();
                webcons.Credentials = new System.Net.NetworkCredential("piweb", "delhi@123");

                notificationstatus.RequestTrackingReq notrequest = new notificationstatus.RequestTrackingReq();
                notificationstatus.RequestTrackingRes notresult = new notificationstatus.RequestTrackingRes();

                notrequest.NotificationNo = NotificationNumber;
                notresult = webcons.RequestTracking_Website_Out(notrequest);

                status = Convert.ToString(notresult.Status);
            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Check Notification Status :== Notification No ~ " + NotificationNumber + " -- Messgae --" + ex.Message);
            }


            return status;
        }

        public static string CheckCANumberStatus(string CA_NO)
        {
            string status = "";

            try
            {
                canostatus.OutstandingBill_Website_OutService webcons = new canostatus.OutstandingBill_Website_OutService();
                webcons.Credentials = new System.Net.NetworkCredential("piweb", "delhi@123");

                canostatus.OutstandingBillRequest notrequest = new canostatus.OutstandingBillRequest();
                canostatus.OutstandingBillResponse notresult = new canostatus.OutstandingBillResponse();

                notrequest.VKONT = CA_NO;
                notresult = webcons.OutstandingBill_Website_Out(notrequest);

                if (notresult.ContractAccount == "Invalid Input" || notresult.ContractAccount == "Invalid Contract Account" || notresult.ContractAccount == "Invalid Request Number" || notresult.ContractAccount == "No Payment Doc available for Print" || notresult.ContractAccount == "No Open Item Found for Demand Note" || notresult.ContractAccount == "Invalid Payment Document Number" || notresult.ContractAccount == "Invalid Installment Document Number" || notresult.ContractAccount == "No Open Item Found for Installment" || notresult.ContractAccount == "System Error")
                {
                    status = "Invalid";
                }
                else
                {
                    status = "Valid";
                }


            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Check CA Number Status :== CA No ~ " + CA_NO + " -- Messgae --" + ex.Message);
            }


            return status;
        }
    }
}