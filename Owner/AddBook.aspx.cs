using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Owner_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void creBkBtn_Click(object sender, EventArgs e)
    {
        int number; double dou;
        bool result = Int32.TryParse(catIDTB.Text, out number);
        bool result2 = Int32.TryParse(isbnTB.Text, out number);
        bool result3 = Int32.TryParse(stockTB.Text, out number);
        bool result4 = Double.TryParse(priceTB.Text, out dou);
        bool result5 = Int32.TryParse(discountTB.Text, out number);
        if (result && result2 && result3 && result4 && result5 == true)
        {
            BookshopEntities bInsert = new BookshopEntities();
            Book c = new Book();
            c.Title = bkTitleTB.Text;
            c.CategoryID = Convert.ToInt32(catIDTB.Text);
            c.ISBN = isbnTB.Text;
            c.Author = authorTB.Text;
            c.Stock = Convert.ToInt32(stockTB.Text);
            c.Price = Convert.ToDecimal(priceTB.Text);
            c.Discount = Convert.ToInt32(discountTB.Text);
            bInsert.Books.Add(c);
            bInsert.SaveChanges();
            Session.Add("newisbn", isbnTB.Text);
        }
        else
        {
            Session.Add("newisbn", "");
        }


        if (Session["newisbn"] != null && Session["newisbn"].ToString() != "")
        {
            Label11.Text = Session["newisbn"].ToString() + " Has been added successfully";
        }

        else
        {
            Label11.Text = "";
        }

    }

    protected void refBkBtn2_Click(object sender, EventArgs e)
    {
        bkTitleTB.Text = "";
        catIDTB.Text = "";
        isbnTB.Text = "";
        authorTB.Text = "";
        stockTB.Text = "";
        priceTB.Text = "";
        discountTB.Text = "";
    }

}

