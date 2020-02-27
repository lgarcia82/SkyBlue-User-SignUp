using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPAssignment5
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Welcome Back " + (string)Session["Username"] + "!";
            Label2.Text = (string)Session["FName"] ;
            Label3.Text = (string)Session["LName"];
            Label4.Text = (string)Session["Email"];
            Label5.Text = (string)Session["Country"];
           
        }
    }
}