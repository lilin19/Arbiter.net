using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.IO
{
    public abstract class BaseIO<T> where T : class, new()
    {

        public DbContext container;

        public bool CreateEntity(T entity)
        {
            container.Set<T>().Add(entity);
            return true;
        }

        public IQueryable<T> LoadEntity(Expression<Func<T, bool>> lambda)
        {
            if (lambda == null)
            {
                return container.Set<T>();
            }
            return container.Set<T>().Where(lambda);
        }

        public IQueryable<T> LoadEntity()
        {
            return container.Set<T>();
        }

        public void DeleteEntity(T entity)
        {
            container.Entry<T>(entity).State = EntityState.Deleted;
        }


        public bool UpdateEntity(T entity)
        {
            if (container.Entry<T>(entity).State != EntityState.Unchanged)
            {
                container.Entry<T>(entity).State = EntityState.Modified;
                return true;
            }
            else
                return false;
        }

    }
}
