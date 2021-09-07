using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Logout(string EmpID)
        {
            string result = "logout";
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies["UserName"].Value = "";
            HttpContext.Current.Response.Cookies["UserName"].Expires = DateTime.Now;
            return result;
        }
    }
}