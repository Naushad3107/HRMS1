using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Documents
{
    public partial class EmployeeUploadedDocumentList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                EmpLoadData();
            }

        }
        public void EmpLoadData()
        {
            string q = "exec EmpLoadData";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            gvFiles.DataSource = reader;
            gvFiles.DataBind();
        }
        protected void gvFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadFile")
            {
                string fileName = e.CommandArgument.ToString();  // just file name from DB
                string relativePath = "~/Uploads/" + fileName;
                string fullPath = Server.MapPath(relativePath);

                if (!File.Exists(fullPath))
                {
                    Response.Write("<script>alert('File not found.');</script>");
                    return;
                }

                // Redirect browser to the file URL to open/view the file inline
                string fileUrl = ResolveUrl(relativePath);
                Response.Redirect(fileUrl, false);
            }

        }


    }
}