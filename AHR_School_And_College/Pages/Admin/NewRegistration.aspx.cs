using AHR_School_And_College.Method;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AHR_School_And_College.StringEncoding;
using System.Drawing;
using System.Drawing.Printing;
using System.Xml.Linq;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace AHR_School_And_College.Pages.Admin
{

    public partial class NewRegistration : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                year.Text = DateTime.Now.Year.ToString();
            }
            get_Student_ID();
        }

        protected void upload_image_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Image_Upload();
            //insert_Student_Information();

        }

        protected void Image_Upload()
        {
            lbl_img.Text = "";
            lbl_img1.Text = "";
            ////ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Hi" + "');", true);
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("~/image/upload/");
            //// Retrieve the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            if (oFile.PostedFile.FileName != "")
            {
                //    // Create the folder if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;

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
                    string img = @"https://" + Page.Request.Url.Authority + "/image/upload/" + strFileName;
                    insert_Student_Information(img);
                }
            }
            else
            {
                lbl_img.Text = "Please Upload Image First.";
                lbl_img1.Text = "Then Submit Information.";
            }
        }

        protected void get_Student_ID()
        {
            int yr = Convert.ToInt32(year.Text);
            if (yr > DateTime.Now.Year) { year.Text = DateTime.Now.Year.ToString(); }
            string query = "select * from st_info where year = " + Convert.ToInt32(year.Text) + " and gender = '"+gender.SelectedValue+"' order by stId desc";


            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query;
                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            stID.Text = (Convert.ToInt32(reader["stId"]) + 1).ToString();
                            break;
                        }
                    }
                    else
                    {
                        if (gender.SelectedValue.Equals("Female"))
                        {
                            stID.Text = (DateTime.Now.Year * 1000).ToString();
                        }
                        else if (gender.SelectedValue.Equals("Male"))
                        {
                            stID.Text = ((Convert.ToInt32(year.Text) * 1000) + 200).ToString();
                        }
                        else
                        {
                            stID.Text = ((Convert.ToInt32(year.Text) * 1000) + 400).ToString();
                        }
                    }
                } catch(System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }
        }

        protected void insert_Student_Information(string img)
        {
            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                SqlCommand cmd = new SqlCommand();
                SqlTransaction transaction = null;


                string qry = @"insert into st_info(stId, stName, dob, gender, religion, fName, mName, mobile, address, image, year, regDate) " +
                    "values(@stId, @stName, @dob, @gen, @religion, @fName, @mName, @mobile, @address, @image, @sess, default)";

                string qry1 = @"insert into admission(stName, gender, stId, class, year, image, admissionDate) " +
                    "values(@stName, @gen, @stId, @class, @year, @image, default)";

                string qry2 = @"insert into st_fees(stName, gender, stId, class, year, payCat,payDes, fee, image, payDate) " +
                    "values(@stName, @gen, @stId, @class, @year, @payCat, @payDes, @fee, @image, default)";

                try
                {
                    conn.Open();
                    transaction = conn.BeginTransaction();

                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.Clear();
                    addValue(cmd, img);
                    cmd.Transaction = transaction;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(qry1, conn);
                    cmd.Parameters.Clear();
                    addValue(cmd, img);
                    cmd.Transaction = transaction;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(qry2, conn);
                    cmd.Parameters.Clear();
                    addValue(cmd, img);
                    cmd.Transaction = transaction;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    transaction.Commit();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Insert Information Successfully." + "');", true);
                    get_Student_ID();
                    stName.Text = "";
                    dob.Text = "";
                    gender.SelectedIndex = 0;
                    religion.SelectedIndex = 0;
                    f_Name.Text = "";
                    m_Name.Text = "";
                    mobile.Text = "";
                    presentAddress.Text = "";
                    className.SelectedIndex = 0;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    transaction.Rollback();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "New Registration Fail for - " + ex.Message + "');", true);
                }
                finally
                {
                    conn.Close();
                }


            }
        }


        protected void addValue(SqlCommand cmd, string img)
        {
            int id = Convert.ToInt32(stID.Text);
            string name = stName.Text;
            string birth = dob.Text;
            string gen = gender.SelectedValue;
            string rel = religion.SelectedValue;
            string fname = f_Name.Text;
            string mname = m_Name.Text;
            string mob = mobile.Text;
            string add = presentAddress.Text;
            int yr = Convert.ToInt32(year.Text);
            int cls = Convert.ToInt32(className.SelectedValue);

            cmd.Parameters.AddWithValue("@stId", id);
            cmd.Parameters.AddWithValue("@stName", name);
            cmd.Parameters.AddWithValue("@dob", birth);
            cmd.Parameters.AddWithValue("@gen", gen);
            cmd.Parameters.AddWithValue("@religion", rel);
            cmd.Parameters.AddWithValue("@fName", fname);
            cmd.Parameters.AddWithValue("@mName", mname);
            cmd.Parameters.AddWithValue("@mobile", mob);
            cmd.Parameters.AddWithValue("@address", add);
            cmd.Parameters.AddWithValue("@image", img);
            cmd.Parameters.AddWithValue("@sess", yr);
            cmd.Parameters.AddWithValue("@year", DateTime.Now.Year);
            cmd.Parameters.AddWithValue("@payCat", "Admission");
            cmd.Parameters.AddWithValue("@payDes", "Admission Fee for class " + className.SelectedValue.ToString().Trim());
            cmd.Parameters.AddWithValue("@class", cls);
            cmd.Parameters.AddWithValue("@fee", GetAdmissionFees(className.SelectedValue));
        }


        protected void insert_Student_Information1(string img)
        {
            SqlConnection conn = new SqlConnection(new sqlServer().LINK);
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "hi" + "');", true);
            conn.Close();
            int id = Convert.ToInt32(stID.Text);
            string name = stName.Text;
            string birth = dob.Text;
            string gen = gender.SelectedValue;
            string rel = religion.SelectedValue;
            string fname = f_Name.Text;
            string mname = m_Name.Text;
            string mob = mobile.Text;
            string add = presentAddress.Text;
            int yr = Convert.ToInt32(year.Text);
            int cls = Convert.ToInt32(className.SelectedValue);



            if (!oFile.HasFile)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please upload a Image first." + "');", true);
            }
            else
            {
                //int len = oFile.PostedFile.ContentLength;
                //byte[] pic = new byte[len];
                //oFile.PostedFile.InputStream.Read(pic, 0, len);

                string query = "insert into st_info(stId, stName, dob, gender, religion, fName, mName, mobile, address, image, year) " +
                    "values(@stId, @stName, @dob, @gender, @religion, @fName, @mName, @mobile, @address, @image, @year)";

                conn.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@stId", id);
                cmd.Parameters.AddWithValue("@stName", name);
                cmd.Parameters.AddWithValue("@dob", birth);
                cmd.Parameters.AddWithValue("@gender", gen);
                cmd.Parameters.AddWithValue("@religion", rel);
                cmd.Parameters.AddWithValue("@fName", fname);
                cmd.Parameters.AddWithValue("@mName", mname);
                cmd.Parameters.AddWithValue("@mobile", mob);
                cmd.Parameters.AddWithValue("@address", add);
                cmd.Parameters.AddWithValue("@image", img);
                cmd.Parameters.AddWithValue("@year", yr);
                //adapter.InsertCommand = new SqlCommand(query, conn);
                //adapter.InsertCommand.ExecuteNonQuery();

                if (cmd.ExecuteNonQuery() > 0)
                {

                    string query2 = "insert into admission(stName, gender, stId, class, year, admissionDate) values(@stName, @gen, @stId, @class, @year, default)";
                    cmd = new SqlCommand(query2, conn);
                    cmd.Parameters.AddWithValue("@stName", name);
                    cmd.Parameters.AddWithValue("@gen", gen);
                    cmd.Parameters.AddWithValue("@stId", id);
                    cmd.Parameters.AddWithValue("@class", cls);
                    cmd.Parameters.AddWithValue("@year", yr);


                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        string query3 = "insert into st_fees(stName, gender, stId, class, year, payCat,payDes, fee, payDate) values(@stName, @gen, @stId, @class, @year, @payCat, @payDes, @fee, default)";
                        cmd = new SqlCommand(query3, conn);
                        cmd.Parameters.AddWithValue("@stName", name);
                        cmd.Parameters.AddWithValue("@gen", gen);
                        cmd.Parameters.AddWithValue("@stId", id);
                        cmd.Parameters.AddWithValue("@class", cls);
                        cmd.Parameters.AddWithValue("@year", yr);
                        cmd.Parameters.AddWithValue("@payCat", "Admission");
                        cmd.Parameters.AddWithValue("@payDes", "Admission");
                        cmd.Parameters.AddWithValue("@fee", GetAdmissionFees(className.SelectedValue));
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            get_Student_ID();
                            stName.Text = "";
                            dob.Text = "";
                            gender.SelectedIndex = 0;
                            religion.SelectedIndex = 0;
                            f_Name.Text = "";
                            m_Name.Text = "";
                            mobile.Text = "";
                            presentAddress.Text = "";
                            //oFile.Value = "";
                            conn.Close();
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Insert Information Successfully." + "');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Insert Payment Failed" + "');", true);
                            conn.Close();
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "New Admission Failed" + "');", true);
                        conn.Close();
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "New Registration Fail" + "');", true);
                    conn.Close();
                }


            }


            //string query = @"insert into st_info values("+id+", "+name+", "+birth+", "+gen+", "+rel+", "+fname+", "+mname+","+mob+", "+add+", "+img+", "+yr+")";



        }

        public static int GetAdmissionFees(string val)
        {
            if (val.Equals("6")) return 1500;
            else if (val.Equals("7")) return 1500;
            else if (val.Equals("8")) return 1600;
            else if (val.Equals("9")) return 1800;
            else if (val.Equals("10")) return 1800;
            else if (val.Equals("11")) return 2000;
            else if (val.Equals("12")) return 2000;
            else return 0;
        }

        protected void session_TextChanged(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Hi" + "');", true);
            get_Student_ID();
        }
    }
}