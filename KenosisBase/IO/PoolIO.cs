using KenosisBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.MessageService
{
    public class PoolIO
    {
        public KenosisEntities container = new KenosisEntities();
        public IQueryable<Pool> CreateEntity(string name)
        {

            var pool = new Pool { Name = name };
            pool.Name = name;
            container.Pools.Add(pool);
            container.SaveChanges();


            var query = from b in container.Pools
                            //orderby 
                        select b;

            return query;
        }

        public IQueryable<Pool> LoadEntity(string userid)
        {

            var query = from b in container.Pools
                        where b.User.Id == userid
                        //orderby 
                        select b;
            return query;
        }
        public IQueryable<Pool> LoadEntity(string poolid, string userid)
        {

            var query = from b in container.Pools
                        where b.Id == poolid && b.User.Id == userid
                        //orderby 
                        select b;
            return query;
        }
        public IQueryable<Pool> LoadEntity()
        {

            var query = from b in container.Pools
                        select b;
            return query;
        }

        public void DeleteEntity(Pool pool)
        {

            container.Pools.Remove(pool);
            container.SaveChanges();
        }


        public void UpdateEntity(Pool pool)
        {

            var x = container.Pools.Where(u => u.Id == pool.Id).FirstOrDefault();
            x.Name = pool.Name;
            x.User = pool.User;
            container.SaveChanges();

        }

    }
}
