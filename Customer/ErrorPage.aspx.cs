using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_ErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["count"] != null)
        {
            Session["count"] = 0;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Team13BookShop/Default.aspx", true);
    }
}