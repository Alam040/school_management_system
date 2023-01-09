using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College
{
    public partial class AdminPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void admin_logout_Click(object sender, EventArgs e)
        {
            Response.RedirectToRoute("login-admin");
        }
    }
}