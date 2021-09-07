using shorturl.Modals;
using shorturl.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using System.Web.Script.Serialization;

namespace shorturl.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class HomeController : ApiController
    {
        [Route("api/uri/{Code}")]
        [HttpGet]
        public IHttpActionResult RedirectShortUrl(string Code)
        {
            var Result = new
            {
                status = 100,
                data = "Failed"
            };

            string url = "https://www.tatapower-ddl.com";
            conn con = new conn();
            DataSet ds = new DataSet();
            if (Code != "")
            {
                string Query = "Select * from Tbl_Short_Url Where UrlCode = '" + Code + "' and Active_flag = 'Y'";
                ds = con.ShowDataInGridView(Query);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToString(ds.Tables[0].Rows[0]["Url"]).Contains("https"))
                    {
                        url = Convert.ToString(ds.Tables[0].Rows[0]["Url"]);
                    }
                    else
                    {
                        url = "https://" + Convert.ToString(ds.Tables[0].Rows[0]["Url"]);
                    }
                }
                //url = "https://www.tatapower-ddl.com" ;
            }

            System.Uri uri = new System.Uri(url);
            return Redirect(uri);
        }


        [Route("api/shorturl")]
        [HttpPost]
        public HttpResponseMessage GetShortUrl(Url url)
        {
            try
            {

                var Result = new
                {
                    data = "error please try again"
                };

                endec sec = new endec();

                string Decrypted_Url = sec.convertHexToString(url.myURL, 102);

                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];
                var random = new Random();

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);

                conn con = new conn();

                string scheme = HttpContext.Current.Request.Url.Host;

                string RevertUrl = "";

                if (scheme == "localhost")
                {
                    RevertUrl = "https://localhost:44333/api/uri/";
                }
                else
                {
                    RevertUrl = "https://webtest.tpdelhi.com/meeting/api/uri/";
                }

                string Query = "Insert into Tbl_Short_Url (UrlCode,Url) Values ('" + finalString + "','" + Decrypted_Url + "')";
                string result = con.ExecuteQueries(Query);

                if (result == "success")
                {
                    Result = new
                    {
                        data = RevertUrl + finalString
                    };
                }
                else
                {
                    Result = new
                    {
                        data = "error please try again"
                    };
                }

                var response = new HttpResponseMessage()
                {
                    Content = new StringContent(new JavaScriptSerializer().Serialize(Result), Encoding.UTF8, "application/json")
                };

                return response;
            }
            catch (Exception ex)
            {
                csLogs Log = new csLogs();
                Log.LogWrite("Short Url :== " + ex.Message);

                var Result = new
                    {
                        data = "error please try again"
                    };

                var response = new HttpResponseMessage()
              {
                  Content = new StringContent(new JavaScriptSerializer().Serialize(Result), Encoding.UTF8, "application/json")
              };

                return response;
            }
        }


        public class Url
        {
            public string myURL { get; set; }
        }

    }
}
