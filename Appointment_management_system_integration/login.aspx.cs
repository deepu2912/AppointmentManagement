using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using Appointment_management_system_integration.Modals;
using System.Web.UI.WebControls;



namespace Appointment_management_system_integration
{
    public partial class login : System.Web.UI.Page
    {
        weblist.list wsdl = new weblist.list();
        ArrayList paramname = new ArrayList(), paramvalue = new ArrayList();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack == false)
                {
                    if (Request.Cookies["UserName"] != null)
                    {

                        string EmpNo = Request.Cookies["UserName"].Value.ToString();
                        csDataLayer DL = new csDataLayer();
                        DataSet ds = new DataSet();
                        List<csEmployee> emp = new List<csEmployee>();
                        csCommon common = new csCommon();

                        emp = common.EmployeeData(EmpNo);

                        if (emp.Count > 0 && emp != null)
                        {
                            Session["empno"] = EmpNo;
                            Response.Redirect("~/Home.aspx", false);
                            Response.Cache.SetNoStore();
                            Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        }
                        else
                        {
                            lblMsg.InnerHtml = "You are not authorized to login.";
                        }
                 
                        Img.ToolTip = "Image Verification Code";
                        Img.ImageUrl = "~/Img.aspx";
                    }
                    else
                    {
                        Response.Cache.SetNoStore();
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Img.ToolTip = "Image Verification Code";
                        Img.ImageUrl = "~/Img.aspx";
                    }
                }
                else
                {
                    Response.Cache.SetNoStore();
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Img.ToolTip = "Image Verification Code";
                    Img.ImageUrl = "~/Img.aspx";
                }

                btnSubmit.Click += btnSubmit_Click;
            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite(ex.Message);
                //AppDataMain log = new AppDataMain();
                //log.WriteLog(ex.Message.ToString());
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                string Username = Page.Request.Form["txtUserid"];
                string Password = Page.Request.Form["password"];

                if (Username == "")
                {
                    lblMsg.InnerHtml = "Please enter Username.";
                    return;
                }
                else if (Password == "")
                {
                    lblMsg.InnerHtml = "Please enter Password.";
                    return;
                }

                if (wsdl.GetAuthenticationfromActiveDirectory(Page.Request.Form["txtUserid"], Password) == true)
                {
                    if (string.Compare(Session["VerificationString"].ToString(), TxtImgVer.Value.Trim()) != 0)
                    {
                        lblMsg.InnerHtml = "Sorry!! you have entered wrong image verification code...";

                        this.Img.ImageUrl = "~/Img.aspx";
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
                        aCookie.Value = Session["empno"].ToString() ;
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
                else
                    lblMsg.InnerHtml = "Username or password is incorrect.";
            }
            catch (Exception ex)
            {
            }
        }
         
    }
}