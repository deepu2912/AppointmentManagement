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

namespace Appointment_management_system_integration.Super_Admin
{
    public partial class Editdepartment : System.Web.UI.Page
    {
        encdec sec = new encdec();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["dep"] != "" && Request.QueryString["dep"] != null)
                {
                    Session["DepartmentID"] = null;
                    string departmentID = sec.convertHexToString(Convert.ToString(Request.QueryString["dep"]), 102);
                    DepartmentID.Value = departmentID;
                    Session["DepartmentID"] = departmentID;
                }
                else
                {
                    Response.Redirect("departments.aspx", false);
                }
            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Update Department :== " + ex.Message);
            }

        }


        [WebMethod]
        public static string FetchDepartmentDetails(string DepartmentID)
        {
            DataSet ds = new DataSet();
            csDataLayer DL = new csDataLayer();

            DepartmentID = HttpContext.Current.Session["DepartmentID"].ToString();
            string query = "Exec [Proc_Get_Department_Details] " + DepartmentID + "";
            ds = DL.ShowDataInGridView(query);

            string returnResult = "";

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                var Result = new
                {
                    status = 200,
                    departmentData = ds.Tables[0],
                    adminData = ds.Tables[1]
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }
            else
            {
                var Result = new
                {
                    status = 401,
                    departmentData = "",
                    adminData = ""
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);
            }

            return returnResult;
        }

        [WebMethod]
        public static string UpdateDepartment(string DepartmentName, string OfficialCount, string SlotDuration,
            string SlotStartTime, string SlotEndTime, string NextVisibleDays, string NewEmpID,
            string OldEmpID, string Department_ID, string BasedOn)
        {
            string returnResult = "";
            try
            {
                csDataLayer DL = new csDataLayer();
                DataTable dt = new DataTable { TableName = "EMPRECORDS" };

                DataSet ds = new DataSet();

                dt.Clear();
                dt.Columns.Add("EmpID");

                if (NewEmpID != "")
                {
                    NewEmpID = NewEmpID.Substring(1);
                    string[] Empid = NewEmpID.Split(','); 
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
                        {
                            DataTable _dt = new DataTable { TableName = "EMPRECORDS" };
                            _dt.Clear();
                            _dt.Columns.Add("EmpID");

                            string _EmployeeID = NewEmpID + OldEmpID;
                            string[] _Empid = _EmployeeID.Split(',');

                            for (int i = 0; i < _Empid.Length; i++)
                            {
                                if (_Empid[i] != "")
                                {
                                    DataRow _Emp_id = _dt.NewRow();
                                    _Emp_id["EmpID"] = Convert.ToString(_Empid[i]);
                                    _dt.Rows.Add(_Emp_id);
                                }

                            }

                            string _result;
                            using (StringWriter sw = new StringWriter())
                            {
                                _dt.WriteXml(sw);
                                _result = sw.ToString();
                            }

                            Query = "Exec Proc_Update_Department @Department_Name='" + DepartmentName + "',@No_of_officials='" + OfficialCount + "',@Slot_duration='" + SlotDuration + "',@Slot_start_time='" + SlotStartTime + "',@Slot_end_time='" + SlotEndTime + "',@No_of_days='" + NextVisibleDays + "',@EMPDATA='" + _result + "',@BasedOn='" + BasedOn + "',@Department_ID='" + Department_ID + "'";

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
                }
                else
                {
                    {
                        DataTable _dt = new DataTable { TableName = "EMPRECORDS" };
                        _dt.Clear();
                        _dt.Columns.Add("EmpID");

                        string _EmployeeID = NewEmpID + OldEmpID;
                        string[] _Empid = _EmployeeID.Split(',');

                        for (int i = 0; i < _Empid.Length; i++)
                        {
                            if (_Empid[i] != "")
                            {
                                DataRow _Emp_id = _dt.NewRow();
                                _Emp_id["EmpID"] = Convert.ToString(_Empid[i]);
                                _dt.Rows.Add(_Emp_id);
                            }

                        }

                        string _result;
                        using (StringWriter sw = new StringWriter())
                        {
                            _dt.WriteXml(sw);
                            _result = sw.ToString();
                        }

                        string Query = "";
                        Query = "Exec Proc_Update_Department @Department_Name='" + DepartmentName + "',@No_of_officials='" + OfficialCount + "',@Slot_duration='" + SlotDuration + "',@Slot_start_time='" + SlotStartTime + "',@Slot_end_time='" + SlotEndTime + "',@No_of_days='" + NextVisibleDays + "',@EMPDATA='" + _result + "',@BasedOn='" + BasedOn + "',@Department_ID='" + Department_ID + "'";

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


               
            }
            catch (Exception ex)
            {
                var Result = new
                {
                    status = 401,
                    data = "Failed"
                };

                returnResult = JsonConvert.SerializeObject(Result, Formatting.Indented);

                csLogs Log = new csLogs();
                Log.LogWrite("Add Department :== " + ex.Message);
            }
            return returnResult;
        }

    }
}