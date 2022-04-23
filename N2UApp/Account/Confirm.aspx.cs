using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using N2UApp.Models;

namespace N2UApp.Account
{
    public partial class Confirm : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

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

            string code = IdentityHelper.GetCodeFromRequest(Request);
            string userId = IdentityHelper.GetUserIdFromRequest(Request);
            if (code != null && userId != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var result = manager.ConfirmEmail(userId, code);
                if (result.Succeeded)
                {
                    successPanel.Visible = true;
                    return;
                }
            }
            successPanel.Visible = false;
            errorPanel.Visible = true;
        }
    }
}