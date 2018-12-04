using KenosisBase.DTO;
using KenosisBase.Exceptions;
using KenosisBase.IO;
using KenosisBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.Service
{
    public class SignUpService
    {
        public UserIO userio = new UserIO();
        public SignUpService()
        {

        }

        public int Signup(SignUpModel sup)
        {
            if (userio.LoadEntity(u=>u.Username == sup.UserName).FirstOrDefault() != null)
            {
                return ErrorType.DeplicatedUser.GetHashCode();
            }
            var user = new User();
            user.Id = Guid.NewGuid().ToString();
            user.Name = sup.Name;
            user.Password = sup.Password;
            user.Username = sup.UserName;
            
            try
            {
                userio.CreateEntity(user);
                userio.container.SaveChanges();
                return ErrorType.Success.GetHashCode();
            }
            catch(Exception e)
            {
                return ErrorType.IOError.GetHashCode();
            }
           
            
        }


        public UserModel Login(LoginInModel lim)
        {
            var user = new User();

            try
            {
                user = userio.LoadEntity(u => u.Username == lim.UserName).FirstOrDefault();

            }
            catch (Exception e)
            {
                var de = new DataException();
                de.Info = ErrorType.IOError.GetHashCode().ToString();
                throw de;
            }
            if (user == null)
            {
                var de = new DataException();
                de.Info = ErrorType.UsernotExist.GetHashCode().ToString();
                throw de;
            }
            if (lim.Password == user.Password)
            {
                var um = new UserModel();
                um.Id = user.Id;
                um.Name = user.Name;
                um.UserName = user.Username;
                return um;
            }
            else
            {
                var de = new DataException();
                de.Info = ErrorType.WrongPassword.GetHashCode().ToString();
                throw de;
            }
            

        }
    }
}
