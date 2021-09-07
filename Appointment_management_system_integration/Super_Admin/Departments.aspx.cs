using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Appointment_management_system_integration.Modals;

namespace Appointment_management_system_integration.Super_Admin
{
    public partial class Departments : System.Web.UI.Page
    {
        encdec sec = new encdec();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<csDepartmentMaster> DepartmentList = new List<csDepartmentMaster>();
            csCommon common = new csCommon();

            DepartmentList = common.DepartmentData();

            string tableData = string.Empty;

            if (DepartmentList.Count > 0 && DepartmentList != null)
            {
                int count = 1;
                DepartmentList.ForEach(dep =>
                {
                    tableData = tableData + "  <tr> <td>" + count + "</td> <td>" + dep.DepartmentName + "</td> <td>" + dep.No_of_officials + "</td>  <td>" + dep.Slot_duration + "</td>  <td>" + dep.Slot_start_time + "</td>   <td>" + dep.Slot_end_time + "</td>  <td>" + dep.No_of_days + "</td>  <td>   <i class=\"fa fa-edit clickable_events editDepartment\" depid=" + sec.convertStringToHex(dep.DepartmentID,102) + " ></i></td></tr>";
                    count++;
                });
                DepartmentData.InnerHtml = "";
                DepartmentData.InnerHtml = tableData;
            }

        }
    }
}