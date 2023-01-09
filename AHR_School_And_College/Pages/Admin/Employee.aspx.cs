using AHR_School_And_College.StringEncoding;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AHR_School_And_College.Method;

namespace AHR_School_And_College
{
    public partial class Employee : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection(@"Data Source=MSI\SQLEXPRESS02;Initial Catalog=ahrDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                get_Employee_Information();
            }
        }


        protected void search_stId_TextChanged(object sender, EventArgs e)
        {
            get_Employee_Information();
        }

        protected void tData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int pID = Convert.ToInt32(tEmpData.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                string qry = "select * from emp_info where empId = " + pID + "";
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    conn.Open();
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            empId.Text = rd["empId"].ToString();
                            empName.Text = rd["empName"].ToString().Trim();
                            dob.Text = rd["dob"].ToString().Trim();
                            gender.Text = rd["gender"].ToString().Trim();
                            religion.SelectedValue = rd["religion"].ToString().Trim();
                            mobile.Text = rd["mobile"].ToString().Trim();
                            email.Text = rd["email"].ToString().Trim();
                            subOfLecturer.Text = rd["subject"].ToString().Trim();
                            monthlySalary.Text = rd["salary"].ToString().Trim();
                            presentAddress.Text = rd["address"].ToString().Trim();
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
            int pID = Convert.ToInt32(tEmpData.DataKeys[e.RowIndex].Value.ToString());
            perId.Text = pID.ToString();
            diabox.Visible = true;
        }

        protected void cancel_Click(object sender, ImageClickEventArgs e)
        {
            clean_field();
        }

        protected void Cancel_Information_Click(object sender, EventArgs e)
        {
            clean_field();
        }

        protected void up_Student_Informaion_Click(object sender, EventArgs e)
        {
            string qry = "update emp_info set empName=@name, dob=@dob, gender=@gen, religion=@rel, " +
                "mobile=@mob, email=@em, subject=@sub, address=@add, salary=@sal where empId = " + Convert.ToInt32(empId.Text) + "";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", empName.Text);
                    cmd.Parameters.AddWithValue("@dob", dob.Text);
                    cmd.Parameters.AddWithValue("@gen", gender.Text);
                    cmd.Parameters.AddWithValue("@rel", religion.SelectedValue);
                    cmd.Parameters.AddWithValue("@mob", mobile.Text);
                    cmd.Parameters.AddWithValue("@em", email.Text);
                    cmd.Parameters.AddWithValue("@sub", subOfLecturer.Text);
                    cmd.Parameters.AddWithValue("@add", presentAddress.Text);
                    cmd.Parameters.AddWithValue("@sal", Convert.ToInt32(monthlySalary.Text));
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Record Update Successfully." + "');", true);
                        get_Employee_Information();
                        clean_field();

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Record not Update..!" + "');", true);
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                }
                finally { conn.Close(); }

            }
        }

        protected void cnl_Click(object sender, EventArgs e)
        {
            diabox.Visible = false;
            perId.Text = "";
        }

        protected void okay_Click(object sender, EventArgs e)
        {
            string qry = "update emp_info set status = 'De-Active' where empId = " + Convert.ToInt32(perId.Text) + "";

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(qry, conn);

                    conn.Close();
                    conn.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        get_Employee_Information();
                        perId.Text = "";
                        diabox.Visible = false;
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Record De-Active Successfully." + "');", true);
                        get_Employee_Information();
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

        protected void Desc_Click(object sender, ImageClickEventArgs e)
        {
            Desc.Visible = false;
            Asc.Visible = true;
            get_Employee_Information();
        }

        protected void Asc_Click(object sender, ImageClickEventArgs e)
        {
            Asc.Visible = false;
            Desc.Visible = true;
            get_Employee_Information();
        }

        protected void get_Employee_Information()
        {
            string qry = "select * from emp_info where status = 'Active'";
            if (!search_stId.Text.Equals(""))
            {
                qry += " and empId = " + Convert.ToInt32(search_stId.Text);
            }

            if (Desc.Visible == true)
            {
                qry += " order by empId desc";
            }
            else
            {
                qry += " order by empId asc";
            }
            

            using (SqlConnection conn = new SqlConnection(new sqlServer().LINK))
            {
                try
                {
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
                                tEmpData.DataSource = dt;
                                tEmpData.DataBind();
                            }
                            else
                            {
                                dt.Rows.Add(dt.NewRow());
                                tEmpData.DataSource = dt;
                                tEmpData.DataBind();
                                tEmpData.Rows[0].Cells.Clear();
                                tEmpData.Rows[0].Cells.Add(new TableCell());
                                tEmpData.Rows[0].Cells[0].ColumnSpan = tEmpData.Columns.Count;
                                tEmpData.Rows[0].Cells[0].Text = "No Data Found";
                                tEmpData.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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

        void clean_field()
        {
            empId.Text = "";
            empName.Text = "";
            dob.Text = "";
            gender.Text = "";
            religion.SelectedIndex = 0;
            mobile.Text = "";
            email.Text = "";
            subOfLecturer.Text = "";
            monthlySalary.Text = "";
            presentAddress.Text = "";
            editPnl.Visible = false;
        }
    }
}