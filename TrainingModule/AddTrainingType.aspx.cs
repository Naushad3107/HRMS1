using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.TrainingModule
{
    public partial class AddTrainingType : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            //if (!IsPostBack)
            //{
            //    FetchTrainingTypes();

            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string TrainingType = txttype.Text, TrainingDescription = txtdes.Text, TrainingStatus = trainingstat.SelectedValue;
            string q = $"exec InsertTrainingType '{TrainingType}','{TrainingDescription}','{TrainingStatus}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Training Type Added Successfully!!!')</script>");
            GridView1.Visible = true;


        }
        //public void FetchTrainingTypes()
        //{
        //    string q = "exec FetchTrainingTypes";
        //   SqlDataAdapter ada = new SqlDataAdapter(q, conn);
        //    DataSet ds = new DataSet();
        //    ada.Fill(ds);
        //    GridView1.DataSource = ds;
        //    GridView1.DataBind();
        //}
    }
}