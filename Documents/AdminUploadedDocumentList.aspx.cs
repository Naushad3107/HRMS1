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
    public partial class AdminUploadedDocumentList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                LoadData();
            }

        }
        public void LoadData()
        {
            string q = "exec LoadData";
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
            if (e.CommandName == "DeleteFile")
            {
                int documentId = Convert.ToInt32(e.CommandArgument);


                string query = $"exec DeleteRecord '{documentId}'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();

                LoadData();
            }
        }


    }
}