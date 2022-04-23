using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace N2UApp
{
    public class Global : HttpApplication
    {
        // call mathod collection to retrieve values;
        MethodCollections mthdcol = new MethodCollections();
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        void Application_Error(object sender, EventArgs e)
        {
            // retrieve admin email address
            string email = mthdcol.GetAdminEmail();

            // Get last error message
            Exception ex = Server.GetLastError();

            // clear last error message
            Server.ClearError();

            // Lod arror to db
            Logger.Log(ex, email);

            // check if error is time out / 404 issue and call the dedicated page; otherwise use the default error page.
            if (ex.Message.Contains("timeout"))
            {
                Server.Transfer("~/Error_TimeOut.aspx");
            }
            else if (ex.Message.Contains("Object reference not set") || ex.Message.Contains("does not exist"))
            {
                Server.Transfer("~/Error_PageNoFoound.aspx");
            }
            else
            {
                Server.Transfer("~/Error_Default.aspx");
            }
        }
    }
}