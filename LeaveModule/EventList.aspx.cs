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
    public partial class EventList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                LoadEventList();
            }

        }

        public void LoadEventList()
        {
            SqlCommand cmd = new SqlCommand("sp_GetAllEvents", conn);
            gvEventList.DataSource = cmd.ExecuteReader();
            gvEventList.DataBind();
        }

        protected void gvEventList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEventList.EditIndex = e.NewEditIndex;
            LoadEventList();
        }

        protected void gvEventList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEventList.EditIndex = -1;
            LoadEventList();
        }


        protected void gvEventList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvEventList.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)gvEventList.Rows[e.RowIndex].FindControl("txtEventName")).Text;
            string date = ((TextBox)gvEventList.Rows[e.RowIndex].FindControl("txtEventDate")).Text;
            string status = ((DropDownList)gvEventList.Rows[e.RowIndex].FindControl("ddlStatus")).SelectedValue;

            SqlCommand cmd = new SqlCommand("sp_UpdateEvent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@eventId", id);
            cmd.Parameters.AddWithValue("@eventName", name);
            cmd.Parameters.AddWithValue("@eventDate", date);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.ExecuteNonQuery();

            gvEventList.EditIndex = -1;
            Response.Write("<Script>alert('Event Updated')</Script>");
            LoadEventList();
        }


        protected void gvEventList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventId = Convert.ToInt32(gvEventList.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("sp_DeleteEvent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@eventId", eventId);
            cmd.ExecuteNonQuery();
            Response.Write("<Script>alert('Event Deleted')</Script>");
            LoadEventList();
        }

    }
}