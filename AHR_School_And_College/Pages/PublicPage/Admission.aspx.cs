//using HtmlAgilityPack;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace AHR_School_And_College
{
    public partial class Admission : System.Web.UI.Page
    {

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ckd_same.Checked = true;
            }
        }

        protected void Handle_Change(object sender, EventArgs e)
        {
            if (ckd_same.Checked)
            {
                permanentAddress.Text = presentAddress.Text;
            }
        }

        protected void handle_upload_image(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + oFile.Value + "');", true);
        }

        protected void ckd_same_CheckedChanged(object sender, EventArgs e)
        {
            if (ckd_same.Checked)
            {
                permanentAddress.Text = presentAddress.Text;
            }
        }


        protected void Handle_Submit(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("~/image/upload/");
            // Retrieve the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile.Value != "")
            {
                // Create the folder if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                if (File.Exists(strFilePath))
                {
                    //lblUploadResult.Text = strFileName + " already exists on the server!";
                    lbl_img.Text = "Image" + " '" + strFileName + "' already exits.";
                    lbl_img1.Text = "Please Change or Rename this image";
                }
                else
                {
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + Response.RedirectLocation.ToString() + "');", true);
                    oFile.PostedFile.SaveAs(strFilePath);
                    JObject data =
                       new JObject(
                       new JProperty("class", className.SelectedValue),
                       new JProperty("stName", stName.Text),
                       new JProperty("dob", dob.Text),
                       new JProperty("gender", gender.Text),
                       new JProperty("mobile", mobile.Text),
                       new JProperty("religion", religion.Text),
                       new JProperty("f_Name", f_Name.Text),
                       new JProperty("f_Nid", f_Nid.Text),
                       new JProperty("m_Name", m_Name.Text),
                       new JProperty("m_Nid", m_Nid.Text),
                       new JProperty("l_Guardian", l_Guardian.Text),
                       new JProperty("l_G_mobile", l_G_mobile.Text),
                       new JProperty("presentAddress", presentAddress.Text),
                       new JProperty("permanentAddress", permanentAddress.Text),
                       new JProperty("image", "https://" + Page.Request.Url.Authority + "/image/upload/" + strFileName)
                        );

                    method(data);
                    Response.Redirect("~/admission");
                }
            }
            else
            {
                lbl_img.Text = "Please Upload Image First.";
                lbl_img1.Text = "Then Submit Information.";
            }
        }

        public void method(JObject data)
        {

            var httpWebRequest = (HttpWebRequest)WebRequest.Create("http://localhost:4000/api/students");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = data.ToString();

                streamWriter.Write(json);
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", script: "alert('" + result + "');", true);
                //btn_Submit.PostBackUrl = "~/admission";
                //stName.Text = "";
                //dob.Text = "";
                //gender.SelectedIndex = 0;
                //mobile.Text = "";
                //religion.SelectedIndex = 0;
                //f_Name.Text = "";
                //f_Nid.Text = "";
                //m_Name.Text = "";
                //m_Nid.Text = "";
                //l_Guardian.Text = "";
                //l_G_mobile.Text = "";
                //permanentAddress.Text = "";
                //presentAddress.Text = "";
                //ckd_same.Checked = true;
            }
        }



































        public async Task<Uri> post(JObject data, HttpClient client)
        {
            string url = "http://localhost:4000/api/students";
            var response = await client.PostAsync(url, new StringContent(data.ToString(), Encoding.UTF8, "application/json"));
            if (response.IsSuccessStatusCode)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Success');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Failed');", true);
            }
            response.EnsureSuccessStatusCode();

            // return URI of the created resource.
            return response.Headers.Location;
        }


        static async Task<Uri> CreateProductAsync(JObject body, HttpClient client)
        {

            HttpResponseMessage response = await client.PostAsJsonAsync("http://localhost:4000/api/students", body);

            response.EnsureSuccessStatusCode();

            // return URI of the created resource.
            return response.Headers.Location;
        }

    }
}