using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            ActiveEmp();
            InactiveEmp();
            InactiveDept();
            ActiveDept();
            AverageSalary();
            HighestSalary();
        }

        public void ActiveEmp() {
            int ActiveEmp;
            string q = "Select Count(*) from Emp_Data where estatus = 'Active'";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ActiveEmp = reader.GetInt32(0);
                    litActiveEmp.Text = ActiveEmp.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }

        public void InactiveEmp()
        {
            int InactiveEmp;
            string q = "Select Count(*) from Emp_Data where estatus = 'Inactive'";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    InactiveEmp = reader.GetInt32(0);
                    litInactiveEmp.Text = InactiveEmp.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }

        public void InactiveDept()
        {
            int InactiveDept;
            string q = "Select Count(*) from DepartmentStatus where Dstat = 'Inactive'";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    InactiveDept = reader.GetInt32(0);
                    Literal3.Text = InactiveDept.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }


        public void ActiveDept()
        {
            int ActiveDept;
            string q = "Select Count(*) from DepartmentStatus where Dstat = 'Active'";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ActiveDept = reader.GetInt32(0);
                    Literal4.Text = ActiveDept.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }


        public void AverageSalary()
        {
            
            string q = "Select AVG(eSalary) from Emp_Data as AverageSalary";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    double AverageSalary = Convert.ToDouble(reader[0]);
                    Literal5.Text = AverageSalary.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }

        public void HighestSalary()
        {

            string q = "Select MAX(eSalary) from Emp_Data where estatus ='active'";
            SqlCommand cmd = new SqlCommand(q, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    double HighestSalary = Convert.ToDouble(reader[0]);
                    Literal6.Text = HighestSalary.ToString();
                    // or Convert.ToInt32(reader[0])
                }
            }
        }
    }
}