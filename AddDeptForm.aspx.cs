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
    public partial class AddDeptForm : System.Web.UI.Page
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
            string dname = TextBox1.Text;
            string dstatus = DropDownList1.SelectedValue;
            string q = $"exec savedepts '{dname}' , '{dstatus}' ";
            SqlCommand cmd = new SqlCommand(q,conn);
            int rowid = cmd.ExecuteNonQuery();
            if (rowid > 0) 
            {
                Response.Write("<script>alert('New Department Added Successfully!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error In Adding Department!')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminpage.aspx");
        }
    }
}