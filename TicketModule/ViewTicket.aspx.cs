using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.TicketModule
{
    public partial class ViewTicket : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)

        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(connStr);
            conn.Open();

            if (!IsPostBack)
            {
                LoadTickets();
            }


        }

        public void LoadTickets()
        {
            string allTickets = "execute ViewTicket";

            SqlDataAdapter da = new SqlDataAdapter(allTickets, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GvLeaveReport.DataSource = dt;
            GvLeaveReport.DataBind();

        }
        protected void GvLeaveReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowComment")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                //int index = int.Parse(e.CommandArgument);
                GridViewRow row = GvLeaveReport.Rows[index];
                Panel pnl = (Panel)row.FindControl("pnlComment");
                if (pnl != null)
                    pnl.Visible = true;
            }

            else if (e.CommandName == "SubmitComment")
            {
                string ticketId = e.CommandArgument.ToString();
                foreach (GridViewRow row in GvLeaveReport.Rows)
                {
                    Panel pnl = (Panel)row.FindControl("pnlComment");
                    if (pnl != null && pnl.Visible)
                    {
                        TextBox txt = (TextBox)row.FindControl("txtComment");
                        string comment = txt.Text;


                        string query = "exec AddComment '{comment}'";

                        SqlCommand cmd = new SqlCommand(query, conn);


                        cmd.Parameters.AddWithValue("@comment", comment);

                        cmd.ExecuteNonQuery();



                        Response.Write("<script>alert('comment submitted sucessfully')</script>");
                        break;



                    }
                }
            }
            else if (e.CommandName == "Delete")
            {
                //Button btn = (Button)e.CommandSource;
                //GridViewRow row = (GridViewRow)btn.NamingContainer;
                //int idx = row.RowIndex;

                //// If you want to delete it from the database, do it here.
                //// For now, just remove from GridView:
                //GvLeaveReport.DeleteRow(idx);
                //LoadTickets();

                //Response.Write("<script>alert('Deleted successfully');</script>");

                int ticketId = Convert.ToInt32(e.CommandArgument);
                //int ticketId = int.Parse(e.CommandArgument.ToString());

                string sql = "DELETE FROM TicketRaise WHERE tId = @tId";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@tId", ticketId);
                    cmd.ExecuteNonQuery();
                }


                LoadTickets();

                Response.Write("<script>alert('Deleted successfully');</script>");
            }
            else
            {
                Response.Write("invalid input");
            }
        }

        protected void GvLeaveReport_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow row = GvLeaveReport.SelectedRow;
            string ticketId = row.Cells[0].Text;
        }
        protected void GvLeaveReport_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Leave empty (or even do cleanup if needed)
        }


    }
}