using AHR_School_And_College.Method;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AHR_School_And_College.Pages.Admin
{
    public partial class AdmissionPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                year.Text = DateTime.Now.Year.ToString();
                get_student_Information();
            }
        }

        
        protected void get_student_Information()
        {
            int yr = 0;
            string qry = "select * from admission where status = 'Active'";
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
                                tAdmData.DataSource = dt;
                                tAdmData.DataBind();
                            }
                            else
                            {
                                dt.Rows.Add(dt.NewRow());
                                tAdmData.DataSource = dt;
                                tAdmData.DataBind();
                                tAdmData.Rows[0].Cells.Clear();
                                tAdmData.Rows[0].Cells.Add(new TableCell());
                                tAdmData.Rows[0].Cells[0].ColumnSpan = tAdmData.Columns.Count;
                                tAdmData.Rows[0].Cells[0].Text = "No Data Found";
                                tAdmData.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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
            int pID = Convert.ToInt32(tAdmData.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                string qry = "select * from admission where stId = " + pID + "";
                SqlCommand cmd = new SqlCommand(qry, conn);
                try
                {
                    conn.Open();
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            up_stID.Text = rd["stId"].ToString().Trim();
                            Up_stName.Text = rd["stName"].ToString().Trim();
                            up_gender.Text = rd["gender"].ToString().Trim();
                            up_year.Text = rd["year"].ToString().Trim();
                            IMG.ImageUrl = rd["image"].ToString().Trim();
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
            int pID = Convert.ToInt32(tAdmData.DataKeys[e.RowIndex].Value.ToString());
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
                    
                    cmd = new SqlCommand(qry1, conn);
                    cmd.Transaction = transaction;
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(qry2, conn);
                    cmd.Transaction = transaction;
                    cmd.ExecuteNonQuery();

                    transaction.Commit();
                    perId.Text = "";
                    diabox.Visible = false;
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Student ID " + perId + " - All Information are De-Activate." + "');", true);
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
            up_stID.Text = "";
            Up_stName.Text = "";
            up_gender.Text = "";
            up_year.Text = "";
            IMG.ImageUrl = "";
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
                        "mobile = @mob, address = @add, year = @yr where stId = " + Convert.ToInt32(up_stID.Text) + "";
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@nm", Up_stName.Text);
                    cmd.Parameters.AddWithValue("@gen", up_gender.Text);
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