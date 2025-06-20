using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS.Payslips
{
    public partial class AddDeduction : System.Web.UI.Page
    {
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        conn = new SqlConnection(cs);
        conn.Open();
        if (!IsPostBack)
        {

            GetDeductType();
            GetDepartment();

        }
    }

    public void GetDeductType()
    {
        string q = "exec GetDeductType";
        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        DropDownList1.DataSource = dr;
        DropDownList1.DataTextField = "DeductType";
        DropDownList1.DataValueField = "DeductTypeId";
        DropDownList1.DataBind();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string DeductType, Department, Designation;
        int DeductionPercentage;
        DeductType = DropDownList1.SelectedItem.Text;
        Department = DropDownList2.SelectedValue;
        Designation = DropDownList3.SelectedValue;
        DeductionPercentage = int.Parse(TextBox1.Text);
        string q = $"exec InsertDeductions '{DeductType}','{DeductionPercentage}','{Department}','{Designation}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        cmd.ExecuteNonQuery();
    }
    public void GetDepartment()
    {
        string q = "exec GetDepartment";
        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        DropDownList2.DataSource = dr;
        DropDownList2.DataTextField = "eDepartment";
        DropDownList2.DataValueField = "eDepartment";
        DropDownList2.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDept = DropDownList2.SelectedValue;
        string q = $"exec GetDesignation '{selectedDept}'";
        SqlCommand cmd = new SqlCommand(q, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        DropDownList3.DataSource = dr;
        DropDownList3.DataTextField = "eDesignation";
        DropDownList3.DataValueField = "eDesignation";
        DropDownList3.DataBind();
    }
    }

}