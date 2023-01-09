using System.Data.SqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AHR_School_And_College.Method;
using Castle.Components.DictionaryAdapter.Xml;

namespace AHR_School_And_College
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(new sqlServer().LINK);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                allstudent();
                allboy();
                allgirl();
                get_student_Information();

            }
        }

        protected void get_student_Information()
        {
            string qry = "select * from st_info where year = "+DateTime.Now.Year+" order by stId desc";
            SqlCommand cmd = new SqlCommand(qry, conn);
            conn.Close();
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

        void allstudent()
        {
            string qry = "select count(stId) from admission where year = " + DateTime.Now.Year + " ";
            SqlCommand cmd = new SqlCommand(qry, conn);
            conn.Close();
            conn.Open();
            object obj = cmd.ExecuteScalar();
            all.Text= obj.ToString();
            conn.Close();
        }
        
        void allboy()
        {
            string qry = "select count(stId) from admission where year = " + DateTime.Now.Year + " and gender = 'Male' ";
            SqlCommand cmd = new SqlCommand(qry, conn);
            conn.Close();
            conn.Open();
            object obj = cmd.ExecuteScalar();
            boy.Text= obj.ToString();
            conn.Close();
        }
        void allgirl()
        {
            string qry = "select count(stId) from admission where year = " + DateTime.Now.Year + " and gender = 'Female' ";
            SqlCommand cmd = new SqlCommand(qry, conn);
            conn.Close();
            conn.Open();
            object obj = cmd.ExecuteScalar();
            girl.Text= obj.ToString();
            conn.Close();
        }
    }
}