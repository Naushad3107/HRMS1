using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS
{
    public partial class UpdateEmpDetails : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text, email = TextBox2.Text, Role = DropDownList1.SelectedValue, Salary = TextBox3.Text, Pass = TextBox4.Text, status = DropDownList2.SelectedValue , eid=TextBox5.Text , department=TextBox6.Text;

            string q = $"exec UpdateEmp '{eid}','{name}','{email}','{Role}','{Salary}','{Pass}','{department}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int row = cmd.ExecuteNonQuery();
            if (row > 0)
            {
                Response.Write("<script>alert('Employee Updated Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error Updating Employee');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}