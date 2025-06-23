using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS
{
    public partial class ViewEmpdetails : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            ViewDetails();
        }

        public void ViewDetails()
        {
            
            string em = Session["User"].ToString();
            string uemail = Session["Uemail"].ToString();
            string q = $"exec ViewEmpDetails  '{uemail}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

           // DataTable dt = new DataTable();
            DataTable dt = new DataTable();
            dt.Load(rdr);

            DataTable flipped = TransposeTable(dt);
            GridView1.DataSource = flipped;
            GridView1.DataBind();

        }

        public DataTable TransposeTable(DataTable dt)
        {
            DataTable newTable = new DataTable();
            newTable.Columns.Add("Profile");
            newTable.Columns.Add("Details");

            foreach (DataColumn col in dt.Columns)
            {
                DataRow newRow = newTable.NewRow();
                newRow["Profile"] = col.ColumnName;
                newRow["Details"] = dt.Rows[0][col.ColumnName];
                newTable.Rows.Add(newRow);
            }

            return newTable;
        }

    }
}