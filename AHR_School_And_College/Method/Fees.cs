using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AHR_School_And_College.Method
{
    public class Fees
    {
        public static int GetAdmissionFees(string val)
        {
            if (val.Equals("6")) return 1500;
            else if (val.Equals("7")) return 1500;
            else if (val.Equals("8")) return 1600;
            else if (val.Equals("9")) return 1800;
            else if (val.Equals("10")) return 1800;
            else if (val.Equals("11")) return 2000;
            else if (val.Equals("12")) return 2000;
            else return 0;
        }
    }
}