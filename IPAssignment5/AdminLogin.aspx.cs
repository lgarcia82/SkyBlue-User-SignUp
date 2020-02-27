using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace IPAssignment5
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string adminUserName = txtUserName.Text;
            string adminPassword = txtPassword.Text;
            bool userMatch = false;
            bool passMatch = false;         // existing username

            //create sql connection object
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            //empty string to hold values from database
            string dbUserName = string.Empty;
            string dbPassword = string.Empty;
            try
            {
                //query database using reader to obtain User values
                using (SqlCommand command = new SqlCommand("SELECT Admin_Username, Admin_Password FROM [Admin]", db))
                {
                    db.Open();                  //open connection
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            dbUserName = reader[0].ToString();
                            dbPassword = reader[1].ToString();
                            if (dbUserName == adminUserName)
                            {
                                userMatch = true;        //username already used
                            }
                            if(dbPassword == adminPassword)
                            {
                                passMatch = true;
                            }

                        }
                    }
                }
            }
            catch
            {
                lblError.Text = "System error!";
                lblError.Visible = true;
            }
            //user name exisits
            if (!userMatch || !passMatch)
            {
                lblError.Text = "Incorrect username and/or password";
                lblError.Visible = true;
            }
            //submit form and proceed to next page
            else
            {
                Session["UserName"] = adminUserName;            
                Response.Redirect("/AdminPage.aspx");   //carry on to next page
            }
        }
    }
}