using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using KenosisBase;
using KenosisBase.IO;
using KenosisBase.Model;

namespace Arbiter.Controllers
{
    public class InterfaceController : ApiController
    {
        // GET api/values
        public List<User> GetUser()
        {
            UserIO userio = new UserIO();
            return userio.LoadEntity().ToList();
        }

        // GET api/values/5
        public string CreatePool(int id)
        {

            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
