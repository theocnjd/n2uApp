using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N2UApp
{
    public partial class AdvisorProfile : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
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

            txtbxEmail.Text = Context.User.Identity.Name;
        }

        protected void BtnCreateAdvisor_Click(object sender, EventArgs e)
        {
            MethodCollections methodCollections = new MethodCollections();
            lbl_Advisorid.Text = methodCollections.CreateAdvisor(txtbxBusinessName.Text, txtbxEmail.Text,
                                    TxtbxWebsite.Text, Convert.ToInt16(DDlRegulatoryAuthority.SelectedValue));
            
        }
    }
}