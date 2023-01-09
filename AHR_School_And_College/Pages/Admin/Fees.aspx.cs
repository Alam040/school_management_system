using AHR_School_And_College.Method;
using Castle.Components.DictionaryAdapter.Xml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College.Admin
{
    public partial class Fees : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                year.Text = DateTime.Now.Year.ToString();
                get_student_fees();
            }

        }

        protected void Desc_Click(object sender, ImageClickEventArgs e)
        {
            Asc.Visible = true;
            Desc.Visible = false;
            get_student_fees();
        }

        protected void Asc_Click(object sender, ImageClickEventArgs e)
        {
            Desc.Visible = true;
            Asc.Visible = false;
            get_student_fees();
        }

        protected void className_SelectedIndexChanged(object sender, EventArgs e)
        {
            get_student_fees();
        }

        protected void year_TextChanged(object sender, EventArgs e)
        {
            get_student_fees();
        }

        protected void get_student_fees()
        {
            int yr = 0;
            string qry = "select * from st_fees where status = 'Active'";
            if (!year.Text.Equals(""))
            {
                yr = Convert.ToInt32(year.Text);
                qry += (" and year = " + yr);
            }

            if (!search_stId.Text.Equals(""))
            {
                qry += "and stId = " + Convert.ToInt32(search_stId.Text);

            }

            int cls = Convert.ToInt32(className.SelectedValue);
            if (cls > 0)
            {
                qry += " and class = " + cls;
            }
            string gen = gender.SelectedValue;
            if (!gen.Equals("0"))
            {
                qry += " and gender = '" + gen + "'";
            }


            string pCat = Payment_Categories.SelectedValue;

            if (!pCat.Equals("0"))
            {
                qry += " and payCat = '" + pCat + "'";
            }

            if (Desc.Visible == true)
            {
                qry += " order by stId desc";
            }
            else
            {
                qry += " order by stId asc";
            }


            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    sqlServer ss = new sqlServer();
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    conn.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);

                            conn.Close();
                            if (dt.Rows.Count > 0)
                            {
                                tData.DataSource = dt;
                                tData.DataBind();
                            }
                            else
                            {
                                dt.Rows.Add(dt.NewRow());
                                tData.DataSource = dt;
                                tData.DataBind();
                                tData.Rows[0].Cells.Clear();
                                tData.Rows[0].Cells.Add(new TableCell());
                                tData.Rows[0].Cells[0].ColumnSpan = tData.Columns.Count;
                                tData.Rows[0].Cells[0].Text = "No Data Found";
                                tData.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
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

        protected void search_stId_TextChanged(object sender, EventArgs e)
        {
            get_student_fees();
        }

        protected void Cancel_Information_Click(object sender, EventArgs e)
        {
            set_field_empty();
        }

        protected void cancel_Click(object sender, ImageClickEventArgs e)
        {
            set_field_empty();
        }

        void set_field_empty()
        {
            editPnl.Visible = false;
            up_PayId.Text = "";
            up_stId.Text = "";
            up_stName.Text = "";
            up_gender.SelectedIndex = 0;
            up_className.SelectedIndex = 0;
            up_year.Text = "";
            up_payCat.SelectedIndex = 0;
            up_payDes.Text = "";
            up_fee.Text = "";
            up_PayDate.Text = "";
        }

        protected void up_Payment_Informaion_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(up_PayId.Text);
            string qry = "update st_fees set payCat = @payCat, payDes=@payDes, fee = @fee where id = " + id + "";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@payCat", up_payCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@payDes", up_payDes.Text);
                    cmd.Parameters.AddWithValue("@fee", up_fee.Text);
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        get_student_fees();
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Update Record Successfully." + "');", true);
                        set_field_empty();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Cannot Update Record..! Please try Again." + "');", true);
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }




        }

        protected void tData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int pID = Convert.ToInt32(tData.DataKeys[e.RowIndex].Value.ToString());

            string qry = "select * from st_fees where id = " + pID + "";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            up_PayId.Text = (Convert.ToInt32(reader["id"])).ToString();
                            up_stId.Text = (Convert.ToInt32((reader["stId"])).ToString());
                            up_stName.Text = reader["stName"].ToString();
                            up_gender.SelectedValue = reader["gender"].ToString();
                            up_className.SelectedValue = reader["class"].ToString();
                            up_year.Text = reader["year"].ToString();
                            up_payCat.SelectedValue = reader["payCat"].ToString();
                            up_payDes.Text = reader["payDes"].ToString();
                            up_fee.Text = reader["fee"].ToString();
                            up_PayDate.Text = reader["payDate"].ToString();
                            editPnl.Visible = true;
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



        protected void tData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int pID = Convert.ToInt32(tData.DataKeys[e.RowIndex].Value.ToString());
            perId.Text = pID.ToString();
            diabox.Visible = true;

            //
        }


        protected void cnl_Click(object sender, EventArgs e)
        {
            perId.Text = "";
            diabox.Visible = false;
        }

        protected void okay_Click(object sender, EventArgs e)
        {
            string qry = "delete from st_fees where id = " + Convert.ToInt32(perId.Text) + "";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        get_student_fees();
                        perId.Text = "";
                        diabox.Visible = false;
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Record Delete Successfully." + "');", true);
                    }
                    else
                    {
                        diabox.Visible = false;
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Something Wrong. Please try Again." + "');", true);
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