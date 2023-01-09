using System;
using System.Data;

namespace AHR_School_And_College
{
    public class employee_Table
    {
        DataTable dt;

        protected DataTable myTable
        {
            get { return dt; }
            set { dt = value; }
        }

        public void create_table()
        {
            dt = new DataTable();
            dt.TableName = "Employee's Information";

            dt.Columns.Add("empId");
            dt.Columns.Add("empName");
            dt.Columns.Add("dob");
            dt.Columns.Add("gender");
            dt.Columns.Add("religion");
            dt.Columns.Add("marritalStatus");
            dt.Columns.Add("mobile");
            dt.Columns.Add("email");
            dt.Columns.Add("presentAddress");
            dt.Columns.Add("permanentAddress");
            dt.Columns.Add("department");
            dt.Columns.Add("jobType");
            dt.Columns.Add("subOfLecturer");
            dt.Columns.Add("monthlySalary");
            dt.Columns.Add("image");
            dt.Columns.Add("joiningDate");
            dt.Columns.Add("status");
            

        }

        public void create_table_column(DataTable dt1)
        {
            dt1.TableName = "Employee's Information";

            dt1.Columns.Add("empId");
            dt1.Columns.Add("empName");
            dt1.Columns.Add("dob");
            dt1.Columns.Add("gender");
            dt1.Columns.Add("religion");
            dt1.Columns.Add("marritalStatus");
            dt1.Columns.Add("mobile");
            dt1.Columns.Add("email");
            dt1.Columns.Add("presentAddress");
            dt1.Columns.Add("permanentAddress");
            dt1.Columns.Add("department");
            dt1.Columns.Add("jobType");
            dt1.Columns.Add("subOfLecturer");
            dt1.Columns.Add("monthlySalary");
            dt1.Columns.Add("image");
            dt1.Columns.Add("joiningDate");
            dt1.Columns.Add("status");
            

        }

        public void addData_in_Table(DataRow row)
        {
            DataRow dataRow = myTable.NewRow();
            dataRow["empId"] = row["empId"];
            dataRow["empName"] = row["empName"];
            dataRow["dob"] = row["dob"];
            dataRow["gender"] = row["gender"];
            dataRow["religion"] = row["religion"];
            dataRow["marritalStatus"] = row["marritalStatus"];
            dataRow["mobile"] = row["mobile"];
            dataRow["email"] = row["email"];
            dataRow["presentAddress"] = row["presentAddress"];
            dataRow["permanentAddress"] = row["permanentAddress"];
            dataRow["department"] = row["department"];
            dataRow["jobType"] = row["jobType"];
            dataRow["subOfLecturer"] = row["subOfLecturer"];
            dataRow["monthlySalary"] = row["monthlySalary"];
            dataRow["image"] = row["image"];
            dataRow["joiningDate"] = row["joiningDate"];
            dataRow["status"] = row["status"];
            dt.Rows.Add(dataRow);
        }

        public void addData(DataRow row, DataTable dt1)
        {
            DataRow dataRow = dt1.NewRow();
            dataRow["empId"] = row["empId"];
            dataRow["empName"] = row["empName"];
            dataRow["dob"] = row["dob"];
            dataRow["gender"] = row["gender"];
            dataRow["religion"] = row["religion"];
            dataRow["marritalStatus"] = row["marritalStatus"];
            dataRow["mobile"] = row["mobile"];
            dataRow["email"] = row["email"];
            dataRow["presentAddress"] = row["presentAddress"];
            dataRow["permanentAddress"] = row["permanentAddress"];
            dataRow["department"] = row["department"];
            dataRow["jobType"] = row["jobType"];
            dataRow["subOfLecturer"] = row["subOfLecturer"];
            dataRow["monthlySalary"] = row["monthlySalary"];
            dataRow["image"] = row["image"];
            dataRow["joiningDate"] = row["joiningDate"];
            dataRow["status"] = row["status"];
            dt1.Rows.Add(dataRow);
        }

        public void setRowData(DataRow row)
        {
            addData_in_Table((DataRow)row);
        }

        public DataTable getTableData()
        {
            return dt;
        }

    }
}