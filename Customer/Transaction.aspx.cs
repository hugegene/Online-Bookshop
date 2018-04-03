using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class TransactionModel
{
    public string ISBN { get; set; }
    public string Title { get; set; }
    public double Price { get; set; }
    public int Quantity { get; set; }
}
public partial class Transaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //TO-DO
            //Should store username inside Session["User"] in order to display it on our page.;
            if(Session["tranid"] == null||(int)Session["tranid"]==0)
            {
                Response.Redirect("/Team13Bookshop/Default.aspx", false);
                return;
            }

            int tranId = (int)Session["tranid"];
            BookshopEntities maketransaction = new BookshopEntities();
            List<IssueTransBookList> tranList = maketransaction.IssueTransBookLists.Where(x => x.TransactionID == tranId).ToList();
            IssueTran issuetran = maketransaction.IssueTrans.Where(x => x.TransactionID == tranId).ToList().First();
            TextBoxTranID.Text = issuetran.TransactionID.ToString();
            TextBoxTranDate.Text = issuetran.DateTimePurchased.ToString();

            List<TransactionModel> books = new List<TransactionModel>();
            foreach (IssueTransBookList a in tranList)
            {
                TransactionModel b = new TransactionModel();
                Book foundBook = maketransaction.Books.Where(x => x.BookID == a.BookID).ToList().First();
                b.ISBN = foundBook.ISBN;
                b.Price = Math.Round((double)(foundBook.Price * (100 - foundBook.Discount)) * 0.01, 2);
                b.Quantity = a.Quantity;
                b.Title = foundBook.Title;
                books.Add(b);
            }
            double totalPrice = 0;
            StringBuilder htmlWriter = new StringBuilder();
            foreach (TransactionModel tran in books)
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
                htmlWriter.Append("<span class='right floated'>Total Price: " + tran.Quantity * tran.Price + "</span>");
                htmlWriter.Append("<span>Quantity: " + tran.Quantity + "</span>");
                htmlWriter.Append("</div>");
                htmlWriter.Append("</div>");
                totalPrice += tran.Quantity * tran.Price;
            }
            PlaceHolder1.Controls.Add(new Literal { Text = htmlWriter.ToString() });
            InputTotalPrice.Value = "$ " + totalPrice.ToString();
        }
        ////TO-DO
        ////Should store username inside Session["User"] in order to display it on our page.;
        //int tranId = Int32.Parse(Request.QueryString["tranId"]);
        //BookshopEntities maketransaction = new BookshopEntities();
        //List<IssueTransBookLists> tranList = maketransaction.IssueTransBookLists.Where(x => x.TransactionID == tranId).ToList();
        //IssueTrans issuetran = maketransaction.IssueTrans.Where(x => x.TransactionID == tranId).ToList().First();
        //TextBoxTranID.Text = issuetran.TransactionID.ToString();
        //TextBoxTranDate.Text = issuetran.DateTimePurchased.ToString();

        //List<TransactionModel> books = new List<TransactionModel>();
        //foreach (IssueTransBookLists a in tranList)
        //{
        //    TransactionModel b = new TransactionModel();
        //    Book foundBook = maketransaction.Book.Where(x => x.BookID == a.BookID).ToList().First();
        //    b.ISBN = foundBook.ISBN;
        //    b.Price = Double.Parse(foundBook.Price.ToString());
        //    b.Quantity = a.Qty;
        //    b.Title = foundBook.Title;
        //    books.Add(b);
        //}
        //double totalPrice = 0;
        //StringBuilder htmlWriter = new StringBuilder();
        //foreach (TransactionModel tran in books)
        //{
        //    htmlWriter.Append("<div class='card'>");
        //    htmlWriter.Append("<div class='image'>");
        //    htmlWriter.Append("<img src='images/" + tran.ISBN + ".jpg' />");
        //    htmlWriter.Append("</div>");
        //    htmlWriter.Append("<div class='content'>");
        //    htmlWriter.Append("<div class='header'>" + tran.Title + "</div>");
        //    htmlWriter.Append("<div class='meta'>");
        //    htmlWriter.Append("<a>Prices: " + tran.Price + "</a>");
        //    htmlWriter.Append("</div>");
        //    htmlWriter.Append("</div>");
        //    htmlWriter.Append("<div class='extra content'>");
        //    htmlWriter.Append("<span class='right floated'>Total Price: " + tran.Quantity * tran.Price + "</span>");
        //    htmlWriter.Append("<span>Quantity: " + tran.Quantity + "</span>");
        //    htmlWriter.Append("</div>");
        //    htmlWriter.Append("</div>");
        //    totalPrice += tran.Quantity * tran.Price;
        //}
        //PlaceHolder1.Controls.Add(new Literal { Text = htmlWriter.ToString() });
        //InputTotalPrice.Value = "$ " + totalPrice.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //TO-DO
        Response.Redirect("/Team13BookShop/Default.aspx",false);
    }
}