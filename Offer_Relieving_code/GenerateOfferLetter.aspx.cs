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

namespace HRMS.Offer_Relieving
{
    public partial class GenerateOfferLetter : System.Web.UI.Page
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
            string Name, Email, Address, Position, StartDate;
            Double Salary;
            Name = txtname.Text;
            Email = txtemail.Text;
            Address = txtaddress.Text;
            Position = txtposition.Text;
            StartDate = txtdate.Text;
            Salary = double.Parse(txtsal.Text);

            string fileName = Server.MapPath("~/GeneratedOfferLetter/" + Name + ".pdf");

            Document doc = new Document();
            PdfWriter.GetInstance(doc, new FileStream(fileName, FileMode.Create));
            doc.Open();

            doc.Add(new Paragraph("Offer Letter"));
            doc.Add(new Paragraph("Masstech Business Solutions Pvt. Ltd."));
            doc.Add(new Paragraph("708,Fenkin 9,Near Satkar Hotel,Wagle Estate, Thane West"));
            doc.Add(new Paragraph("Mumbai, Inda"));
            doc.Add(new Paragraph("Phone: +91-9999999999"));
            doc.Add(new Paragraph("Website: www.masstechbusiness.com"));
            doc.Add(new Paragraph("---------------------------------------------------"));

            // Dynamic Offer Letter Content
            doc.Add(new Paragraph($"Date: {DateTime.Now.ToShortDateString()}"));
            doc.Add(new Paragraph("\n"));
            doc.Add(new Paragraph($"To,\n{Name}\n{Address}\n\n"));

            doc.Add(new Paragraph($"Subject: Offer of Employment for the position of {Position}\n\n"));

            doc.Add(new Paragraph($"Dear {Name},\n"));
            doc.Add(new Paragraph($"We are pleased to offer you the position of {Position} at Masstech Business Solutions PVT LTD with a monthly salary of ₹{Salary}."));
            doc.Add(new Paragraph($"Your employment with us will commence on {StartDate}."));
            doc.Add(new Paragraph("We look forward to having you on our team."));
            doc.Add(new Paragraph("\nSincerely,\nHR Department"));

            doc.Close();

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", $"attachment; filename=OfferLetter_{Name}.pdf");
            Response.WriteFile(fileName);
            Response.End();
        }
    }
}