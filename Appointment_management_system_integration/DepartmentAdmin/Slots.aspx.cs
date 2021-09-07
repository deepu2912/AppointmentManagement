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
    public partial class Slots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetSlotsData()
        {
            csDataLayer Dl = new csDataLayer();
            DataSet ds = new DataSet();

            string DepartmentID = Convert.ToString(HttpContext.Current.Session["Department_ID"]);

            string Query = "Select * from [dbo].[Tbl_Slot_Master] Where Department_ID = '" + DepartmentID + "' and Active_flag = 'Y'";
            ds = Dl.ShowDataInGridView(Query);
            string json = string.Empty;
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    data = ds.Tables[0]
                };
                json = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            return json;
        }

        [WebMethod]
        public static string UpdateSlotData(string Slot_ID, string Department_ID, string StartTime, string EndTime, string MaxAppointments
            , string SlotStatus)
        {
            string returnResult = string.Empty;
            csDataLayer DL = new csDataLayer();

            string Query = "Update  Tbl_Slot_Master Set  Slot_start_time  = '" + StartTime + "', Slot_end_time = '" + EndTime + "', Max_Appointments= '" + MaxAppointments + "', Slot_status = '" + SlotStatus + "' , Updated_by = '" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "' Where Department_ID = '" + Department_ID + "' and ID = '" + Slot_ID + "'";
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