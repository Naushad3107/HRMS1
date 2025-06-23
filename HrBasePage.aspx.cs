using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS
{
    public partial class HrBasePage : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();


            if (!IsPostBack)
            {
                GenderDistribution();
                EmployeeStatus();
                ShowTotalEmployees();
                BindChart();
                AverageSalaryByDept();

            }
        }
        public void BindChart()
        {
            string query = "exec FetchEmpByDept";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Chart1.DataSource = dt;
            Chart1.DataBind();
        }
        public void ShowTotalEmployees()
        {
            string query = "exec FetchTotalEmp";
            SqlCommand cmd = new SqlCommand(query, conn);
            int count = (int)cmd.ExecuteScalar();
            lblTotalEmployees.Text = count.ToString();
        }
        public void EmployeeStatus()
        {
            string query = "exec FetchEmpStatus";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            PieChartStatus.DataSource = dt;
            PieChartStatus.DataBind();
        }
        public void GenderDistribution()
        {
            string query = "exec FetchEmpGender";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            PieChartGender.DataSource = dt;
            PieChartGender.DataBind();
        }
        public void AverageSalaryByDept()
        {
            string query = "exec FetchAvgSalaryByDept";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ChartAvgSalary.Series[0].XValueMember = "eDepartment";
            ChartAvgSalary.Series[0].YValueMembers = "AverageSalary";
            ChartAvgSalary.DataSource = dt;
            ChartAvgSalary.DataBind();
        }
    }
}
