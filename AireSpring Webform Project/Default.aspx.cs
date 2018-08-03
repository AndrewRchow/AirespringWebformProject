using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AireSpring_Webform_Project
{

    public partial class _Default : Page
    {
        public static DataTable EmployeeTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                dError.Visible = false;
            }
            else
            {
                EmployeeTable = CreateEmployeeTable();
                gvEmployee.DataSource = EmployeeTable;
                gvEmployee.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = (from DataRow dr in EmployeeTable.Rows
                      where (int)dr["Id"] == int.Parse(txtEmployeeId.Text)
                      select (int)dr["id"]).FirstOrDefault();
            if (id > 0)
            {
                dError.Visible = true;
                dError.InnerText = "Please enter a unique Id";
                return;
            }

            InsertRow();
        }

        protected void InsertRow()
        {
            try
            {
                DataRow row;
                row = EmployeeTable.NewRow();

                row["Id"] = txtEmployeeId.Text;
                row["LastName"] = txtEmployeeFirstName.Text;
                row["FirstName"] = txtEmployeeLastName.Text;
                row["Phone"] = txtEmployeePhone.Text;
                row["Zip"] = txtEmployeeZip.Text;
                row["HireDate"] = txtEmployeeHireDate.Text;

                EmployeeTable.Rows.Add(row);
                string SortExpression = "HireDate ASC";
                EmployeeTable.DefaultView.Sort = SortExpression;
                gvEmployee.DataSource = EmployeeTable;
                gvEmployee.DataBind();

                txtEmployeeId.Text = null;
                txtEmployeeFirstName.Text = null;
                txtEmployeeLastName.Text = null;
                txtEmployeePhone.Text = null;
                txtEmployeeZip.Text = null;
                txtEmployeeHireDate.Text = null;
                txtSearchBy.Text = null;
            }
            catch
            {
                dError.Visible = true;
                dError.InnerText = "Please check your information";
            }          
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(ddlSortBy.SelectedValue == "LastName")
            {
                DataView dv = new DataView(EmployeeTable);
                dv.RowFilter = "LastName LIKE '%" + txtSearchBy.Text + "%'";
                gvEmployee.DataSource = dv;
                gvEmployee.DataBind();
            }
            else if (ddlSortBy.SelectedValue == "Phone")
            {
                DataView dv = new DataView(EmployeeTable);
                dv.RowFilter = "Phone LIKE '%" + txtSearchBy.Text + "%'";
                gvEmployee.DataSource = dv;
                gvEmployee.DataBind();
            }
        }

        private DataTable CreateEmployeeTable()
        {
            DataTable employeeTable = new DataTable("Employees");

            DataColumn idColumn = new DataColumn();
            idColumn.DataType = System.Type.GetType("System.Int32");
            idColumn.ColumnName = "Id";
            employeeTable.Columns.Add(idColumn);

            DataColumn firstNameColumn = new DataColumn();
            firstNameColumn.DataType = System.Type.GetType("System.String");
            firstNameColumn.ColumnName = "FirstName";
            employeeTable.Columns.Add(firstNameColumn);

            DataColumn lastNameColumn = new DataColumn();
            lastNameColumn.DataType = System.Type.GetType("System.String");
            lastNameColumn.ColumnName = "LastName";
            employeeTable.Columns.Add(lastNameColumn);

            DataColumn phoneColumn = new DataColumn();
            phoneColumn.DataType = System.Type.GetType("System.String");
            phoneColumn.ColumnName = "Phone";
            employeeTable.Columns.Add(phoneColumn);

            DataColumn zipColumn = new DataColumn();
            zipColumn.DataType = System.Type.GetType("System.Int32");
            zipColumn.ColumnName = "Zip";
            employeeTable.Columns.Add(zipColumn);

            DataColumn hireDateColumn = new DataColumn();
            hireDateColumn.DataType = System.Type.GetType("System.DateTime");
            hireDateColumn.ColumnName = "HireDate";
            employeeTable.Columns.Add(hireDateColumn);

            return employeeTable;
        }
    }
}
