using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KenosisBase.DTO
{
    enum ErrorType
    {
        IOError = 21,
        WrongPassword = 3,
        DeplicatedUser = 4,
        UsernotExist = 2,
        Success = 1,
    }
}
