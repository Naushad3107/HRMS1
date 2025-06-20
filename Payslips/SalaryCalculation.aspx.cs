using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Payslips
{
    public partial class SalaryCalculation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {

                GetDepartment();

            }
        }
        public void GetDepartment()
        {
            string q = "exec GetDepartment";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList1.DataSource = dr;
            DropDownList1.DataTextField = "eDepartment";
            DropDownList1.DataValueField = "eDepartment";
            DropDownList1.DataBind();
            dr.Close();
        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            int basicSalary = int.Parse(TextBox1.Text);

            decimal totalEarnings = 0;
            decimal totalDeductions = 0;

            DataTable dt = new DataTable();
            dt.Columns.Add("EarningType");
            dt.Columns.Add("Amount");
            phEarnings.Controls.Add(new Literal { Text = "<h3>Earnings</h3>" });
            string query = "SELECT EarningType, EarningPercentage FROM Earnings";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string type = reader["EarningType"].ToString();
                int percentage = Convert.ToInt32(reader["EarningPercentage"]);
                decimal amount = (basicSalary * percentage) / 100;
                totalEarnings += amount;

                Label lbl = new Label();
                lbl.Text = type + ": ";

                TextBox txt = new TextBox();
                txt.Text = amount.ToString("0.00");
                txt.ReadOnly = true;
                phEarnings.Controls.Add(lbl);
                phEarnings.Controls.Add(txt);
                phEarnings.Controls.Add(new Literal { Text = "<br />" });
            }
            reader.Close();


            DataTable dtDeductions = new DataTable();
            dtDeductions.Columns.Add("DeductionType");
            dtDeductions.Columns.Add("Amount");

            string query1 = "SELECT DeductType, DeductionPercentage FROM Deductions";
            SqlCommand cmd1 = new SqlCommand(query1, conn);
            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                string type = reader1["DeductType"].ToString();
                int percentage = Convert.ToInt32(reader1["DeductionPercentage"]);
                decimal amount = (basicSalary * percentage) / 100;
                totalDeductions += amount;

                Label lbl = new Label();
                lbl.Text = type + ": ";

                TextBox txt = new TextBox();
                txt.Text = amount.ToString("0.00");
                txt.ReadOnly = true;
                phDeductions.Controls.Add(new Literal { Text = "<h3>Deductions</h3>" });
                phDeductions.Controls.Add(lbl);
                phDeductions.Controls.Add(txt);
                phDeductions.Controls.Add(new Literal { Text = "<br />" });
            }
            reader1.Close();
            decimal NetSalary = basicSalary - totalDeductions;
            string empName = DropDownList2.SelectedItem.Text;
            string dept = DropDownList1.SelectedItem.Text;
            string query3 = $"exec InsertEmpSalDetails '{empName}','{dept}',{basicSalary},{totalEarnings},{totalDeductions},{NetSalary}";
            SqlCommand insertCmd = new SqlCommand(query3, conn);
            insertCmd.ExecuteNonQuery();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedDept = DropDownList1.SelectedValue;
            string q = $"exec GetEmpByDept '{selectedDept}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList2.DataSource = dr;
            DropDownList2.DataTextField = "eName";
            DropDownList2.DataValueField = "eName";
            DropDownList2.DataBind();
            dr.Close();
        }
    }
}