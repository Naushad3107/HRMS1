using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Employee
{
        public partial class LeaveHistory : System.Web.UI.Page
        {
            SqlConnection conn;
            protected void Page_Load(object sender, EventArgs e)
            {
                string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
                conn = new SqlConnection(cnf);
                conn.Open();

                if (!IsPostBack)
                {
                    LoadLeaveHistory();
                }
            }

            public void LoadLeaveHistory()
            {
                string email = Session["User"]?.ToString();
                if (string.IsNullOrEmpty(email))
                {
                    Response.Redirect("LoginPage.aspx");
                    return;
                }

                int empId = GetEmployeeId(email);


                SqlCommand cmd = new SqlCommand("sp_GetLeaveHistoryByEmp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empId", empId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvLeaveHistory.DataSource = dt;
                gvLeaveHistory.DataBind();

            }

            public int GetEmployeeId(string email)
            {
                int empId = 0;

                SqlCommand cmd = new SqlCommand("sp_GetEmpIdByEmail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eEmail", email);

                object result = cmd.ExecuteScalar();
                if (result != null)
                    empId = Convert.ToInt32(result);

                return empId;
            }

        }
    }