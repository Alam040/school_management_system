using AHR_School_And_College.Method;
using Castle.Components.DictionaryAdapter.Xml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College.Admin
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }

        }

        protected void upload_image_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (!oFile.HasFile)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please upload a Image first." + "');", true);
            }
            else
            {
                upload_emp_image();
            }
        }

        protected void employeeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private protected void set_Emp_Info(string pic)
        {
            string qry = "insert into emp_info(empName, dob, gender, mobile, email, religion, address, subject, salary, image, regDate) " +
                "values(@name, @dob, @gen, @mob, @em, @rel, @add, @sub, @sal, @img, default)";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", empName.Text);
                    cmd.Parameters.AddWithValue("@dob", dob.Text);
                    cmd.Parameters.AddWithValue("@gen", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@rel", religion.SelectedValue);
                    cmd.Parameters.AddWithValue("@mob", mobile.Text);
                    cmd.Parameters.AddWithValue("@em", email.Text);
                    cmd.Parameters.AddWithValue("@sub", subOfLecturer.Text);
                    cmd.Parameters.AddWithValue("@add", presentAddress.Text);
                    cmd.Parameters.AddWithValue("@sal", Convert.ToInt32(monthlySalary.Text));
                    cmd.Parameters.AddWithValue("@img", pic);
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        empName.Text = "";
                        dob.Text = "";
                        mobile.Text = "";
                        email.Text = "";
                        presentAddress.Text = "";
                        monthlySalary.Text = "";
                        subOfLecturer.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Insert Information Successfully." + "');", true);
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }

        }
        protected void upload_emp_image()
        {
            //stringlbl_img.Text = "";
            lbl_img.Text = "";
            lbl_img1.Text = "";
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Hi" + "');", true);
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("~/image/upload/");
            // Retrieve the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile.PostedFile.FileName != "")
            {
                // Create the folder if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder +"Employee_"+ strFileName;

                if (File.Exists(strFilePath))
                {
                    up_st_img.ImageUrl = "~/image/broken-image1.png";
                    lbl_img.Text = "Image" + " '" + strFileName + "' already exits.";
                    lbl_img1.Text = "Please Change or Rename this image";
                }
                else
                {
                    oFile.PostedFile.SaveAs(strFilePath);
                    //up_st_img.ImageUrl = "https://" + Page.Request.Url.Authority + "/image/upload/" + strFileName;
                    string img = @"https://" + Page.Request.Url.Authority + "/image/upload/Employee_" + strFileName;
                    set_Emp_Info(img);
                }
            }
            else
            {
                lbl_img.Text = "Please Upload Image First.";
                lbl_img1.Text = "Then Submit Information.";
            }
        }
    }
}