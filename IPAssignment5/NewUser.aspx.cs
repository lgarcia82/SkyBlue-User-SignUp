using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace IPAssignment5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string email = txtEmail.Text;
            bool exists = false;         // existing username

            //create sql connection object
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            //empty string to hold values from database
            string dbUserName = string.Empty;
            try
            {
                //query database using reader to obtain User values
                using (SqlCommand command = new SqlCommand("SELECT (User_UserName) FROM [User]", db))
                {
                    db.Open();                  //open connection
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            dbUserName = reader[0].ToString();
                            if (dbUserName == userName)
                            {
                                exists = true;        //username already used
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
            if (exists)
            {
                lblError.Text = "<span style='font-weight: bold'>Sorry!</span> Username already in use :(";
                lblError.Visible = true;
                db.Close();
            }
            //submit form and proceed to next page
            else
            {
                //reassign command string to insert new record into db
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT INTO [User] (User_Username, User_Email) VALUES ('" + userName + "','" + email + "');";
                cmd.Connection = db;

                try
                {
                    cmd.ExecuteNonQuery();

                }
                catch
                {
                    lblError.Text = "System Error!";
                    lblError.Visible = true;
                }
                finally
                {
                    db.Close();
                }
                Session["UserName"] = userName;
                Session["Email"] = email;
                Response.Redirect("/NewUserInfo.aspx");   //carry on to next page
            }
        }
    }
}