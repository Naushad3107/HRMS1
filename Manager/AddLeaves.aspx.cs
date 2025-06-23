using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Manager
{
    public partial class AddLeaves : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void btnAddLeave_Click(object sender, EventArgs e)
        {
            string leaveType = txtLeaveType.Text.Trim();
            int maxDays;

            if (string.IsNullOrEmpty(leaveType) || !int.TryParse(txtMaxDays.Text, out maxDays))
            {
                lblMessage.Text = "Please enter valid leave type and number of days.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            SqlCommand cmd = new SqlCommand("sp_AddLeaveType", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@leaveType", leaveType);
            cmd.Parameters.AddWithValue("@maxDays", maxDays);


            cmd.ExecuteNonQuery();



            Response.Write("<Script>alert('Leave Added successfully')</Script>");
        }
    }
}
