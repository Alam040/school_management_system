using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AHR_School_And_College.Method
{
    public class personalId
    {
        public void setId(int id)
        {
            name = id;
        }
        private int name;
        public int ID
        {
            get
            {
                return this.name;
            }
            set
            {
                this.name = value;
            }
        }
    }
}