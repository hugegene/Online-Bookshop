using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        // Get the Profile of the newly created User
        ProfileCommon p = (ProfileCommon)ProfileCommon.Create(CreateUserWizard1.UserName, true);

        // User/Password has been created, populate the Profile Fields
        p.Name = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("NameTextBox")).Text;
        p.PhoneNumber = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("PhoneTextBox")).Text;
        p.HomeAddress = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox")).Text;

        // Update the Profile
        p.Save();

        // Add the User Role
        Roles.AddUserToRole(CreateUserWizard1.UserName, "user");
    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        redirectLoggedInUser();
    }

    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        CreateUserWizardStep1.Wizard.ActiveStepIndex = 0;
        redirectLoggedInUser();
    }

    private void redirectLoggedInUser()
    {
        if (Session["purchaseLogin"] != null && (bool)Session["purchaseLogin"] == true && !Roles.IsUserInRole(Login1.UserName, "owner"))
        {
            if (Session["purchaseLogin"] != null)
            {
                Session["purchaseLogin"] = false;
            }

            Response.Redirect("/Team13BookShop/CartView.aspx");
            return;
        }

        if (Roles.IsUserInRole(Login1.UserName, "user"))
            Response.Redirect("/Team13BookShop/CartView.aspx");
        else if (Roles.IsUserInRole(Login1.UserName, "owner"))
            Response.Redirect("/Team13BookShop/Owner/ManageInv.aspx");
    }
}