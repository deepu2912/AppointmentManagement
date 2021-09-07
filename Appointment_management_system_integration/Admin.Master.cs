using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Appointment_management_system_integration.Modals;

namespace Appointment_management_system_integration
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Request.Cookies["UserName"] != null)
                {
                    string EmpNo = Request.Cookies["UserName"].Value.ToString();
                    List<csEmployee> emp = new List<csEmployee>();
                    List<csPageMaster> pages = new List<csPageMaster>();
                    csCommon common = new csCommon();
                    emp = common.EmployeeData(EmpNo);

                    ///Check emp is exists or not and if 
                    ///exists then fetch all details of a users.

                    if (emp.Count > 0 && emp != null)
                    {
                        departmentName.InnerText = emp[0].Department_Name == "" ? "Admin" : emp[0].Department_Name;
                        userName.InnerText = emp[0].EmpName;
                        Session["Department_ID"] = emp[0].Department_ID; //Used for Admin Pages Only
                        pages = common.PagesData(emp[0].Role, emp[0].Department_ID);
                        string navigation_Data = string.Empty;

                        if (pages != null && pages.Count > 0)
                        {
                            pages.ForEach(page =>
                            {
                                string url = string.Empty;
                                if (HttpContext.Current.Request.Url.Authority.Contains("localhost"))
                                {
                                    url = "https://" + HttpContext.Current.Request.Url.Authority + page.PagePath;
                                }
                                else
                                {
                                    url = "https://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath + page.PagePath;
                                }

                                navigation_Data = navigation_Data + " <li class=\"nav-item\"> <a href=\"" + url + "\" class=\"nav-link\"> <i class=\"nav-icon " + page.PageIcon + "\"></i>  <p> " + page.PageName + " </p>  </a>  </li>";
                            });
                            NavigationData.InnerHtml = "";
                            NavigationData.InnerHtml = navigation_Data;
                        }
                        else
                        {
                            NavigationData.InnerHtml = "";
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                        Response.Cache.SetNoStore();
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    }

                }
                else
                {
                    Response.Write("<script>alert('You are out of Session. Please log in');</script>");
                    Response.Redirect("~/Login.aspx", false);
                    Response.Cache.SetNoStore();
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                }


            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("AdminMaster :== " + ex.Message);
            }
        }



    }
}