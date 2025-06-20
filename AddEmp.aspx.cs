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
    public partial class WebForm2 : System.Web.UI.Page
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
            string name = TextBox1.Text, email = TextBox2.Text, Role = DropDownList1.SelectedValue, Salary = TextBox3.Text, Pass = TextBox4.Text, pan = TextBox5.Text, year = TextBox6.Text, department = TextBox7.Text, designation = TextBox8.Text, phone = TextBox9.Text, status=DropDownList2.SelectedValue ,gender = DropDownList3.SelectedValue ;


            string q = $"exec  SaveEmpDetails '{name}','{email}','{Role}','{Salary}','{Pass}','{pan}','{year}','{department}','{designation}','{phone}','{gender}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int row = cmd.ExecuteNonQuery();
            if (row > 0)
            {
                Response.Write("<script>alert('Employee Added Successfully');</script>");
                
            }
            else
            {
                Response.Write("<script>alert('Error Adding Employee');</script>");
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}