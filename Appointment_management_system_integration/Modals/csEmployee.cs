using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Appointment_management_system_integration.Modals
{
    public class csEmployee
    {
        public string EmpID { get; set; }
        public string EmpName { get; set; }
        public string EmpMobile { get; set; }
        public string EmpEmail { get; set; }
        public string Role { get; set; }
        public string Department_ID { get; set; } 
        public string Department_Name { get; set; } 
        public string UserRowID { get; set; } 
        public string Visible { get; set; } 
        public string MeetingUrl { get; set; } 
        public string Original_MeetingUrl { get; set; }
    }
}