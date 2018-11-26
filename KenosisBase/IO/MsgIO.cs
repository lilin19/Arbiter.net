using KenosisBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.IO
{
    class MsgIO
    {

        public IQueryable<Pool> CreateEntity(string text, string usrid, string poolid)
        {
            var container = new KenosisEntities();

            var msg = new Msg { Text = text };

            //pool.Name = name;
            //container.Pools.Add(pool);
            //container.SaveChanges();


            var query = from b in container.Pools
                            //orderby 
                        select b;

            return query;
        }

        public IQueryable<Pool> LoadEntity(string userid)
        {
            var container = new KenosisEntities();
            var query = from b in container.Pools
                        where b.User.Id == userid
                        //orderby 
                        select b;
            return query;
        }

        public void DeleteEntity(Pool pool)
        {
            var container = new KenosisEntities();
            container.Pools.Remove(pool);
            container.SaveChanges();
        }


        public void UpdateEntity(Pool pool)
        {
            var container = new KenosisEntities();

            var x = container.Pools.Where(u => u.Id == pool.Id).FirstOrDefault();
            x.Name = pool.Name;
            x.User = pool.User;
            container.SaveChanges();
        }
    }
}
