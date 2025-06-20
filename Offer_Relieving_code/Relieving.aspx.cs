using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text;

namespace HRMS.Offer_Relieving_code
{
        public partial class Relieving : System.Web.UI.Page
        {
            SqlConnection conn;
            protected void Page_Load(object sender, EventArgs e)
            {
                string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
                conn = new SqlConnection(cs);
                conn.Open();

            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                string Name, Email, Address, Position, StartDate, EndDate;

                Name = txtname.Text;
                Email = txtemail.Text;
                Address = txtaddress.Text;
                Position = txtposition.Text;
                StartDate = txtstartdate.Text;
                EndDate = txtenddate.Text;

                string fileName = Server.MapPath("~/GeneratedRelievingLetter/" + Name + ".pdf");

                Document doc = new Document();
                PdfWriter.GetInstance(doc, new FileStream(fileName, FileMode.Create));
                doc.Open();

                doc.Add(new Paragraph("Relieving Letter"));
                doc.Add(new Paragraph("Masstech Business Solutions Pvt. Ltd."));
                doc.Add(new Paragraph("708, Fenkin 9, Near Satkar Hotel, Wagle Estate, Thane West"));
                doc.Add(new Paragraph("Mumbai, India"));
                doc.Add(new Paragraph("Phone: +91-9999999999"));
                doc.Add(new Paragraph("Website: www.masstechbusiness.com"));
                doc.Add(new Paragraph("---------------------------------------------------"));
                doc.Add(new Paragraph($"Date: {DateTime.Now.ToShortDateString()}"));
                doc.Add(new Paragraph("\n"));
                doc.Add(new Paragraph($"To,\n{Name}\n{Address}\n\n"));

                doc.Add(new Paragraph("Subject: Relieving Letter\n\n"));

                doc.Add(new Paragraph($"Dear {Name},\n\n"));

                doc.Add(new Paragraph($"This is to formally confirm that you were employed with Masstech Business Solutions Pvt. Ltd. as a {Position} from {StartDate} to {EndDate}."));
                doc.Add(new Paragraph("Your resignation has been accepted and you are relieved from your duties with effect from " + EndDate + "."));
                doc.Add(new Paragraph("We would like to thank you for your contributions during your tenure with us and wish you all the best in your future endeavors."));
                doc.Add(new Paragraph("\nIf you require any further information, please feel free to get in touch with our HR department."));
                doc.Add(new Paragraph("\n\nSincerely,\n\nHR Department"));

                doc.Close();

                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", $"attachment; filename=RelievingLetter_{Name}.pdf");
                Response.WriteFile(fileName);
                Response.End();
            }
        }
    }