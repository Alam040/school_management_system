using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int yr = 2022;
            if (!IsPostBack) {
                for (int i = DateTime.Now.Year; i >= yr; i--)
                {
                   txt_year.Items.Add(i.ToString());
                    
                }
            }
        }

        protected void Handle_Change(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('"+ txt_year.Text +"');", true);
        }
    }
}