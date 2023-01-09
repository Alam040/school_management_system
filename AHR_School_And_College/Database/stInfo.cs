using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AHR_School_And_College.Database
{
    public class stInfo
    {
        private DataTable _stinfo;
        public stInfo() { 
        
        }
        public stInfo(string name)
        {

        }
        public stInfo(DataTable stinfo)
        {
            _stinfo = stinfo;
        }


    }
}