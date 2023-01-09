using Newtonsoft.Json;
using System;
using System.Data;
using System.Drawing.Drawing2D;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Web.UI.WebControls;

namespace AHR_School_And_College
{
    public partial class Faculties : System.Web.UI.Page
    {
        //ClientScript.RegisterStartupScript(this.GetType(), "myalert","alert('Hi!');", true);
        private static employee_Table employee_Table = new employee_Table();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //employee_Data = new DataTable();
                string url = "http://localhost:4000/api/employee";
                this.Get_Faculties(sender, e, facultiesTeacher, url);
            }

        }

        protected void Get_Faculties(object sender, EventArgs e, Repeater facultiesTeacher, string url)
        {
            facultiesTeacher.DataSource = null;
            facultiesTeacher.DataBind();
            employee_Data = new DataTable();

            employee_Table.create_table_column(employee_Data);
            employee_Table.create_table();



            using (var clinent = new HttpClient())
            {
                try
                {
                    pnl_faculties_container2.Visible = false;
                    pnl_Faculties_container1.Visible = true;
                    var endPoint = new Uri(url);

                    var result = clinent.GetAsync(endPoint).Result.Content.ReadAsStringAsync().Result;
                    DataTable dt = (DataTable)JsonConvert.DeserializeObject(result, typeof(DataTable));

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row.Field<string>(11) != "Others")
                        {
                            employee_Table.addData_in_Table((DataRow)row);
                            employee_Table.addData((DataRow)row, employee_Data);
                        }
                    }


                    _ = (dt.Rows.Count > 0) ? pnl_Faculties.Visible = false : pnl_Faculties.Visible = true;

                    //facultiesTeacher.DataSource = employee_Table.getTableData();
                    facultiesTeacher.DataSource = employee_Data;
                    facultiesTeacher.DataBind();

                }
                catch (Exception ex)
                {
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", script: "alert('" + ex.Message + "');", true);
                    if (ex.Message == ex.Message)
                    {
                        pnl_Faculties_container1.Visible = false;
                        pnl_faculties_container2.Visible = true;

                    }
                }

            }
        }

        protected void Get_Science_Emp(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/employee/teachers/Science";
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + url + "');", true);
            this.Get_Faculties(sender, e, facultiesTeacher, url);
        }



        protected void Get_Humanities_Emp(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/employee/teachers/Humanities";
            this.Get_Faculties(sender, e, facultiesTeacher, url);
        }



        protected void Get_Commerce_Emp(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/employee/teachers/Commerce";
            this.Get_Faculties(sender, e, facultiesTeacher, url);
        }
        protected void Get_General_Emp(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/employee/teachers/General";
            this.Get_Faculties(sender, e, facultiesTeacher, url);
        }

        protected void Get_All_Employee(object sender, EventArgs e)
        {
            string url = "http://localhost:4000/api/employee";
            this.Get_Faculties(sender, e, facultiesTeacher, url);
        }




        DataTable employee_Data = new DataTable();

    }
}