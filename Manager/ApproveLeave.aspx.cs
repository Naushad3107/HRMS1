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
    public partial class ApproveLeave : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                LoadLeaveRequests();
            }
        }


        public void LoadLeaveRequests()
        {
            string LoadReq = "Exec sp_GetAllLeaveRequests";
            SqlCommand cmd = new SqlCommand(LoadReq, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            gvAllLeaves.DataSource = dt;
            gvAllLeaves.DataBind();

        }

        protected void gvAllLeaves_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ChangeStatus")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int applyId = Convert.ToInt32(gvAllLeaves.DataKeys[rowIndex].Value);
                DropDownList ddl = (DropDownList)gvAllLeaves.Rows[rowIndex].FindControl("ddlStatus");
                string newStatus = ddl.SelectedValue;


                SqlCommand cmd = new SqlCommand("sp_UpdateLeaveStatusAndUsage", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@applyId", applyId);
                cmd.Parameters.AddWithValue("@newStatus", newStatus);
                //conn.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Status changed Successfully')</Script>");


                LoadLeaveRequests();
            }
        }

        protected void gvAllLeaves_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlStatus");
                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                ddl.SelectedValue = status;
            }
        }

    }
}