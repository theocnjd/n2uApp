using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N2UApp
{
    public partial class ClientProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MethodCollections methodCollections = new MethodCollections();
            string email = Context.User.Identity.Name; // methodCollections.GetLogonEmail(Context.User.Identity.Name);

            dsClient_CRUD.SelectParameters[0].DefaultValue = email;
            fvClientProfile.DataBind();

            // store the current user first name
            //Session["ContextName"] = ((Label)fvClientProfile.FindControl("FirstNameLabel")).Text;

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
        }
        protected void BtnShowEdit_Click(object sender, EventArgs e)
        {
            if (fvClientProfile.CurrentMode == FormViewMode.ReadOnly)
            {
                ClientidLabel1.Text = ((Label)fvClientProfile.FindControl("ClientidLabel")).Text;
                FirstNameTextBox1.Text = ((Label)fvClientProfile.FindControl("FirstNameLabel")).Text;               
                LastNameTextBox1.Text = ((Label)fvClientProfile.FindControl("LastNameLabel")).Text;
                
                var title = ((Label)fvClientProfile.FindControl("TitleLabel")).Text;
                if (string.IsNullOrEmpty(title) || string.IsNullOrWhiteSpace(title))
                {
                    DDlTitle1.SelectedValue = "0";
                }
                else if (title == "Master")
                {
                    DDlTitle1.SelectedValue = "1";
                }
                else if (title == "Miss")
                {
                    DDlTitle1.SelectedValue = "2";
                }
                else if (title == "Mr")
                {
                    DDlTitle1.SelectedValue = "3";
                }
                else
                {
                    DDlTitle1.SelectedValue = "4";
                }


                var clientType = ((Label)fvClientProfile.FindControl("ClientTypeidLabel")).Text;
                if (string.IsNullOrEmpty(clientType) || string.IsNullOrWhiteSpace(clientType))
                {
                    DDlClientTypeid1.SelectedValue = "0";
                }
                else if (clientType == "Student")
                {
                    DDlClientTypeid1.SelectedValue = "1";
                }
                else if (clientType == "Visitor")
                {
                    DDlClientTypeid1.SelectedValue = "2";
                }
                else
                {
                    DDlClientTypeid1.SelectedValue = "3";
                }
                var gender = ((Label)fvClientProfile.FindControl("GenderLabel")).Text;
                if (string.IsNullOrEmpty(gender) || string.IsNullOrWhiteSpace(gender))
                {
                    DDLGender1.SelectedValue = "0";
                }
                else if (gender == "Female")
                {
                    DDLGender1.SelectedValue = "1";

                }
                else if (gender == "Male")
                {
                    DDLGender1.SelectedValue = "2";
                }
               
                TelephoneTextBox1.Text = ((Label)fvClientProfile.FindControl("TelephoneLabel")).Text;
                EmailTextBox1.Text = ((Label)fvClientProfile.FindControl("EmailLabel")).Text;

                dvEdit.Visible = true;
            }
            fvClientProfile.Visible = false;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            dsClient_CRUD.UpdateParameters["Titleid"].DefaultValue = DDlTitle1.SelectedValue;
            dsClient_CRUD.UpdateParameters["FirstName"].DefaultValue = FirstNameTextBox1.Text;
            dsClient_CRUD.UpdateParameters["LastName"].DefaultValue = LastNameTextBox1.Text;
            dsClient_CRUD.UpdateParameters["Gender"].DefaultValue = DDLGender1.SelectedValue;
            dsClient_CRUD.UpdateParameters["Telephone"].DefaultValue = TelephoneTextBox1.Text;
            dsClient_CRUD.UpdateParameters["Email"].DefaultValue = EmailTextBox1.Text;
            dsClient_CRUD.UpdateParameters["ClientTypeid"].DefaultValue = DDlClientTypeid1.SelectedValue;
            dsClient_CRUD.UpdateParameters["Clientid"].DefaultValue = ClientidLabel1.Text;
            dsClient_CRUD.Update();

            dsClient_CRUD.Update();

            dvEdit.Visible = false;
            fvClientProfile.DataBind();
            fvClientProfile.Visible = true;
        }
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            dvEdit.Visible = false;
            fvClientProfile.DataBind();
            fvClientProfile.Visible = true;
        }
    }
}