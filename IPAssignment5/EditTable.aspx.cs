using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPAssignment5
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["User_Username"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtUsername")).Text;
            SqlDataSource1.InsertParameters["User_Email"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("txtUserEmail")).Text;
            SqlDataSource1.InsertParameters["User_Password"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("txtUserPass")).Text;
            SqlDataSource1.InsertParameters["User_FName"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("txtUserFName")).Text;
            SqlDataSource1.InsertParameters["User_LName"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("txtUserLName")).Text;
            SqlDataSource1.InsertParameters["User_Country"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("txtUserCountry")).Text;
            SqlDataSource1.Insert();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
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

            System.Globalization.CultureInfo[] getCultureInfo = CultureInfo.GetCultures(CultureTypes.SpecificCultures);

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
    }
}