using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using N2UApp.Models;

namespace N2UApp.Account
{
    public partial class AddPhoneNumber : System.Web.UI.Page
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
        protected void PhoneNumber_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var code = manager.GenerateChangePhoneNumberToken(User.Identity.GetUserId(), PhoneNumber.Text);
            if (manager.SmsService != null)
            {
                var message = new IdentityMessage
                {
                    Destination = PhoneNumber.Text,
                    Body = "Your security code is " + code
                };

                manager.SmsService.Send(message);
            }

            Response.Redirect("/Account/VerifyPhoneNumber?PhoneNumber=" + HttpUtility.UrlEncode(PhoneNumber.Text));
        }
    }
}