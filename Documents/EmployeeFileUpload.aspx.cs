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
    public partial class EmployeeFileUpload : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                FetchEmployeeDocumentNames();
                if (Session["Uemail"] != null)
                {
                    txtemail.Text = Session["Uemail"].ToString();
                    txtemail.ReadOnly = true;
                }

            }

        }

        public void FetchEmployeeDocumentNames()
        {
            string q = "exec FetchEmployeeDocumentNames";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            docname.DataSource = rd;
            docname.DataTextField = "EmployeeDocumentName";
            docname.DataValueField = "EmId";
            docname.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Email, DocumentName, Filepath;
            int DocId;
            DocId = int.Parse(docname.SelectedValue);
            Email = txtemail.Text;
            DocumentName = docname.SelectedItem.Text;
            Filepath = Path.GetFileName(FileUpload1.FileName);

            string folderPath = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // Save file to server
            string savePath = Path.Combine(folderPath, Filepath);
            FileUpload1.SaveAs(savePath);


            string q = $"exec InsertEmployeeFileUpload '{DocId}','{DocumentName}','{Filepath}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }


    }
}