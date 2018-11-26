using KenosisBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.IO
{
    class UserIO
    {
        public KenosisEntities container = new KenosisEntities();
        public IQueryable<User> CreateEntity(string name, string id)
        {

            var user = new User { Name = name, Id = id };

            container.Users.Add(user);
            container.SaveChanges();


            var query = from b in container.Users
                            //orderby 
                        select b;

            return query;
        }

        public IQueryable<User> LoadEntity(string userid)
        {

            var query = from b in container.Users
                        where b.Id == userid
                        //orderby 
                        select b;
            return query;
        }

        public IQueryable<User> LoadEntity()
        {
            var query = from b in container.Users
                            //orderby 
                        select b;
            return query;
        }

        public void DeleteEntity(User usr)
        {

            container.Users.Remove(usr);
            container.SaveChanges();
        }


        public void UpdateEntity(User usr)
        {

            var x = container.Users.Where(u => u.Id == usr.Id).FirstOrDefault();
            x.Name = usr.Name;
            container.SaveChanges();
        }
    }
}
