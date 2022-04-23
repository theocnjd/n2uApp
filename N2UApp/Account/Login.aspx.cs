using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using N2UApp.Models;

namespace N2UApp
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
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


            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: trueB
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                // Get the user type to redirect the user 
                MethodCollections methodCollections = new MethodCollections();
                Int32 userTpeid = methodCollections.GetUserType(Email.Text);

                switch (result)
                {
                    case SignInStatus.Success:
                        if (userTpeid == 2)
                        {
                            Response.Redirect("~/ClientProfile.aspx");
                            break;
                        }
                        else if (userTpeid == 3)
                        {
                            Response.Redirect("~/AdvisorsDetails.aspx?usertypeid=3");
                            break;
                        }
                        else
                        {
                            Response.Redirect("~/AdvisorsDetails.aspx?usertypeid=1");
                        }
                        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid username or password!";
                        ErrorMessage.Visible = true;
                        break;
                }
            
            }
        }
    }
}