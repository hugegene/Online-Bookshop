using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Owner_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //bListView.Columns.Contains(); 
            bListView.DataSource = new BookshopEntities().Books.ToList();
            bListView.DataBind();
        }
    }
    

    protected void bkTitleSBtn_Click(object sender, EventArgs e)
    {
        BookshopEntities ent = new BookshopEntities();
        bListView.DataSource = ent.Books.Where(x => x.Title.Contains(bkTitleSearchB.Text)).ToList();
        bListView.DataBind();
    }
    protected void bkTitleRBtn_Click(object sender, EventArgs e)
    {
        bListView.DataSource = new BookshopEntities().Books.ToList();
        bListView.DataBind();
    }

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        bListView.EditIndex = e.NewEditIndex;

        int BookID = Convert.ToInt32(bListView.DataKeys[e.NewEditIndex].Values[0]);

        using (BookshopEntities entities = new BookshopEntities())
        {
            bListView.DataSource = entities.Books.Where(p => p.BookID == BookID).ToList<Book>();
            bListView.DataBind();
        }
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = bListView.Rows[e.RowIndex];
            int BookID = Convert.ToInt32(bListView.DataKeys[e.RowIndex].Values[0]);
            string stock = (row.FindControl("TextBox4") as TextBox).Text;
            string price = (row.FindControl("TextBox5") as TextBox).Text;
            string discount = (row.FindControl("TextBox6") as TextBox).Text;

            using (BookshopEntities entities = new BookshopEntities())
            {
                Book b = entities.Books.Where(x => x.BookID == BookID).First();
                b.Stock = Convert.ToInt32(stock);
                b.Price = Convert.ToDecimal(price);
                b.Discount = Convert.ToInt32(discount);
                entities.SaveChanges();
                bListView.EditIndex = -1;
                bListView.DataSource = entities.Books.Where(p => p.BookID == BookID).ToList<Book>();
                bListView.DataBind();

            }
        }
        catch (Exception eer)
        {
            Console.WriteLine(eer.Message);
        }

        
 
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {

        bListView.EditIndex = -1;

        using (BookshopEntities entities = new BookshopEntities())
        {
            bListView.DataSource = new BookshopEntities().Books.ToList();
            bListView.DataBind();

        }

    }



    protected void bListView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}