using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS
{
    public partial class LoginPage : System.Web.UI.Page
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
            string em = TextBox1.Text;
            string pass = TextBox2.Text;

            string q = $"exec LoginEmp '{em}' ,'{pass}' ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    string dbEmail = rdr["eEmail"].ToString();
                    string dbPass = rdr["epass"].ToString();
                    string dbRole = rdr["eRole"].ToString();

                    if ((dbEmail.Equals(em, StringComparison.OrdinalIgnoreCase) ||
                         rdr["eName"].ToString().Equals(em, StringComparison.OrdinalIgnoreCase)) &&
                        dbPass == pass)
                    {
                        Session["User"] = em;
                        Session["Uemail"] = dbEmail;

                        switch (dbRole)
                        {
                            case "Admin":
                                Response.Redirect("AdminPage.aspx");
                                break;
                            case "Employee":
                                Response.Redirect("EmpPageBase.aspx");
                                break;
                            case "HR":
                                Response.Redirect("HrBasePage.aspx");
                                break;
                            case "Manager":
                                Response.Redirect("Manager.aspx");
                                break;
                            default:
                                Response.Redirect("AccessDenied.aspx");
                                break;
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid credentials. Please try again.');</script>");
            }
            
        }
    }
}