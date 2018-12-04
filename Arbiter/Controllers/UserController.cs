using Arbiter.Models;
using KenosisBase.DTO;
using KenosisBase.Exceptions;
using KenosisBase.Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace Arbiter.Controllers
{
    public class UserController : ApiController
    {
        public string Signup(SignUpModel sum)
        {
            var cookie = ActionContext.Request.Headers.GetCookies("Bar").FirstOrDefault();

            var sps = new SignUpService();
            var result = sps.Signup(sum);
            if (result == 1)
            {
                return "success";
            }
            else
            {
                   return result.ToString();
            }
        }

        public HttpResponseMessage Login(LoginInModel lim)
        {
            StringContent stringContent;
            ProjectResponse response = new ProjectResponse();
            var result = new UserModel();
            var sps = new SignUpService();
            try
            {
                result = sps.Login(lim);
            }
            catch(DataException de)
            {

                response.internalcode = de.Info;
                if (de.Info == "21")
                {
                    response.status = "IOerror";
                     stringContent = new StringContent(JsonConvert.SerializeObject(response), Encoding.UTF8, "application/json");
                }else if(de.Info == "3"){
                    response.status = "Passworderror";
                    stringContent = new StringContent(JsonConvert.SerializeObject(response), Encoding.UTF8, "application/json");
                }else if(de.Info == "2")
                {
                    response.status = "UserNotexist";
                    stringContent = new StringContent(JsonConvert.SerializeObject(response), Encoding.UTF8, "application/json");
                }
                else
                {
                    response.status = "Unknownerror";
                    stringContent = new StringContent(JsonConvert.SerializeObject(response), Encoding.UTF8, "application/json");
                }
                HttpResponseMessage hrm = new HttpResponseMessage();
                hrm.Content = stringContent;
                return hrm;
            }

            var resp = new HttpResponseMessage();

            var nv = new NameValueCollection();
            nv["user"] = result.Name;
            nv["username"] = result.UserName;
            nv["id"] = result.Id;
            var cookie = new CookieHeaderValue("session", nv);
            response.internalcode = "1";
            response.status = "success";
            resp.Content = new StringContent(JsonConvert.SerializeObject(response), Encoding.UTF8, "application/json");
            resp.Headers.AddCookies(new CookieHeaderValue[] { cookie });



            return resp;


        }

        public string TestRead()
        {
            string sessionId = "";
            string sessionToken = "";
            string theme = "";

            CookieHeaderValue cookie = Request.Headers.GetCookies("session").FirstOrDefault();
            if (cookie != null)
            {
                CookieState cookieState = cookie["session"];

                sessionId = cookieState["user"];
                sessionToken = cookieState["username"];
                theme = cookieState["id"];
            }
            return sessionId+sessionToken+theme;
        }

        public HttpResponseMessage TestWrite(string x)
        {


            var resp = new HttpResponseMessage();

            var nv = new NameValueCollection();
            nv["text"] = x;
            nv["token"] = "abcdef";
            nv["theme"] = "dark blue";
            var cookie = new CookieHeaderValue("session", nv);

            resp.Headers.AddCookies(new CookieHeaderValue[] { cookie });

         

            return resp;

        }
    }
}
