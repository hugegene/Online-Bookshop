using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
    List<Book> cartBookList = new List<Book>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridViewCartDetails==null)
        {
            ButBuy.Enabled = false;
        }
        if (!IsPostBack)
        {
            string username = User.Identity.Name;
            if (!String.IsNullOrEmpty(username))
            {
                ButLogin.Visible = false;
                ButBuy.Enabled = true;
            }

            try
            {
                int noofbooks = (int)Session["count"];
                List<int> selectedbooks = new List<int>();

                for(int i=0;i<noofbooks;i++)
                {
                    selectedbooks.Add((int)Session["BookNo" + i.ToString()]);
                }

                BookshopEntities context = new BookshopEntities();

                cartBookList = context.Books.Where(x => selectedbooks.Contains(x.BookID)).ToList();

                foreach (Book bc in cartBookList)
                {
                    bc.Stock = 0;
                    foreach (int i in selectedbooks)
                    {
                        if(i==bc.BookID)
                        {
                            bc.Stock++;
                        }
                    }
                }
            }
            catch (NullReferenceException nue)
            {
                LabErrorMsg.Text = String.Format("You currently do not have any cart items. Please continue shopping!");
            }

            //for finding datasource from Session State
            GridViewCartDetails.DataSource = cartBookList.ToList<Book>();
            GridViewCartDetails.DataBind();

            ViewCartLogic vcl = new ViewCartLogic();

            LabSummaryCart.Text = String.Format("You have {0} items for a total of {1:c} in your cart.", vcl.CountCart(cartBookList), vcl.CountPrice(cartBookList));
            LabTotalPrice.Text = vcl.CountPrice(cartBookList).ToString();
        }
    }

    protected void ButContShop_Click(object sender, EventArgs e)
    {
       Response.Redirect("Default.aspx",true);        //depending on mainpage URL
    }

    protected void ButBuy_Click(object sender, EventArgs e)
    {
        BookshopEntities context = new BookshopEntities();

        string username = User.Identity.Name;
        Guid userid = context.aspnet_Users.Where(x=>x.UserName==username).First().UserId;
        try
        {
            try
            {
                int noofbooks = (int)Session["count"];
                List<int> selectedbooks = new List<int>();

                for (int i = 0; i < noofbooks; i++)
                {
                    selectedbooks.Add((int)Session["BookNo" + i.ToString()]);
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
            {
                LabErrorMsg.Text = String.Format("You currently do not have any cart items. Please continue shopping!" + nue.Message);
            }

            ViewCartLogic vcl = new ViewCartLogic();

            Session.Add("tranid", vcl.BuyCart(cartBookList, username, userid, vcl.CountPrice(cartBookList)));
        }
        catch (Exception ex)
        {
            LabErrorMsg.Text = String.Format("The error is : " + ex.Message);
        }

        Session["count"] = 0;
        Response.Redirect("/Team13BookShop/Customer/Transaction.aspx"); //or whatever name of this is
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