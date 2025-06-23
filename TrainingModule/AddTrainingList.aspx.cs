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
    public partial class AddTrainingList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                GetTrainerName();
                GetTrainingType();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Employee, TrainingDescription, TrainingStatus, StartDate, EndDate, TrainerName, TrainingType;
            int TraningCost, TrainerId;
            Employee = TextBox1.Text;
            TraningCost = int.Parse(txtcost.Text);
            TrainingDescription = txtdes.Text;
            TrainingStatus = Trainingstat.Text;
            StartDate = txtstartdate.Text;
            EndDate = txtenddate.Text;
            TrainerName = trainernames.SelectedItem.Text;
            TrainerId = int.Parse(trainernames.SelectedValue);
            TrainingType = trainingtypes.SelectedItem.Text;
            string q = $"exec InsertTrainingList '{TrainerName}','{TrainingType}','{Employee}','{TraningCost}','{TrainingDescription}','{TrainingStatus}','{StartDate}','{EndDate}','{TrainerId}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Training Added Successfully!!!')</script>");

        }
        public void GetTrainingType()
        {
            string q = "exec GetTrainingType";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            trainingtypes.DataSource = dr;
            trainingtypes.DataTextField = "TrainingType";
            trainingtypes.DataValueField = "TrainingTypeId";
            trainingtypes.DataBind();
        }
        public void GetTrainerName()
        {
            string q = "exec GetTrainerName";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            trainernames.DataSource = dr;
            trainernames.DataTextField = "FirstName";
            trainernames.DataValueField = "TrainerId";
            trainernames.DataBind();
        }

    }
}