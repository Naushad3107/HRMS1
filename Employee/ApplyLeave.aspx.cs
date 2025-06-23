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
    public partial class ApplyLeave : System.Web.UI.Page
    {
        SqlConnection conn;

        List<DateTime> holidayDates = new List<DateTime>();
        Dictionary<DateTime, string> holidayMap = new Dictionary<DateTime, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                LoadHolidays();
                LoadLeaveTypes();
                LoadLeaveBalance();

            }
        }


        public void LoadLeaveBalance()
        {
            string email = Session["User"]?.ToString();
            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            int empId = GetEmployeeIdByEmail(email);

            SqlCommand cmd = new SqlCommand("sp_GetLeaveBalanceOfEmployee", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empId", empId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvLeaveBalance.DataSource = dt;
            gvLeaveBalance.DataBind();

        }


        public void LoadLeaveTypes()
        {
            string livTypes = "Exec sp_GetLeaveTypes";
            SqlCommand cmd = new SqlCommand(livTypes, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            ddlLeaveType.DataSource = rdr;
            ddlLeaveType.DataTextField = "leaveType";
            ddlLeaveType.DataValueField = "leaveType";
            ddlLeaveType.DataBind();
            ddlLeaveType.Items.Insert(0, new ListItem("-- Select Leave Type --", ""));

        }

        public void LoadHolidays()
        {

            string getHoli = $"exec sp_GetActiveHolidays";
            SqlCommand cmd = new SqlCommand(getHoli, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                DateTime hDate = Convert.ToDateTime(rdr["holidayDate"]);
                string hName = rdr["holidayName"].ToString();

                holidayDates.Add(hDate);
                if (!holidayMap.ContainsKey(hDate))
                    holidayMap[hDate] = hName;
            }


        }


        public int GetMaxDaysAllowed(string leaveType)
        {
            int max = 0;

            SqlCommand cmd = new SqlCommand("sp_GetMaxDaysForLeaveType", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@leaveType", leaveType);

            //conn.Open();
            object result = cmd.ExecuteScalar();
            //conn.Close();

            if (result != null)
                max = Convert.ToInt32(result);

            return max;
        }


        public int GetEmployeeIdByEmail(string email)
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

        protected void btnApply_Click1(object sender, EventArgs e)
        {
            if (ddlLeaveType.SelectedIndex == 0)
            {
                lblStatus.Text = "Please select a leave type.";
                return;
            }

            DateTime fromDate, toDate;
            if (!DateTime.TryParse(txtFromDate.Text, out fromDate) || !DateTime.TryParse(txtToDate.Text, out toDate))
            {
                lblStatus.Text = "Invalid dates selected.";
                return;
            }

            if (fromDate > toDate)
            {
                lblStatus.Text = "From date cannot be after To date.";
                return;
            }

            int empId = GetEmployeeIdByEmail(Session["User"].ToString());
            int daysRequested = CountWeekdaysExcludingSundays(fromDate, toDate);
            int maxAllowed = GetMaxDaysAllowed(ddlLeaveType.SelectedValue);

            if (daysRequested > maxAllowed)
            {
                lblStatus.Text = $"You can only apply for {maxAllowed} days for {ddlLeaveType.SelectedValue}. You selected {daysRequested}.";
                return;
            }


            SqlCommand cmd = new SqlCommand("sp_ApplyLeaveWithDates", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empId", empId);
            cmd.Parameters.AddWithValue("@leaveType", ddlLeaveType.SelectedValue);
            cmd.Parameters.AddWithValue("@fromDate", fromDate);
            cmd.Parameters.AddWithValue("@toDate", toDate);
            cmd.Parameters.AddWithValue("@daysRequested", daysRequested);
            cmd.Parameters.AddWithValue("@reason", txtReason.Text.Trim());


            cmd.ExecuteNonQuery();
            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblStatus.Text = "Leave request submitted successfully.";

        }

        public int CountWeekdaysExcludingSundays(DateTime from, DateTime to)
        {
            int count = 0;
            for (DateTime date = from; date <= to; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Sunday)
                    count++;
            }
            return count;
        }

        protected void Calendar1_DayRender1(object sender, DayRenderEventArgs e)
        {
            if (holidayDates.Contains(e.Day.Date))
            {
                e.Cell.BackColor = System.Drawing.Color.LightPink;
                e.Cell.ForeColor = System.Drawing.Color.DarkRed;
                e.Cell.Font.Bold = true;

                string holidayName = holidayMap[e.Day.Date];
                e.Cell.Controls.Add(new LiteralControl($"<br/><span style='font-size:10px'>{holidayName}</span>"));
            }
        }
    }
}