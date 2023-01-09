
using AHR_School_And_College.StringEncoding;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Instrumentation;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College.Admin
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Bs64Encode bs64 = new Bs64Encode();

                //string s = Page.RouteData.Values["id"].ToString();
                //setValue(bs64.decode_bs64(s), sender, e);
                setValue("2214002", sender, e);

            }
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + bs64.decode_bs64(s) + "');", true);
        }

        protected void setValue(string id, object sender, EventArgs e)
        {

            string url = "http://localhost:4000/api/employee/";
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(url);
                var result = client.GetAsync(id).Result.Content.ReadAsStringAsync().Result;
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(result);

                foreach (DataRow row in dt.Rows)
                {
                    int gen = 0;
                    int rel = 0;
                    int marri = 0;
                    int empType = 0;
                    int jType = 0;

                    if ((string)row[3] == "Female") gen = 1;

                    if (row[5].ToString() == "Hindu") rel = 1;
                    else if (row[5].ToString() == "Christian") rel = 2;
                    else if (row[5].ToString() == "Buddhist") rel = 3;

                    if (row[6].ToString() == "Single") marri = 1;

                    if (row[11].ToString() == "Principal") empType = 1;
                    else if (row[11].ToString() == "Others") empType = 2;

                    if (row[13].ToString() == "Security Guird") jType = 1;
                    else if (row[13].ToString() == "Night Guird") jType = 2;
                    else if (row[13].ToString() == "Office Assistent") jType = 3;
                    else if (row[13].ToString() == "Sweeper") jType = 4;

                    if (empType == 2)
                    {
                        pnl_teacher.Visible = false;
                        pnl_others.Visible = true;
                    }
                    else
                    {
                        pnl_others.Visible = false;
                        pnl_teacher.Visible = true;
                    }

                    empId.Text = row[1].ToString();
                    empName.Text = (string)row[2];
                    gender.SelectedIndex = gen;
                    dob.Text = (string)row[4];
                    religion.SelectedIndex = rel;
                    marritalStatus.SelectedIndex = marri;
                    mobile.Text = (string)row[7];
                    email.Text = (string)row[8];
                    presentAddress.Text = (string)row[9];
                    permanentAddress.Text = (string)row[10];
                    employeeType.SelectedIndex = empType;
                    department.Text = (string)row[12];
                    jobType.SelectedIndex = jType;
                    subOfLecturer.Text = (string)row[14];
                    qualification.Text = (string)row[15];
                    monthlySalary.Text = (string)row[17];
                    up_img.Src = (string)row[18];
                    status.Text = (string)row[19];
                    joiningDate.Text = (string)DateTime.Parse(row[16].ToString()).ToString("yyyy-MM-dd").ToString();


                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + DateTime.Parse(row[16].ToString()).ToString("yyyy-mm-dd") + "');", true);
                }

            }
        }

        protected void presentAddress_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ckd_same_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void upload_image_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {

        }

        protected void employeeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (employeeType.SelectedIndex == 2)
            {
                pnl_teacher.Visible = false;
                pnl_others.Visible = true;
            }
            else
            {
                pnl_others.Visible = false;
                pnl_teacher.Visible = true;
            }

        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {

        }
    }
}