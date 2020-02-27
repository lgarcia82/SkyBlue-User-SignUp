using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPAssignment5
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAdmin.Text = "Hello Admin " + (string)Session["UserName"];
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow != null)
            {
                DetailsView1.Visible = true;
            }
            else
            {
                DetailsView1.Visible = false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEditTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("/EditTable.aspx");
        }
    }
}