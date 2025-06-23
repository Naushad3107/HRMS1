using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Admin
{
    public partial class AddHolidays : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

        }

        protected void btnAddHoliday_Click(object sender, EventArgs e)
        {
            string name = txtHolidayName.Text;
            string dateStr = txtHolidayDate.Text;
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(dateStr))
            {
                lblMessage.Text = "Please enter all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string holiday = $"Exec sp_AddHoliday '{name}', '{dateStr}', '{status}'";
            SqlCommand cmd = new SqlCommand(holiday, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<Script>alert('Holiday Added successfully')</Script>");

        }

    }
}