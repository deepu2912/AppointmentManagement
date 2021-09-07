using Appointment_management_system_integration.Modals;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

namespace Appointment_management_system_integration.Super_Admin
{
    public partial class AddDepartment : System.Web.UI.Page
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
        public static string CreateDepartment(string DepartmentName, string OfficialCount, string SlotDuration,
            string SlotStartTime, string SlotEndTime, string NextVisibleDays, string EmpID, string BasedOn)
        {
            string returnResult = "";
            try
            {
                csDataLayer DL = new csDataLayer();
                DataTable dt = new DataTable { TableName = "EMPRECORDS" };

                DataSet ds = new DataSet();

                dt.Clear();
                dt.Columns.Add("EmpID");

                EmpID = EmpID.Substring(1);
                string[] Empid = EmpID.Split(',');

                for (int i = 0; i < Empid.Length; i++)
                {
                    DataRow _Emp_id = dt.NewRow();
                    _Emp_id["EmpID"] = Empid[i];
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
                    Query = "Exec Proc_Create_Department @Department_Name='" + DepartmentName + "',@No_of_officials='" + OfficialCount + "',@Slot_duration='" + SlotDuration + "',@Slot_start_time='" + SlotStartTime + "',@Slot_end_time='" + SlotEndTime + "',@No_of_days='" + NextVisibleDays + "',@EMPDATA='" + result + "',@BasedOn='" + BasedOn + "',@CreatedBy='" + HttpContext.Current.Request.Cookies["UserName"].Value.ToString() + "'";

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