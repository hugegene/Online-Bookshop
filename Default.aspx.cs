using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (BookshopEntities context = new BookshopEntities())
            {

                Repeater1.DataSource = context.Books.Where(x=>x.Stock>0).ToList<Book>();
                Repeater1.DataBind();
            }
        }

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string bookID = (String)e.CommandArgument;

        using (BookshopEntities entities = new BookshopEntities())
        {
            int count = (int)Session["count"];
            Session.Add("BookNo" + count, bookID);
            count = count + 1;
            Session["count"] = count;
        }
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        using (BookshopEntities context = new BookshopEntities())
        {
            //if similar text is detected, items are displayed in repeater
            if (context.Books.Where(x => x.Title.Contains(Textbox1.Text)) != null || context.Books.Where(x => x.Author.Contains(Textbox1.Text)) != null)
            {
                Repeater1.DataSource = context.Books.Where(x => x.Title.Contains(Textbox1.Text)).ToList<Book>().Union(context.Books.Where(x => x.Author.Contains(Textbox1.Text)).ToList<Book>());
                Repeater1.DataBind();
            }

            //if no results, label "no books found" will show
            if (Repeater1.Items.Count>0)
            {
                Label5.Visible = false;
            }
            else
            {
                Label5.Visible = true;
            }

        }

    }
}