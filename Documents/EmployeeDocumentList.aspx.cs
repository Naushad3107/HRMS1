using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Documents
{
    public partial class EmployeeDocumentList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                FetchEmployeeDocument();
            }
        }
        public void FetchEmployeeDocument()
        {
            string q = "exec FetchEmployeeDocumentNames";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string EmployeeDocumentName = ((TextBox)row.FindControl("txtdocname")).Text;

            string query = $"exec UpdateEmployeeDocument '{id}','{EmployeeDocumentName}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            Response.Redirect("EmployeeDocumentList.aspx");
            FetchEmployeeDocument();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label l1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            string id = l1.Text;
            string q = $"exec DeleteEmployeeDocument '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("EmployeeDocumentList.aspx");

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FetchEmployeeDocument();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            FetchEmployeeDocument();
        }
    }
}