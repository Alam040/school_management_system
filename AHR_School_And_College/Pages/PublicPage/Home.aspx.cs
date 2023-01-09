using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get_Faculties(sender, e, faculties);
        }

        protected void Get_Faculties(object sender, EventArgs e, Repeater faculties)
        {
            string url = "http://localhost:4000/api/employee";
            using (var clinent = new HttpClient())
            {
                var endPoint = new Uri(url);

                var result = clinent.GetAsync(endPoint).Result.Content.ReadAsStringAsync().Result;
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(result, (typeof(DataTable)));
                faculties.DataSource = result;
                faculties.DataBind();

            }
        }
    }
}