using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.LeaveModule
{
    public partial class AddEvent : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

        }

        protected void btnAddEventType_Click(object sender, EventArgs e)
        {
            string type = txtEventType.Text.Trim();
            string color = txtColor.Text.Trim();

            SqlCommand cmd = new SqlCommand("sp_AddEvent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@eventTypeName", type);
            cmd.Parameters.AddWithValue("@eventColor", color);
            cmd.ExecuteNonQuery();
            Response.Write("<Script>alert('Event Added Successfully')</Script>");
        }
    }
}