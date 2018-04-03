using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (BookshopEntities b = new BookshopEntities())
            {
                
                DataList1.DataSource = b.Books.ToList<Book>();
                DataList1.DataBind();
            }
        }
    }


    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string bookID = (String)e.CommandArgument;

        using (BookshopEntities entities = new BookshopEntities())
        {
            int count = (int)Session["count"];
            count = count + 1;
            Session["count"] = count;
            Session.Add("BookNo" + count, bookID);

            Label4.Text = Session["BookNo" + Session["count"]].ToString();

        }
    }
    
}