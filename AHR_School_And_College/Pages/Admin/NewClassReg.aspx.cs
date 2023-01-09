using AHR_School_And_College.Method;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College.Admin
{
    public partial class NewClassReg : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_id_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    not_found.Text = "";
                    //string query = "select st_info.stName, st_info.gender, admission.class from st_info, admission where st_info.stId = " + stID.Text + " and admission.year = " + y + " and st_info.stId = admission.stId";
                    string query = "select * from admission where stId = " + stID.Text + " and year = " + (DateTime.Now.Year - 1) + "";
                    string query1 = "select * from admission where stId = " + stID.Text + " and year = " + (DateTime.Now.Year) + "";
                    SqlCommand cmd = new SqlCommand(query1, conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            not_found.Text = "Already Admit in class-" + reader["class"].ToString().Trim() + ". Please try again in next year.";
                            return;
                        }
                    }
                    reader.Close();

                    cmd = new SqlCommand(query, conn);
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            stName.Text = reader["stName"].ToString().Trim();
                            gender.Text = reader["gender"].ToString().Trim();
                            IMG.ImageUrl = reader["image"].ToString().Trim();
                            className.SelectedValue = (Convert.ToInt32(reader["class"]) + 1) > 10 ? "6" : (Convert.ToInt32(reader["class"]) + 1).ToString();
                            year.Text = DateTime.Now.Year.ToString();
                            adFee.Text = GetAdmissionFees(className.SelectedValue).ToString();
                            pnl.Visible = true;
                        }
                    }
                    else
                    {
                        not_found.Text = "Student ID not Found or No Class Complete in Previous Year.";
                        pnl.Visible = false;
                        stName.Text = "";
                        year.Text = "";
                        adFee.Text = "";
                        gender.Text = "";
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }
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

        protected void className_SelectedIndexChanged(object sender, EventArgs e)
        {
            adFee.Text = GetAdmissionFees(className.SelectedValue).ToString();
        }

        protected void Submit_Admission_Click(object sender, EventArgs e)
        {

            string query = "insert into admission(stName, gender, stId, class, year, image, admissionDate) values(@stName, @gen, @stId, @class, @year, @img, default)";
            string query2 = "insert into st_fees(stName, gender, stId, class, year, payCat, payDes, fee, image, payDate) values(@stName, @gen, @stId, @class, @year, @payCat, @payDes, @fee, @img, default)";
            SqlCommand cmd = new SqlCommand(query, conn);

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                SqlTransaction transaction = null;
                try
                {
                    conn.Open();
                    transaction = conn.BeginTransaction();

                    cmd = new SqlCommand(query, conn);
                    commandValue(cmd);
                    cmd.Transaction = transaction;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(query2, conn);
                    commandValue(cmd);
                    cmd.Transaction = transaction;
                    cmd.ExecuteNonQuery();

                    transaction.Commit();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "New Admission Success." + "');", true);
                    pnl.Visible = false;
                    stName.Text = "";
                    year.Text = "";
                    adFee.Text = "";
                    gender.Text = "";
                    IMG.ImageUrl = "";
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    transaction.Rollback();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }
        }

        private protected void commandValue(SqlCommand cmd)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@stName", stName.Text);
            cmd.Parameters.AddWithValue("@gen", gender.Text);
            cmd.Parameters.AddWithValue("@stId", Convert.ToInt32(stID.Text));
            cmd.Parameters.AddWithValue("@class", Convert.ToInt32(className.Text));
            cmd.Parameters.AddWithValue("@year", Convert.ToInt32(year.Text));
            cmd.Parameters.AddWithValue("@img", IMG.ImageUrl.ToString());
            cmd.Parameters.AddWithValue("@payCat", "Admission");
            cmd.Parameters.AddWithValue("@payDes", "New Admission for class " + className.SelectedValue);
            cmd.Parameters.AddWithValue("@fee", Convert.ToInt32(adFee.Text));
        }
    }
}