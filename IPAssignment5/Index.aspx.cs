/*
 * Lee Garcia
 * COSC 3351
 * Assignment 5
 * */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace IPAssignment5
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            bool passMatch = false;         // existing username

            //create sql connection object
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

            //empty string to hold values from database
            string dbUserName = string.Empty;
            string dbPassword = string.Empty;
            string dbUserID = string.Empty;
            try
            {
                //query database using reader to obtain User values
                using (SqlCommand command = new SqlCommand("SELECT User_Username, User_Password FROM [User]", db))
                {
                    db.Open();                  //open connection
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            dbUserName = reader[0].ToString();
                            dbPassword = reader[1].ToString();

                            if (dbUserName == userName)
                            {
                                if (dbPassword == password)
                                {
                                    passMatch = true;
                                    break;
                                }
                            }

                        }
                    }
                }
            }
            catch
            {
                lblError.Text = "System error!";
                lblError.Visible = true;
                db.Close();
            }

            //user name exisits
            if (!passMatch)
            {
                lblError.Text = "Incorrect username and/or password";
                lblError.Visible = true;
                db.Close();
            }
            //submit form and proceed to next page
            else
            {
                try
                {
                    //query database using reader to obtain User values
                    using (SqlCommand command2 = new SqlCommand("SELECT User_Email, User_FName, User_LName, User_Country FROM [User] WHERE User_Username = '" + userName + "'", db))
                    {                                     
                        using (SqlDataReader reader = command2.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Session["Email"] = reader[0].ToString();
                                Session["FName"] = reader[1].ToString();
                                Session["LName"] = reader[2].ToString();
                                Session["Country"] = reader[3].ToString();
                            }
                        }
                    }
                }
                catch
                {
                    lblError.Text = "System error!";
                    lblError.Visible = true;
                    db.Close();
                }
                Session["Username"] = userName;
                db.Close();
                Response.Redirect("/User.aspx");   //carry on to next page
            }

        }
       
    }
}
