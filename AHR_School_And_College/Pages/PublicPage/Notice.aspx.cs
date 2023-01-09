using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = "http://localhost:4000/api/employee/teachers";
                this.Get_Faculties(sender, e, Set_Notice, url);

            }
        }

        protected void Get_Faculties(object sender, EventArgs e, Repeater Set_Notice, string url)
        {
            Set_Notice.DataSource = null;
            Set_Notice.DataBind();

            using (var clinent = new HttpClient())
            {
                try
                {
                    pnl_Notice_container2.Visible = false;  
                    pnl_Notice_container1.Visible = true;
                    var endPoint = new Uri(url);
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + clinent.GetAsync(endPoint).Result.Content.ReadAsStringAsync().Result + "');", true);

                    var result = clinent.GetAsync(endPoint).Result.Content.ReadAsStringAsync().Result;
                    DataTable dt = (DataTable)JsonConvert.DeserializeObject(result, typeof(DataTable));
                    int t_Rows = dt.Rows.Count;
                    if(t_Rows > 0)
                    {
                        pnl_Notice.Visible = false;
                    }
                    else
                    {
                        pnl_Notice.Visible = true;
                    }
                    Set_Notice.DataSource = dt;
                    Set_Notice.DataBind();

                }
                catch (Exception ex)
                {
                    if (ex.Message == ex.Message) 
                    { 
                        pnl_Notice_container1.Visible=false;
                        pnl_Notice_container2.Visible = true; 
                    }
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }

            }
        }
    }
}