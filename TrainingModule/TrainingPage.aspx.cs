using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.TrainingModule
{
        public partial class TrainingPage : System.Web.UI.Page
        {
            SqlConnection conn;
            protected void Page_Load(object sender, EventArgs e)
            {
                string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
                conn = new SqlConnection(cs);
                conn.Open();
                if (!IsPostBack)
                {
                    FetchTrainingList();
                }
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                Response.Redirect("AddTrainingType.aspx");
            }
            public void FetchTrainingList()
            {
                string q = "exec FetchTrainingList";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                GridViewRow row = GridView1.Rows[e.RowIndex];

                string type = ((TextBox)row.FindControl("txtType")).Text;
                string desc = ((TextBox)row.FindControl("txtDesc")).Text;
                string trainer = ((TextBox)row.FindControl("txtTrainer")).Text;
                string employee = ((TextBox)row.FindControl("txtEmployee")).Text;
                string cost = ((TextBox)row.FindControl("txtCost")).Text;
                string status = ((TextBox)row.FindControl("txtStatus")).Text;
                string start = ((TextBox)row.FindControl("txtStart")).Text;
                string end = ((TextBox)row.FindControl("txtEnd")).Text;

                string query = $"exec UpdateTrainingList '{id}','{type}','{desc}','{trainer}','{employee}','{cost}','{status}','{start}','{end}'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();

                Response.Redirect("TrainingPage.aspx");
                FetchTrainingList();
            }
            protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                Label l1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
                string id = l1.Text;
                string q = $"exec DeleteTrainingList '{id}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                Response.Redirect("TrainingPage.aspx");

            }

            protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
            {
                GridView1.EditIndex = e.NewEditIndex;
                FetchTrainingList();
            }

            protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                FetchTrainingList();
            }

        }
    }