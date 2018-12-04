using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.DTO
{

    public class UserModel
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
    }
    public class SignUpModel:UserModel
    {
        public string RoleId { get; set; }
        public string Password { get; set; }
    }

    public class LoginInModel : UserModel
    {
        public string Password { get; set; }
    }
}
