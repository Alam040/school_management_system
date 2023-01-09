using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using AHR_School_And_College.Method;

namespace AHR_School_And_College
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_id_a.Text= "2023987";
            txt_pass_a.Text = "admin";
            //txt_pass_a.Text = "admin";
            
        }

        protected void admin_login_submit_Click(object sender, EventArgs e)
        {
            lbl.Text = "";
            if (!txt_id_a.Text.Equals("") && !txt_pass_a.Text.Equals(""))
            {
                string qry = "select * from admin where uId = " + Convert.ToInt32(txt_id_a.Text) + " and pass = '" + txt_pass_a.Text + "'";
                using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
                {
                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand(qry, conn);
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            if (rdr.HasRows)
                            {
                                Response.RedirectToRoute("admin-dash");
                            }
                            else
                            {
                                lbl.Text = "User not Found.";
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
            else
            {
                lbl.Text = "Pleace fill the box.";
            }
        }
    }
}