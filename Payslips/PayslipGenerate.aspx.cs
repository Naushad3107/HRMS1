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

namespace HRMS.Payslips
{
    public partial class PayslipGenerate : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {

                GetDepartment();

            }
        }
        public void GetDepartment()
        {
            string q = "exec GetDepartment";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList1.DataSource = dr;
            DropDownList1.DataTextField = "eDepartment";
            DropDownList1.DataValueField = "eDepartment";
            DropDownList1.DataBind();
            dr.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedDept = DropDownList1.SelectedValue;
            string q = $"exec GetEmpByDept '{selectedDept}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DropDownList2.DataSource = dr;
            DropDownList2.DataTextField = "eName";
            DropDownList2.DataValueField = "eName";
            DropDownList2.DataBind();
            dr.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectedMonth = DropDownList3.SelectedValue;
            string selectedEmp = DropDownList2.SelectedValue;
            int sal, Basicsalary = 0, DeductionAmount = 0, PerDaySal, absentdaycount, absentdaysal, Inhandsalary, MonthDay = int.Parse(selectedMonth);
            string empName = "", email = "", contact = "";
            decimal totalEarnings = 0, totalDeductions = 0;


            string q = $"exec GetCountOFEmpLeave '{selectedEmp}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            absentdaycount = (int)cmd.ExecuteScalar();
            string q1 = $"exec FetchBasicSal '{selectedEmp}'";
            SqlCommand cmd1 = new SqlCommand(q1, conn);
            SqlDataReader rd = cmd1.ExecuteReader();
            if (rd.Read())
            {
                Basicsalary = Convert.ToInt32(rd["Basicsalary"]);
            }
            rd.Close();
            string q2 = $"exec FetchDeductionAmt '{selectedEmp}'";
            SqlCommand cmd2 = new SqlCommand(q2, conn);
            SqlDataReader rd1 = cmd2.ExecuteReader();
            if (rd1.Read())
            {
                DeductionAmount = Convert.ToInt32(rd1["TotalDeductions"]);
            }
            rd1.Close();
            PerDaySal = Basicsalary / MonthDay;
            absentdaysal = PerDaySal * absentdaycount;
            sal = Basicsalary - absentdaysal;
            Inhandsalary = sal - DeductionAmount;
            string q3 = $"exec GetPayslipDetails '{selectedEmp}'";
            SqlCommand cmd3 = new SqlCommand(q3, conn);
            SqlDataReader rd3 = cmd3.ExecuteReader();
            if (rd3.Read())
            {
                empName = rd3["eName"].ToString();
                email = rd3["eEmail"].ToString();
                contact = rd3["ephone"].ToString();
                totalEarnings = Convert.ToDecimal(rd3["TotalEarnings"]);
                totalDeductions = Convert.ToDecimal(rd3["TotalDeductions"]);
            }
            using (MemoryStream ms = new MemoryStream())
            {
                string folderPath = Server.MapPath("~/GeneratePayslip");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fileName = empName.Replace(" ", "_") + ".Payslip.pdf";
                string filePath = Path.Combine(folderPath, fileName);


                Document pdfDoc = new Document(PageSize.A4, 25, 25, 30, 30);
                PdfWriter.GetInstance(pdfDoc, new FileStream(filePath, FileMode.Create));
                pdfDoc.Open();


                Paragraph title = new Paragraph("Salary Payslip", new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 18f, iTextSharp.text.Font.BOLD));
                title.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(title);

                pdfDoc.Add(new Paragraph("\nMasstech Pvt Ltd", new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12f, iTextSharp.text.Font.BOLD)));
                pdfDoc.Add(new Paragraph("Email: masstech@gmail.com | Phone: 9876543256\n\n"));


                pdfDoc.Add(new Paragraph($"Employee Name: {empName}"));
                pdfDoc.Add(new Paragraph($"Email: {email}"));
                pdfDoc.Add(new Paragraph($"Contact: {contact}\n\n"));

                // Tables
                PdfPTable table = new PdfPTable(2);
                table.WidthPercentage = 100;

                // Earnings Table
                PdfPTable earningsTable = new PdfPTable(2);
                earningsTable.AddCell("Earnings");
                earningsTable.AddCell("Amount");
                earningsTable.AddCell("Total Earnings");
                earningsTable.AddCell(totalEarnings.ToString());

                // Deductions Table
                PdfPTable deductionsTable = new PdfPTable(2);
                deductionsTable.AddCell("Deductions");
                deductionsTable.AddCell("Amount");
                deductionsTable.AddCell("Total Deductions");
                deductionsTable.AddCell(totalDeductions.ToString());

                // Add to main table
                PdfPCell cell1 = new PdfPCell(earningsTable);
                PdfPCell cell2 = new PdfPCell(deductionsTable);
                table.AddCell(cell1);
                table.AddCell(cell2);

                pdfDoc.Add(table);

                // Net Salary
                Paragraph netSalary = new Paragraph($"\nNet Salary: ₹{Inhandsalary}", new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 14f, iTextSharp.text.Font.BOLD));
                netSalary.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(netSalary);

                pdfDoc.Close();


            }

        }
    }
}