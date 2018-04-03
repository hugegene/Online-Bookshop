using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CartView : System.Web.UI.Page
{

    List<Book> cartBookList = new List<Book>();
    BookshopEntities context = new BookshopEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string username = User.Identity.Name;
            if (!String.IsNullOrEmpty(username))
            {
                ButLogin.Visible = false;
                ButBuy.Visible = true;
            }
        }

        try
        {
            int noofbooks = (int)Session["count"];
            List<int> selectedbooks = new List<int>();

            for (int i = 0; i < noofbooks; i++)
            {
                selectedbooks.Add(Convert.ToInt32(Session["BookNo" + i.ToString()]));
            }

            cartBookList = context.Books.Where(x => selectedbooks.Contains(x.BookID)).ToList();

            foreach (Book bc in cartBookList)
            {
                bc.Stock = 0;
                foreach (int i in selectedbooks)
                {
                    if (i == bc.BookID)
                    {
                        bc.Stock++;
                    }
                }
            }
        }
        catch (NullReferenceException nue)
        { }

        List<CartModel> books = new List<CartModel>();
        foreach (Book a in cartBookList)
        {
            CartModel b = new CartModel();
            Book foundBook = context.Books.Where(x => x.BookID == a.BookID).ToList().First();
            b.ISBN = foundBook.ISBN;
            //b.Price = Double.Parse(foundBook.Price.ToString());
            b.Price = Math.Round((double)(foundBook.Price * (100 - foundBook.Discount)) * 0.01, 2);
            b.Stock = a.Stock;
            b.Title = foundBook.Title;
            books.Add(b);
        }

        double totalPrice = 0;
        StringBuilder htmlWriter = new StringBuilder();
        foreach (CartModel tran in books)
        {
            htmlWriter.Append("<div class='card'>");
            htmlWriter.Append("<div class='image'>");
            htmlWriter.Append("<img alt='Image Unavailable' src='/Team13BookShop/images/" + tran.ISBN + ".jpg' />");
            htmlWriter.Append("</div>");
            htmlWriter.Append("<div class='content'>");
            htmlWriter.Append("<div class='header'>" + tran.Title + "</div>");
            htmlWriter.Append("<div class='meta'>");
            htmlWriter.Append("<a>Prices: " + tran.Price + "</a>");
            htmlWriter.Append("</div>");
            htmlWriter.Append("</div>");
            htmlWriter.Append("<div class='extra content'>");
            htmlWriter.Append("<span class='right floated'>Total Price: " + tran.Stock * tran.Price + "</span>");
            htmlWriter.Append("<span>Quantity: " + tran.Stock+ "</span>");
            htmlWriter.Append("</div>");
            htmlWriter.Append("</div>");
            totalPrice += tran.Stock * tran.Price;
        }
        PlaceHolder1.Controls.Add(new Literal { Text = htmlWriter.ToString() });
        InputTotalPrice.Value = "$ " + totalPrice.ToString();

        ViewCartLogic vcl = new ViewCartLogic();
        TextBoxCartSummary.Text = String.Format("You have {0} book title(s) for a total of {1:c} in your cart.", vcl.CountCart(cartBookList), vcl.CountPrice(cartBookList));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Team13BookShop/Default.aspx", true);
    }

    protected void ButBuy_Click (object sender, EventArgs e)
    {
        BookshopEntities context = new BookshopEntities();

        string username = User.Identity.Name;
        Guid userid = context.aspnet_Users.Where(x => x.UserName == username).First().UserId;
        try
        {
            try
            {
                int noofbooks = (int)Session["count"];
                List<int> selectedbooks = new List<int>();

                for (int i = 0; i < noofbooks; i++)
                {
                    selectedbooks.Add(Convert.ToInt32(Session["BookNo" + i.ToString()]));
                }

                //List<Book> bookListFromCat = (List<Book>)Session["???"];        //check which data type is the info coming from

                //                BookshopEntities context = new BookshopEntities();

                cartBookList = context.Books.Where(x => selectedbooks.Contains(x.BookID)).ToList();

                foreach (Book bc in cartBookList)
                {
                    bc.Stock = 0;
                    foreach (int i in selectedbooks)
                    {
                        if (i == bc.BookID)
                        {
                            bc.Stock++;
                        }
                    }
                }
            }
            catch (NullReferenceException nue)
            {            }

            ViewCartLogic vcl = new ViewCartLogic();
            int tid = vcl.BuyCart(cartBookList, username, userid, vcl.CountPrice(cartBookList));
            if(tid==-1)
            {
                Response.Redirect("/Team13BookShop/Customer/ErrorPage.aspx", false);
                Session["count"] = 0;
                return;
            }

            Session.Add("tranid", tid);
        }
        catch (Exception ex)
        {    }

        Session["count"] = 0;
        Response.Redirect("/Team13BookShop/Customer/Transaction.aspx");
    }

    protected void ButRemoveColumn_Click(object sender, EventArgs e)
    {
        Session["count"] = 0;
        Response.Redirect("Default.aspx", true);
    }

    protected void ButLogin_Click(object sender, EventArgs e)
    {
        Session.Add("purchaseLogin", true);
        Response.Redirect("login.aspx");
    }


}
public class CartModel
{
    public string ISBN { get; set; }
    public string Title { get; set; }
    public double Price { get; set; }
    public int Stock { get; set; }
}