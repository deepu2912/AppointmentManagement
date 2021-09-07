using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Appointment_management_system_integration.Modals
{
    public class csDepartmentMaster
    {
        public string DepartmentID { get; set; }
        public string No_of_officials { get; set; }
        public string DepartmentName { get; set; }
        public string Slot_duration { get; set; }
        public string Slot_start_time { get; set; }
        public string Slot_end_time { get; set; }
        public string No_of_days { get; set; } 
        public string Based_On { get; set; }

        public string NotificationType { get; set; }
    }
}
