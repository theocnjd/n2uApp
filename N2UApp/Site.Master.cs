using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using N2UApp.N2UModels;
using System.Linq;

namespace N2UApp
{
    public partial class SiteMaster : MasterPage
    {
        MethodCollections methd = new MethodCollections();
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //Retrieve email of the current user
            string signOnEmail = Context.User.Identity.Name;

            //Retrieve user type e.g admin or advisor or client
            Int32 userTypeid = methd.GetUserType(signOnEmail);

            if (userTypeid == 1)
            {
                SetAlertsCount(signOnEmail, 1);
                SetAlertsCount("Admin@Validation", 1);
            }
            else
            {
                SetAlertsCount(signOnEmail, userTypeid);
            }

            SetUserContainerVisibility(userTypeid);
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        private void SetAlertsCount(string email, Int32 userTypeid)
        {
            //Retrieve alert information
            Int32 alertInfos = methd.GetAlertCount(email);

            if (alertInfos > 0)
            {
                badgecounter.InnerHtml = alertInfos.ToString() + "+";

                if (userTypeid == 2)
                {
                    sp_setDueAction.InnerHtml = "kindly review and rate your recent contact experience....";
                    validationAlert.Visible = false;
                    feedbackissues.HRef = "Correspondences.aspx?usertypeid=" + userTypeid;
                }
                else if (userTypeid == 3)
                {
                    feedbackissues.HRef = "Correspondences.aspx?usertypeid=" + userTypeid;
                    sp_setDueAction.InnerHtml = "kindly respond to review(s)....";
                    validationAlert.Visible = false;
                }
                else if (userTypeid == 1 && email != "Admin@Validation")
                {
                    feedbackissues.HRef = "Correspondences.aspx?usertypeid=" + userTypeid;
                    sp_setDueAction.InnerHtml = $"{alertInfos} conflict(s) awaiting your attention....";
                }
                else if (userTypeid == 1 && email == "Admin@Validation")
                {
                    sp_setvalidatonText.InnerHtml = $"{alertInfos} advisor(s) awaiting validation....";
                    validationAlert.HRef = "AdvisorsDetails.aspx?usertypeid=" + userTypeid;
                }
            }
            else if (alertInfos == 0 && userTypeid == 1 && email != "Admin@Validation")
            {
                badgecounter.InnerHtml = "0";
                feedbackissues.Visible = false;
            }
            else if (alertInfos == 0 && userTypeid == 1 && email == "Admin@Validation")
            {
                badgecounter.InnerHtml = "0";
                validationAlert.Visible = false;
            }
            else
            {
                badgecounter.InnerHtml = "0";
                validationAlert.Visible = false;
                feedbackissues.Visible = false;
            }
        }

        private void SetUserContainerVisibility(int usertype)
        {
            // hide advisor & client panels
            if (usertype == 1)
            {
                DashboardWrapper.Visible = false;
                AdvisorWrapper.Visible = false;
                ClientWrapper.Visible = false;
            }
            // hide advisor & admin panels
            else if (usertype == 2)
            {
                DashboardWrapper.Visible = false;
                AdminWrapper.Visible = false;
                AdvisorWrapper.Visible = false;
            }
            // hide client & admin panels
            else
            {
                DashboardWrapper.Visible = false;
                AdminWrapper.Visible = false;
                ClientWrapper.Visible = false;
            }
        }
    }

}