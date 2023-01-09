using AHR_School_And_College.Method;
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

namespace AHR_School_And_College.Pages.PublicPage
{
    public partial class NewClassAdmission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnl_newClass.Visible = false;
                var year = DateTime.Now.Year;
                for(int i = year; i > year - 1; i--)
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = i.ToString();
                    listItem.Value = i.ToString();
                    ddl_year.Items.Add(listItem);
                }
                ddl_year.SelectedIndex = 0;

            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            string id = stId.Text;
            string url = "http://localhost:4000/api/students/";

            using(HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(url);
                var result = client.GetAsync(id).Result.Content.ReadAsStringAsync().Result;
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(result);

                if(dt != null)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        int gen = 0;

                        if (row["gender"].ToString() == "Female") gen = 1;
                        else if (row["gender"].ToString() == "Female") gen = 2;


                        stName.Text = row["stName"].ToString();
                        gender.SelectedIndex = gen;
                    }
                    pnl_newClass.Visible = true;
                }
            }

        }

        protected void submit_admission_Click(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/students/admission";
            int fee = 2000;
            string className = ddl_class.SelectedItem.Value;
            if (className == "7" || className == "8") fee = 1500;
            else if (className == "9" || className == "10") fee = 1800;

            JObject data = 
                new JObject(
                    new JProperty("stId", stId.Text),
                    new JProperty("stName", stName.Text),
                    new JProperty("feeType", "Admission"),
                    new JProperty("fee", fee),
                    new JProperty("gender", gender.SelectedItem.Value),
                    new JProperty("class", className),
                    new JProperty("year", ddl_year.SelectedItem.Value)
                );

            PostMethod postMethod = new PostMethod();
            var resutl = postMethod.post_method(data, url);
            stName.Text = "";
            gender.SelectedIndex=-1;
            ddl_class.SelectedIndex=-1;
            ddl_year.SelectedIndex=-1;
        }
    }
}