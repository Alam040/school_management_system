using AHR_School_And_College.Method;
using Castle.Components.DictionaryAdapter.Xml;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College
{
    public partial class Student : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                year.Text = DateTime.Now.Year.ToString();
                get_student_Information();
            }
        }

        protected void Get_All_Students(string url)
        {
            //using(HttpClient client = new HttpClient())
            //{
            //    client.BaseAddress = new Uri(url);
            //    var result = client.GetAsync("students/admission/all").Result.Content.ReadAsStringAsync().Result;
            //    DataTable dt = JsonConvert.DeserializeObject<DataTable>(result);

            //    student_info.DataSource = dt;
            //    student_info.DataBind();

            //}
        }

        protected void get_student_Information()
        {
            int yr = 0;
            string qry = "select * from st_info where status = 'Active'";
            if (!year.Text.Equals(""))
            {
                yr = Convert.ToInt32(year.Text);
                qry += (" and year = " + yr);
            }

            
            if (!search_stId.Text.Equals(""))
            {
                int id = Convert.ToInt32(search_stId.Text);
                qry += " and stId = " + id;
            }


            string gen = gender.SelectedValue;
            if (!gen.Equals("0"))
            {
                qry += " and gender = '" + gen + "'";

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
                    SqlCommand cmd = new SqlCommand(qry, conn);
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


        protected void year_TextChanged1(object sender, EventArgs e)
        {
            get_student_Information();
        }

        protected void gender_SelectedIndexChanged(object sender, EventArgs e)
        {
            get_student_Information();
        }

        protected void Desc_Click1(object sender, ImageClickEventArgs e)
        {
            Desc.Visible = false;
            Asc.Visible = true;
            get_student_Information();
        }

        protected void Asc_Click1(object sender, ImageClickEventArgs e)
        {
            Asc.Visible = false;
            Desc.Visible = true;
            get_student_Information();
        }

        protected void search_stId_TextChanged1(object sender, EventArgs e)
        {
            get_student_Information();
        }

        protected void tData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int pID = Convert.ToInt32(tData.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                string qry = "select * from st_info where stId = " + pID + " and status = 'Active'";
                SqlCommand cmd = new SqlCommand(qry, conn);
                try
                {
                    conn.Open();
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            up_stId.Text = rd["stId"].ToString().Trim();
                            up_stName.Text = rd["stName"].ToString().Trim();
                            up_dob.Text = rd["dob"].ToString().Trim();
                            up_gender.SelectedValue = rd["gender"].ToString().Trim();
                            up_religion.SelectedValue = rd["religion"].ToString().Trim();
                            up_f_Name.Text = rd["fName"].ToString().Trim();
                            up_m_Name.Text = rd["mName"].ToString().Trim();
                            up_mobile.Text = rd["mobile"].ToString().Trim();
                            up_presentAddress.Text = rd["address"].ToString().Trim();
                            up_year.Text = rd["year"].ToString().Trim();
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
        }

        protected void cnl_Click(object sender, EventArgs e)
        {
            perId.Text = "";
            diabox.Visible = false;
        }

        protected void okay_Click(object sender, EventArgs e)
        {

            //string qry = "delete from st_info where stId = " + Convert.ToInt32(perId.Text) + "";
            string qry = "update st_info set status='De-Active' where stId = " + Convert.ToInt32(perId.Text) + "";
            string qry1 = "update admission set status='De-Active' where stId = " + Convert.ToInt32(perId.Text) + "";
            string qry2 = "update st_fees set status='De-Active' where stId = " + Convert.ToInt32(perId.Text) + "";


            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                SqlTransaction transaction = null;
                try
                {
                    conn.Open();
                    SqlCommand cmd = null;

                    transaction = conn.BeginTransaction();
                    cmd = new SqlCommand(qry, conn);
                    cmd.Transaction= transaction;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(qry1, conn);
                    cmd.Transaction= transaction;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(qry2, conn);
                    cmd.Transaction= transaction;
                    cmd.ExecuteNonQuery();

                    transaction.Commit();
                    perId.Text = "";
                    diabox.Visible = false;
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Student ID "+perId+" - All Information are De-Activate." + "');", true);
                    get_student_Information();
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    transaction.Rollback();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }
            }

        }

        protected void cancel_Click(object sender, ImageClickEventArgs e)
        {
            clean_field();
        }


        protected void clean_field()
        {
            editPnl.Visible = false;
            up_stId.Text = "";
            up_stName.Text = "";
            up_dob.Text = "";
            up_gender.SelectedIndex = 0;
            up_religion.SelectedIndex = 0;
            up_f_Name.Text = "";
            up_m_Name.Text = "";
            up_mobile.Text = "";
            up_presentAddress.Text = "";
            up_year.Text = "";
        }

        protected void Cancel_Information_Click(object sender, EventArgs e)
        {
            clean_field();
        }

        protected void up_Student_Informaion_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    string qry = "update st_info set stName = @nm, dob = @dob, gender = @gen, religion = @rel, fName = @fn, mName = @mn, " +
                        "mobile = @mob, address = @add, year = @yr where stId = " + Convert.ToInt32(up_stId.Text) + "";
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@nm", up_stName.Text);
                    cmd.Parameters.AddWithValue("@dob", up_dob.Text);
                    cmd.Parameters.AddWithValue("@gen", up_gender.Text);
                    cmd.Parameters.AddWithValue("@rel", up_religion.Text);
                    cmd.Parameters.AddWithValue("@fn", up_f_Name.Text);
                    cmd.Parameters.AddWithValue("@mn", up_m_Name.Text);
                    cmd.Parameters.AddWithValue("@mob", up_mobile.Text);
                    cmd.Parameters.AddWithValue("@add", up_presentAddress.Text);
                    cmd.Parameters.AddWithValue("@yr", Convert.ToInt32(up_year.Text));
                    conn.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        get_student_Information();
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Update Record Successfully." + "');", true);
                        clean_field();
                        conn.Close();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Cannot Update Record..! Please try Again." + "');", true);
                        conn.Close();
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