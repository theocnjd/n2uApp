using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using System.Data.SqlClient;
using System.Data;
using N2UApp.Models;


namespace N2UApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_load(object sender, EventArgs e)
        {
          
            Control orgControl = Master.FindControl("masterTopNavBar");
            if (orgControl != null)
            {
                orgControl.Visible = false;
            }
            Control sidebarControl = Master.FindControl("accordionSidebar");
            if (sidebarControl != null)
            {
                sidebarControl.Visible = false;
            }
            Control masterfooter = Master.FindControl("masterfooter");
            if (masterfooter != null)
            {
                masterfooter.Visible = false;
            }

        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text};
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                MethodCollections methodCollections = new MethodCollections();
                Int32 usertype = Convert.ToInt32(cmbxusertypeid.SelectedValue);
                methodCollections.UpdateUser(usertype, Email.Text);
                
                if (usertype == 2)
                {
                    methodCollections.CreateClient(Email.Text);
                }

                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

                //if (usertype == 2)
                //{
                //    Response.Redirect("~/ClientProfile.aspx");
                //}
                //else if(usertype == 3)
                //{
                //    Response.Redirect("~/AdvisorsDetails.aspx?usertypeid=3&codeemail=" + Server.UrlEncode(Email.Text));
                //}
                //else
                //{
                //    Response.Redirect("~/AdvisorsDetails.aspx?usertypeid=1");
                //}
               
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

       
    }
}