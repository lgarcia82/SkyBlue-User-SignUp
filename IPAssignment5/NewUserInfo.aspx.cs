using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;

namespace IPAssignment5
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //page load attributes
            lblSysError.Visible = false;
            lblPassConst.Visible = false;
            txtUserName.Text = (string)Session["UserName"];
            txtUserEmail.Text = (string)Session["Email"];
            //load drop down with countries list
            if (!IsPostBack)
            {
                ddlCountry.DataSource = CountryList();
                ddlCountry.DataBind();
            }

        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// found easy way to populate drop down with predefined C# library Globalization
        /// credit: https://www.c-sharpcorner.com/UploadFile/0c1bb2/display-country-list-without-database-in-Asp-Net-C-Sharp/
        /// </summary>
        /// <returns></returns>
        public static List<string> CountryList()
        {
            //Creating List
            List<string> CultureList = new List<string>();
            CultureList.Add("(Select Country)");

            CultureInfo[] getCultureInfo = CultureInfo.GetCultures(CultureTypes.SpecificCultures);

            foreach (CultureInfo getCulture in getCultureInfo)
            {
                RegionInfo GetRegionInfo = new RegionInfo(getCulture.LCID);

                if (!(CultureList.Contains(GetRegionInfo.EnglishName)))
                {
                    CultureList.Add(GetRegionInfo.EnglishName);
                }
            }

            CultureList.Sort();

            return CultureList;
        }

        protected void btnSubmit2_Click(object sender, EventArgs e)
        {
            //store textbox values into variables
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string country = ddlCountry.Text;
            string password = txtPassword.Text;

            string passwordTest = passwordValidate(password);   //call function to check password
                                                                //passwordTest will carry string messages regarding failed 
                                                                //password constraints
                                                                //if password has any text, constraints failed
            if (passwordTest != null)
            {
                lblPassConst.Text = "Password must: <br />";
                lblPassConst.Text += passwordTest;
                lblPassConst.Visible = true;
            }
            //password met requirements
            else
            {
                //re-establish connection with db
                SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
                SqlCommand cmd = new SqlCommand();
                db.Open();
                //new sql command to update user table
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "UPDATE [User] SET User_FName = '" + firstName + "', User_LName = '" + lastName +
                                                     "', User_Country = '" + country + "',User_Password = '" + password +
                                                    "' WHERE User_Username = '" + txtUserName.Text + "';";
                cmd.Connection = db;

                try
                {
                    cmd.ExecuteNonQuery();

                }
                catch
                {
                    lblSysError.Text = "System Error!";
                    lblSysError.Visible = true;
                }
                finally
                {
                    db.Close();
                }
                Session["FirstName"] = firstName;
                Session["LastName"] = lastName;
                Response.Redirect("/SuccessPage.aspx");
            }
        }
        /// <summary>
        /// method to check user password for requirements
        /// </summary>
        /// <param name="_password"></param>
        /// <returns></returns>
        public string passwordValidate(string _password)
        {
            string message = null;  //starting error message for display
            //password must be at least 8 characters
            if (_password.Length < 8)
            {
                message = "- be at least 8 characters<br />";
            }
            //first character must be alpha
            if (!(Char.IsLetter(_password[0])))
            {
                message += "- begin with a letter<br />";
            }
            //must contain 1 capital letter
            if (!(Regex.Match(_password, @"^(?=.*[A-Z])", RegexOptions.ECMAScript).Success))
            {
                message += "- contain at least 1 uppercase letter<br />";
            }
            //must contain 1 lower case letter
            if (!(Regex.Match(_password, @"^(?=.*[a-z])", RegexOptions.ECMAScript).Success))
            {
                message += "- contain at least 1 lowercase letter<br />";
            }
            //must contain 1 digit
            if (!(Regex.Match(_password, @"^(?=.*\d)", RegexOptions.ECMAScript).Success))
            {
                message += "- contain at least 1 digit";
            }
            return message;  //message will contain error message which were flagged for display to user
        }
    }
}