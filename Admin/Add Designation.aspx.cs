using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Admin
{
    public partial class Add_Designation : System.Web.UI.Page
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
            //String Department = DropDownList1.SelectedValue;
            String Designation = TextBox1.Text;
            string status = DropDownList2.SelectedValue;

            string q = "Exec AddEmpDesignation '" + Designation + "' , '"+ status +"' ";
            SqlCommand cmd = new SqlCommand(q, conn);
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Designation Added successfully')</Script>");
            }
            catch (Exception ex)
            {
                Response.Write("<Script>alert('Error: " + ex.Message + "')</Script>");
            }
        }
    }
}