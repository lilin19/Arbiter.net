using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Arbiter.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult Test()
        {
            ViewBag.Title = "Test";

            return View();
        }


        public ActionResult UserAdmin()
        {
            ViewBag.Title = "Users";

            return View();
        }
    }
}
