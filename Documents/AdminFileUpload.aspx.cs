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
    public partial class AdminFileUpload : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                FetchRegisterEmp();
                FetchAdminDocumentNames();
            }

        }
        public void FetchRegisterEmp()
        {
            string q = "exec FetchRegisterEmp";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            regemail.DataSource = rd;
            regemail.DataTextField = "eName";
            regemail.DataValueField = "eid";
            regemail.DataBind();
        }
        public void FetchAdminDocumentNames()
        {
            string q = "exec FetchAdminDocumentNames";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            docname.DataSource = rd;
            docname.DataTextField = "AdminDocumentName";
            docname.DataValueField = "AdId";
            docname.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Email, DocumentName, Filepath;
            int EmpId, DocId;
            EmpId = int.Parse(regemail.SelectedValue);
            DocId = int.Parse(docname.SelectedValue);
            Email = regemail.SelectedItem.Text;
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


            string q = $"exec InsertAdminFileUpload '{DocId}','{DocumentName}','{EmpId}','{Email}','{Filepath}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }
    }
}