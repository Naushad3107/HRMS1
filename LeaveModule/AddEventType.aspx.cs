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
    public partial class AddEventType : System.Web.UI.Page
    {
        SqlConnection conn;
        Dictionary<DateTime, (string, string)> eventMap = new Dictionary<DateTime, (string, string)>();
        DataTable eventData = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                LoadEventTypes();
                LoadEventCalendarData();
            }

        }

        public void LoadEventTypes()
        {
            SqlCommand cmd = new SqlCommand("sp_GetEventTypes", conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            ddlEventType.DataSource = rdr;
            ddlEventType.DataTextField = "eventTypeName";
            ddlEventType.DataValueField = "eventTypeId";
            ddlEventType.DataBind();
            rdr.Close();
        }


        public void LoadEventCalendarData()
        {
            SqlCommand cmd = new SqlCommand("sp_GetActiveEventCalendar", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            eventData.Clear();
            da.Fill(eventData);
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            foreach (DataRow row in eventData.Rows)
            {
                DateTime evDate = Convert.ToDateTime(row["eventDate"]);
                if (e.Day.Date == evDate.Date)
                {
                    e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml(row["eventColor"].ToString());
                    e.Cell.Controls.Add(new Literal { Text = "<br/>" + row["eventName"].ToString() });
                }
            }
        }

        protected void btnAddEventType_Click(object sender, EventArgs e)
        {
            int typeId = int.Parse(ddlEventType.SelectedValue);
            string name = txtEventName.Text;
            string date = txtEventDate.Text;
            string status = ddlStatus.SelectedValue;

            SqlCommand cmd = new SqlCommand("sp_AddEventType", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@eventTypeId", typeId);
            cmd.Parameters.AddWithValue("@eventName", name);
            cmd.Parameters.AddWithValue("@eventDate", date);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.ExecuteNonQuery();
            Response.Write("<Script>alert('Event Type Added Successfully')</Script>");

            LoadEventCalendarData();
        }


    }
}