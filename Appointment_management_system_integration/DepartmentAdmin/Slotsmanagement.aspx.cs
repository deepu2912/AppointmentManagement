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
    public partial class Slotsmanagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string GetDateSlots()
        {
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);

            string Query = "Select Distinct Slot_Date from [Tbl_Department_Slot_Master] Where Department_ID  = '" + DepartmentID + "' and                  Active_flag ='Y' and Cast(Slot_Date as Date) >= cast(GETDATE() as Date)";
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
        public static string CreatedSlotsWrtToDate(string dates)
        {
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();
            string returnResult = string.Empty;
            DataTable dt = new DataTable { TableName = "Dates" };
            dt.Clear();
            dt.Columns.Add("Sno");
            dt.Columns.Add("Date");


            string[] Selected_Dates = dates.Split(',');
            string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);

            for (int i = 0; i < Selected_Dates.Length; i++)
            {
                DataRow DatesData = dt.NewRow();
                DatesData["Sno"] = i + 1;
                DatesData["Date"] = Selected_Dates[i];
                dt.Rows.Add(DatesData);
                //string Date = Selected_Dates[i];

            }

            string result;
            using (StringWriter sw = new StringWriter())
            {
                dt.WriteXml(sw);
                result = sw.ToString();
            }

            string Query = "Exec Proc_Create_DateWise_Slots @date = '" + result + "',@Department_ID='" + DepartmentID + "'";

            ds = Dl.ShowDataInGridView(Query);

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

            return returnResult;
        }

        [WebMethod]
        public static string GetslotsForDay(string date)
        {
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);

            string Query = "Select DSM.ID,DSM.Department_ID,Cast(DSM.Slot_Date as date) As Slot_Date, DSM.Slot_start_time, DSM.Slot_end_time,DSM.Status,DSM.Max_Appointments from [dbo].[Tbl_Department_Slot_Master] DSM INNER JOIN [dbo].[Tbl_Slot_Master] SM on SM.ID = DSM.Slot_ID Where Cast(Slot_Date as date) = cast('" + date + "' as date)  and SM.Department_ID = '" + DepartmentID + "' And DSM.Active_flag = 'Y'";

            string returnResult = string.Empty;

            ds = new DataSet();
            ds = Dl.ShowDataInGridView(Query);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    data = ds.Tables[0]
                };
                var settings = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
                returnResult = JsonConvert.SerializeObject(Result, settings);
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

            return returnResult;
        }

        [WebMethod]

        public static string UpdateSlotDataDatewise(string Slot_ID, string Department_ID, string StartTime, string EndTime, string MaxAppointments, string SlotStatus)
        {
            string returnResult = string.Empty;
            csDataLayer DL = new csDataLayer();

            string Query = "Update  Tbl_Department_Slot_Master Set  Slot_start_time  = '" + StartTime + "', Slot_end_time = '" + EndTime + "', Max_Appointments= '" + MaxAppointments + "', Status = '" + SlotStatus + "' , Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "' Where Department_ID = '" + Department_ID + "' and ID = '" + Slot_ID + "'";
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