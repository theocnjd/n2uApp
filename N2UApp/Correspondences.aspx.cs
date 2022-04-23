using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N2UApp
{
    public partial class Correspondences : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MethodCollections methodCollections = new MethodCollections();
            string email = Context.User.Identity.Name; // methodCollections.GetLogonEmail(Context.User.Identity.Name);
            Int32 usertype = Convert.ToInt32(Request.QueryString["usertypeid"]);

            dsGetCorrespondence.SelectParameters[0].DefaultValue = email;
            cvCorrespondence.DataBind();
            if (usertype == 2)
            {
                cvCorrespondence.CardLayoutProperties.Items[2].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[3].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[5].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[6].Visible = false;
           

                 // hide toggle for other sections (Admin & Client)
                // Control dashboardWrapper = Master.FindControl("DashboardWrapper");
                //if (dashboardWrapper != null)
                //{
                //    dashboardWrapper.Visible = false;
                //}
                //Control adminWrapper = Master.FindControl("AdminWrapper");
                //if (adminWrapper != null)
                //{
                //    adminWrapper.Visible = false;
                //}
                //Control clientWrapper = Master.FindControl("AdvisorWrapper");
                //if (clientWrapper != null)
                //{
                //    clientWrapper.Visible = false;
                //}

                // make business name readonly
                cvCorrespondence.Columns["RegisteredBusinessName"].ReadOnly = true;
                // customize the page banner for client.
                CorrespondenceBanner.InnerHtml = "Rate and review your recent experience with advisor(s).";
            }
            else if (usertype == 3)
            {
                //gvCorrespondence.Columns["RegisteredBusinessName"].Visible = false;
                //gvCorrespondence.Columns["Comment"].Visible = false;
                //gvCorrespondence.Columns["Rating"].Visible = false;

                cvCorrespondence.CardLayoutProperties.Items[1].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[3].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[4].Visible = false;
                cvCorrespondence.CardLayoutProperties.Items[6].Visible = false;

                cvCorrespondence.Columns["RegisteredBusinessName"].Visible = false;

                // Make client related datails read only
                cvCorrespondence.Columns["Review"].ReadOnly = true;
                cvCorrespondence.Columns["RatingDesc"].ReadOnly = true;
                cvCorrespondence.Columns["ClientName"].ReadOnly = true;

                // hide toggle for other sections (Admin & Client)
                //Control dashboardWrapper = Master.FindControl("DashboardWrapper");
                //if (dashboardWrapper != null)
                //{
                //    dashboardWrapper.Visible = false;
                //}
                //Control adminWrapper = Master.FindControl("AdminWrapper");
                //if (adminWrapper != null)
                //{
                //    adminWrapper.Visible = false;
                //}
                //Control clientWrapper = Master.FindControl("ClientWrapper");
                //if (clientWrapper != null)
                //{
                //    clientWrapper.Visible = false;
                //}
                // customize the page banner for advisor
                CorrespondenceBanner.InnerHtml = "Search and response to recent review(s).";
            }
            else
            {
                dsGetCorrespondence.SelectParameters[0].DefaultValue = "admin@attention";
                // hide toggle for other sections (Admin & Client)
                //Control dashboardWrapper = Master.FindControl("DashboardWrapper");
                //if (dashboardWrapper != null)
                //{
                //    dashboardWrapper.Visible = false;
                //}
                //Control adminWrapper = Master.FindControl("AdvisorWrapper");
                //if (adminWrapper != null)
                //{
                //    adminWrapper.Visible = false;
                //}
                //Control clientWrapper = Master.FindControl("ClientWrapper");
                //if (clientWrapper != null)
                //{
                //    clientWrapper.Visible = false;
                //}
                cvCorrespondence.DataBind();

                // customize the page banner for admin.
                CorrespondenceBanner.InnerHtml = "Search and manage recent conflict(s).";
            }
        }

    }
}