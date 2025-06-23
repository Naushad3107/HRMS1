using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HRMS.TrainingModule
{
    public partial class AddTrainer : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            GetRole();
           // FetchTrainer();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string FirstName, LastName, PhoneNo, TrainerRole, Email, TrainerDescription, TrainerStat,TrainerImage;
            int RoleId;
            FirstName = txtfirst.Text;
            LastName = txtlast.Text;
            PhoneNo = txtphone.Text;
            Email = txtemail.Text;
            TrainerDescription = txtdes.Text;
            TrainerRole = trainerrole.SelectedItem.Text;
            RoleId = int.Parse(trainerrole.SelectedValue);
            TrainerStat = trainerstat.SelectedValue;
            trainerimage.SaveAs(Server.MapPath("~/TrainerImage/") + Path.GetFileName(trainerimage.FileName));
            TrainerImage = "trainerimage/" + Path.GetFileName(trainerimage.FileName);

            string q = $"exec InsertTrainer '{FirstName}','{LastName}','{PhoneNo}','{TrainerRole}','{RoleId}','{Email}','{TrainerDescription}','{TrainerStat}','{TrainerImage}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Trainer Added Successfully!!!')</script>");
            Response.Redirect("AddTrainer.aspx");
        }
        public void GetRole()
        {
            string q = "exec GetRole";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            trainerrole.DataSource = dr;
            trainerrole.DataTextField = "eRole";
            trainerrole.DataValueField = "eid";
            trainerrole.DataBind();
        }
        public void FetchTrainer()
        {
            string q = "exec FetchTrainer";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}