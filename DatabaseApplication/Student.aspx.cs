using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DatabaseApplication
{
    public partial class Student : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.
            ConnectionStrings["StudentDBConnectionString"].
            ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            //step1- database connection
            SqlConnection objConnection = new 
                SqlConnection(ConnectionString);
            objConnection.Open();

            //step2- write query in sqlcommand
            string Query = "SELECT * FROM tblStudent";
            SqlCommand objCommand = new 
                SqlCommand(Query,objConnection);

            SqlDataAdapter objAdapter = new 
                SqlDataAdapter(objCommand);
            DataSet dsStudent = new DataSet();
            objAdapter.Fill(dsStudent);
            gvStudentList.DataSource = dsStudent;
            gvStudentList.DataBind();
        }
    }

}