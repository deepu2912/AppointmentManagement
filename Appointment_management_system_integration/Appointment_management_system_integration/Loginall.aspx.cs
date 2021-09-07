using Appointment_management_system_integration.Modals;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Appointment_management_system_integration
{
    public partial class Loginall : System.Web.UI.Page
    {
        weblist.list wsdl = new weblist.list();
        ArrayList paramname = new ArrayList(), paramvalue = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                string Username = Page.Request.Form["txtUserid"];
               
                if (Username == "")
                {
                    lblMsg.InnerHtml = "Please enter Username.";
                    return;
                }
            
                    Session["sso"] = Page.Request.Form["txtUserid"];
                    Session["user"] = Session["sso"];

                    if (Convert.ToString(Session["sso"]) == "")
                    {
                        Session["empno"] = "93918";
                        Session["user_name"] = "Deepanshu Ahuja";
                        Session["UserName"] = Session["user_name"];
                        HttpCookie aCookie = new HttpCookie("UserName");
                        aCookie.Value = Session["user_name"] + "~" + Session["empno"];
                        aCookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(aCookie);
                    }
                    else
                    {
                        HttpCookie aCookie = new HttpCookie("UserName");

                        csDataLayer DL = new csDataLayer();
                        string EmpNo = wsdl.getEmpidNameDeptDesg(Session["user"].ToString()).ToString().Split('#')[0];
                        List<csEmployee> emp = new List<csEmployee>();
                        csCommon common = new csCommon();
                        emp = common.EmployeeData(EmpNo);
                        if (emp.Count > 0 && emp != null)
                        {
                            Session["empno"] = EmpNo;
                            aCookie.Value = EmpNo;
                            aCookie.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(aCookie);
                        }
                        else
                        {
                            lblMsg.InnerHtml = "You are not authorized to login.";
                        }


                    }
                    Response.Redirect("~/Home.aspx", false);
               
            }
            catch (Exception ex)
            {
            }
        }
    }
}