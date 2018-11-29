using KenosisBase.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.IO
{
    public class MsgIO:BaseIO<Msg>
    {
        public MsgIO()
        {
            container = new KenosisEntities();
        }

    }
    public class PoolIO : BaseIO<Pool>
    {
        public PoolIO()
        {
            container = new KenosisEntities();
        }

    }
    public class UserIO : BaseIO<User>
    {
        public UserIO()
        {
            container = new KenosisEntities();
        }

    }
}
