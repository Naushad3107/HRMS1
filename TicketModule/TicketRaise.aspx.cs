using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.TicketModule
{
    public partial class TicketRaise : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(connStr);
            conn.Open();

            if (!IsPostBack)
            {
                GetDetailsForTicket();

            }


        }
        public void GetDetailsForTicket()
        {
            string ex = DropDownList2.SelectedValue;
            string q = "exec dispEmp";
            //SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter sda = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            DropDownList2.DataSource = ds;
            DropDownList2.DataTextField = "eName";
            DropDownList2.DataValueField = "eName";
            DropDownList2.DataBind();

            string ex2 = DropDownList3.SelectedValue;
            string q2 = "exec ShowDesgn";
            SqlDataAdapter sda2 = new SqlDataAdapter(q2, conn);
            DataSet ds2 = new DataSet();
            sda2.Fill(ds2);

            DropDownList3.DataSource = ds2;
            DropDownList3.DataTextField = "Designation";
            DropDownList3.DataValueField = "Designation";
            DropDownList3.DataBind();

            string ex3 = DropDownList3.SelectedValue;
            string q3 = "exec showDept";
            SqlDataAdapter sda3 = new SqlDataAdapter(q3, conn);
            DataSet ds3 = new DataSet();
            sda3.Fill(ds3);

            DropDownList1.DataSource = ds3;
            DropDownList1.DataTextField = "DepartmentName";
            DropDownList1.DataValueField = "DepartmentName";
            DropDownList1.DataBind();






        }

        protected void Button1_Click(object sender, EventArgs e)

        {

            string dept = DropDownList1.SelectedItem.Text;
            string designation = DropDownList3.SelectedItem.Text;
            string emp = DropDownList2.SelectedItem.Text;
            string toEmail = $"exec getToEmail '{emp}'";
            string ticket = TextBox4.Text;
            string uploadFile = FileUpload1.FileName;
            string q = $"exec insertTicketData '{dept}','{designation}','{emp}','{ticket}','{uploadFile}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlCommand cmd2 = new SqlCommand(toEmail, conn);
            cmd.ExecuteNonQuery();
            object result = cmd2.ExecuteScalar();

            string toEmailadd = result != null ? result.ToString() : "";


            SendMail(toEmailadd, dept, designation, ticket, uploadFile);

            Response.Write("<script>alert('ticket raised sucessfully')</script>");





        }

        public void SendMail(string ToEmail, string dept, string desg, string ticket, string fileU)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("nikitalohar503@gmail.com");
            //mail.Bcc.Add(toEmailadd);
            //mail.To.Add("nikitalohar998@gmail.com"); 
            mail.To.Add(ToEmail);
            mail.Subject = "New Ticket Submitted: " + ticket;


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Ticket Details:");
            sb.AppendLine("------------------------------");
            sb.AppendLine("Department       : " + dept);
            sb.AppendLine("Designation      : " + desg);
            sb.AppendLine("Ticket Message   : " + ticket);
            sb.AppendLine("Uploaded File    : " + fileU);

            mail.Body = sb.ToString();


            if (FileUpload1.HasFile)
            {
                foreach (var file in FileUpload1.PostedFiles)
                {
                    string fn = file.FileName;
                    mail.Attachments.Add(new Attachment(file.InputStream, fn));
                }
            }

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Credentials = new NetworkCredential("nikitalohar503@gmail.com", "jduqgzycdsqqhbuf");
            smtp.Port = 587;
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}