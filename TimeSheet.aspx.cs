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
    public partial class TimeSheet : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();


            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }



        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            txtCheckIn.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            txtCheckOut.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            string empName = txtEmployeeName.Text;
            string edept = DropDownList1.SelectedValue;
            DateTime date = DateTime.Parse(txtDate.Text);
            DateTime checkIn = DateTime.Parse(txtCheckIn.Text);
            DateTime checkOut = DateTime.Parse(txtCheckOut.Text);
            //TimeSpan checkInTime = TimeSpan.Parse(txtCheckIn.Text);
            //TimeSpan checkOutTime = TimeSpan.Parse(txtCheckOut.Text);
            //TimeSpan totalHours = checkOut - checkIn;
            TimeSpan totalHours = checkOut - checkIn;
            string stat = "pending";


            string query = $"exec SaveTimeSheet '{empName}' , '{edept}' , '{date}' ,'{checkIn}','{checkOut}','{totalHours}','{stat}' ";
            SqlCommand cmd = new SqlCommand(query, conn);
            int row = cmd.ExecuteNonQuery();


            if (row > 0)
            {

                Response.Write("<script>alert('Time Sheet Submitted Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error in Submitting Time Sheet');</script>");
            }
        }

       
    }
}