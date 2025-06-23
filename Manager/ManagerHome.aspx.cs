using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Manager
{
    public partial class ManagerHome : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                LoadLeaveSummary();
            }
        }
        private void LoadLeaveSummary()
        {
            SqlCommand cmd = new SqlCommand("sp_GetLeaveSummary", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                lblTotal.Text = rdr["TotalRequests"].ToString();
                lblApproved.Text = rdr["Approved"].ToString();
                lblPending.Text = rdr["Pending"].ToString();
                lblRejected.Text = rdr["Rejected"].ToString();
            }
            rdr.Close();
        }
    }
}