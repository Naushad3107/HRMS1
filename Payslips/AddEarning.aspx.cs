using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Payslips
{
    public partial class AddEarning : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {

                GetEarningType();
                GetDepartment();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string EarningType, Department, Designation;
            int EarningPercentage;
            EarningType = DropDownList1.SelectedItem.Text;
            Department = DropDownList2.SelectedValue;
            Designation = DropDownList3.SelectedValue;
            EarningPercentage = int.Parse(TextBox1.Text);
            string q = $"exec InsertEarnings '{EarningType}','{EarningPercentage}','{Department}','{Designation}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }
        public void GetEarningType()
        {
            string q = "exec GetEarningType";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList1.DataSource = dr;
            DropDownList1.DataTextField = "EarningType";
            DropDownList1.DataValueField = "EarnTypeId";
            DropDownList1.DataBind();
        }
        public void GetDepartment()
        {
            string q = "exec GetDepartment";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList2.DataSource = dr;
            DropDownList2.DataTextField = "eDepartment";
            DropDownList2.DataValueField = "eDepartment";
            DropDownList2.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedDept = DropDownList2.SelectedValue;
            string q = $"exec GetDesignation '{selectedDept}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList3.DataSource = dr;
            DropDownList3.DataTextField = "eDesignation";
            DropDownList3.DataValueField = "eDesignation";
            DropDownList3.DataBind();
        }
    }
}