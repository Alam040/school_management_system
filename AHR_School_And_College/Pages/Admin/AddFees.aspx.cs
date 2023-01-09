using System.Data.SqlClient;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AHR_School_And_College.Method;

namespace AHR_School_And_College.Pages.Admin
{
    public partial class AddFees : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                year.Text = DateTime.Now.Year.ToString();
            }
        }

        protected void search_id_Click(object sender, EventArgs e)
        {
            not_found.Text = "";
            string qry = "select * from admission where stId = "+Convert.ToInt32(stID.Text) +" and year = "+Convert.ToInt32(year.Text)+"";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                stName.Text = reader["stName"].ToString();
                                className.SelectedValue = reader["class"].ToString().Trim();
                                gender.Text = reader["gender"].ToString();
                                IMG.ImageUrl = reader["image"].ToString().Trim();
                                pnl.Visible = true;
                            }
                        }
                        else
                        {
                            not_found.Text = "Student Id not found in Admission Database";
                        }
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }
        }

        protected void Submit_Admission_Click(object sender, EventArgs e)
        {
            string qry = "insert into st_fees(stName, gender, stId, class, year, payCat, payDes, fee, image, payDate) " +
                "values(@stName,@gen, @stId, @cls, @yr, @payCat, @payDes, @fee, @img, default)";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@stId", Convert.ToInt32(stID.Text));
                    cmd.Parameters.AddWithValue("@stName", stName.Text);
                    cmd.Parameters.AddWithValue("@gen", gender.Text);
                    cmd.Parameters.AddWithValue("@cls", Convert.ToInt32(className.SelectedValue));
                    cmd.Parameters.AddWithValue("@yr", Convert.ToInt32(year.Text));
                    cmd.Parameters.AddWithValue("@payCat", up_payCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@payDes", payDes.Text);
                    cmd.Parameters.AddWithValue("@img", IMG.ImageUrl.ToString().Trim());
                    cmd.Parameters.AddWithValue("@fee", Convert.ToInt32(adFee.Text));
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        payDes.Text = "";
                        adFee.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Payment Successful." + "');", true);
                        pnl.Visible = false;

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Payment Rejected." + "');", true);
                    }

                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }
        }
    }
}