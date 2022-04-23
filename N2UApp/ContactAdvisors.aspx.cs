using DevExpress.Web;
using N2UApp.N2UModels;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N2UApp
{
    public partial class ContactAdvisors : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                lblNotification.Visible = false;
            }

            // Check for querystring.
            if (Request.QueryString.HasKeys())
            {

                // Get client status e.g. new or old user
                string cat = Request.QueryString["Key"].ToString();

                // Control what a client sees based on his / her status.
                if (cat == "old")
                {
                    dsAdvisorwithAdd.SelectParameters[0].DefaultValue = Context.User.Identity.Name;
                    ContentTitle.InnerHtml = "Your previously contacted advisor(s)";
                    dvreqservice.Visible = false;
                    dvsubmit.Visible = false;
                }
                else
                {
                    ContentTitle.InnerHtml = "Select legal advisor(s) you will like to contact!";
                    if (!IsPostBack)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript", "getLocation()", true);
                        RBtnLocation.SelectedValue = "1";
                    }
                  
                    dvConfirmPermission.Visible = true;
                    dvCoordinate.Visible = true;

                }
            }
            else
            {
                dsAdvisorwithAdd.SelectParameters[0].DefaultValue = Context.User.Identity.Name;
                ContentTitle.InnerHtml = "Your previously contacted advisor(s)";
                dvreqservice.Visible = false;
                dvsubmit.Visible = false;
            }
      

            // Control master page nav menu based on the log on user.
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
            //Control clientWrapper = Master.FindControl("AdvisorWrapper");
            //if (clientWrapper != null)
            //{
            //    clientWrapper.Visible = false;
            //}

            // call method to update latitude & logitude
            if (!IsPostBack)
            {
                UpdateMissingLatAndLon();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string rtnemail = Context.User.Identity.Name;
            MethodCollections methodCollections = new MethodCollections();

            // Get details of the current user

            DataTable tblClient = methodCollections.GetClientByEmail(rtnemail);

            ASPxGridView gvClient = new ASPxGridView()
            {
                DataSource = tblClient
            };
            gvClient.DataBind();
            Int32 rowcount = gvClient.VisibleRowCount;
            string clientName = string.Empty;
            string phoneNumber = string.Empty;
            string sex = string.Empty;
            string pronoun = string.Empty;
            Int32 clientid = 0;

            if (rowcount > 0)
            {
                clientName = gvClient.GetRowValues(0, "FirstName").ToString();
                clientid = Convert.ToInt32(gvClient.GetRowValues(0, "Clientid").ToString());
                phoneNumber = gvClient.GetRowValues(0, "Telephone").ToString();
                sex = gvClient.GetRowValues(0, "Gender").ToString();
                pronoun = sex == "Male" ? "him" : "her";
                pronoun = string.IsNullOrEmpty(pronoun) ? "him / her" : pronoun;
            }


            lblNotification.Visible = false;
            //List<object> Emails = gvAdvisorWithAdd.GetSelectedFieldValues(["Email"]);
            List<object> Emails = gvAdvisorWithAdd.GetSelectedFieldValues("Email");
            List<object> firstNames = gvAdvisorWithAdd.GetSelectedFieldValues("AdvisorFirstName");
            List<object> addressids = gvAdvisorWithAdd.GetSelectedFieldValues("Addressid");

            if (Emails.Count == 0)
            {
                lblNotification.Text = "You must select advisor(s) from the table!!";
                lblNotification.Visible = true;
            }
            else
            {
                foreach (object email in Emails)
                {
                    foreach (object firstName in firstNames)
                    {
                        foreach (object addressid in addressids)
                        {
                            string fname = string.IsNullOrWhiteSpace(firstName.ToString()) ? "Advisor" : firstName.ToString();

                            string msgBody = "<p>Dear " + fname + ",</p>" + 
                                "<p>" + clientName + " is a new client that requires your service as detailed below: </p>" +
                                "<p>" + morequiredService.Text + "</p>"  + 
                                "<p> Kindly contact " + pronoun + " via this email: " + rtnemail + " or contact number: " + phoneNumber + "</p><br/>" +
                                "<p>Yours faithfully,</p>" + 
                                "<p>N2U Team.</>";


                            //Logger.SendEmail(msgBody, "Immigration Assistance Enquiry", email.ToString());
                            Logger.SendEmail(msgBody, "Immigration Assistance Enquiry", email.ToString());

                            methodCollections.LinkClientWithAdvisorAddress(clientid, Convert.ToInt32(addressid), morequiredService.Text);
                        }
                    }
                }
            }
        }

        // Update address where latitude and logitude values are missings
        public void UpdateMissingLatAndLon()
        {
            ASPxGridView gvAddress = new ASPxGridView();
            ASPxGridView gvData = new ASPxGridView();

            MethodCollections mthdCol = new MethodCollections();
            DataTable dataTable = mthdCol.GetAddress();
            gvData.DataSource = dataTable;
            gvData.DataBind();
            Int32 rc = gvData.VisibleRowCount;
            if (rc > 0)
            {
                for (Int32 i = 0; i < rc; i++)
                {
                    string id = gvData.GetRowValues(i, "Addressid").ToString();
                    string postcode = gvData.GetRowValues(i, "Postcode").ToString();

                    dynamic dynamicObj = JsonConvert.DeserializeObject(mthdCol.GetGeoCode(postcode));
                    gvAddress.DataSource = dynamicObj;
                    gvAddress.DataBind();

                    string lat = gvAddress.GetRowValues(0, "lat").ToString();
                    string lon = gvAddress.GetRowValues(0, "lon").ToString();

                    mthdCol.UpdateAddressLatAndLon(id, lat, lon);
                }
            }
        }

        protected void RBtnLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RBtnLocation.SelectedValue == "1" && string.IsNullOrEmpty(txtbxLat.Text) || string.IsNullOrEmpty(txtbxLon.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript", "getLocation()", true);
            }
            else
            {
                txtbxLat.Text = string.Empty;
                txtbxLon.Text = string.Empty;

                // refresh the datasource to get all validated advisors
                dsAdvisorwithAdd.SelectParameters["email"].DefaultValue = "all";
                dsAdvisorwithAdd.SelectParameters["lat"].DefaultValue = "0";
                dsAdvisorwithAdd.SelectParameters["lon"].DefaultValue = "0";
                dsAdvisorwithAdd.SelectParameters["distance"].DefaultValue = "2";
                dsAdvisorwithAdd.DataBind();

                // refresh the gridview
                gvAdvisorWithAdd.DataBind();

            }
        }

        protected void RBtnPreferredDistance_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lat;
            string lon;
            string dist;

            if (string.IsNullOrEmpty(txtbxLat.Text) || string.IsNullOrEmpty(txtbxLon.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript", "getLocation()", true);
                lat = txtbxLat.Text;
                lon = txtbxLon.Text;
            }
            else
            {
                lat = txtbxLat.Text;
                lon = txtbxLon.Text;
            }
               dist = RBtnPreferredDistance.SelectedValue;

            dsAdvisorwithAdd.SelectParameters["lat"].DefaultValue = lat;
            dsAdvisorwithAdd.SelectParameters["lon"].DefaultValue = lon;
            dsAdvisorwithAdd.SelectParameters["distance"].DefaultValue = dist;

            gvAdvisorWithAdd.DataBind();
        }
    }
}