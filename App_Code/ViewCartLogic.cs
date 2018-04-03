using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ViewCartLogic
/// </summary>
public class ViewCartLogic
{
    public ViewCartLogic()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Book> FetchBookList(List<int> selectedBooksNo)
    {
        List<Book>  cartBookList = new List<Book>();
        BookshopEntities context = new BookshopEntities();
        cartBookList = context.Books.Where(x => selectedBooksNo.Contains(x.BookID)).ToList();
        return cartBookList;
    }
    

    public int BuyCart(List<Book> list, string usernm, Guid id,double price) // need to change
    {
       
            BookshopEntities context = new BookshopEntities();
            
            IssueTran tran = new IssueTran();

            tran.UserId = id;
            tran.DateTimePurchased = DateTime.Now;
            tran.TotalPrice = Decimal.Parse(price.ToString());
            context.IssueTrans.Add(tran);

            foreach (Book b in list)
            {
                IssueTransBookList transbook = new IssueTransBookList();
                transbook.TransactionID = tran.TransactionID;
                transbook.BookID = b.BookID;
                transbook.Quantity = b.Stock;
                context.IssueTransBookLists.Add(transbook);
            
                Book xe= context.Books.Where(x => x.BookID == transbook.BookID).First();
                if(xe.Stock<b.Stock)
                {
                    return -1;
                }
                xe.Stock -= b.Stock;
            }

            context.SaveChanges();

            return tran.TransactionID;
    }
    
    public int CountCart(List<Book> cart)
    {
        return cart.Count;
    }

    public double CountPrice(List<Book> cart)
    {
        double x=0;

        foreach (Book b in cart)
        {
            x += Math.Round((double)(b.Price*(100-b.Discount))*0.01 *b.Stock , 2);
        }
        return x;
    }
}