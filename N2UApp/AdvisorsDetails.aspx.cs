using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N2UApp
{
    public partial class AdvisorsDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MethodCollections methodCollections = new MethodCollections();
            string email = Context.User.Identity.Name;
            Session["userEmail"] = email;
            if (Request.QueryString.AllKeys.Contains("usertypeid"))
            {
                var usertypeid = Request.QueryString["usertypeid"];
                if (Convert.ToInt32(usertypeid) == 3)
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
                    
                    dsGetAdvisor.SelectParameters[0].DefaultValue = email;
                    gvCompany.DataBind();
                    gvCompany.Columns["ValidatedDate"].Visible = false;
                    gvCompany.Columns["ValidationStatusid"].Visible = false;
                   // gvCompany.VisibleColumns["Delete"].Visible = false;
                   
                    
                    
                    //set the gridview to allow advisor to type in his details
                    if (gvCompany.VisibleRowCount == 0)
                    {
                        gvCompany.AddNewRow();
                        gvCompany.InitNewRow += gvCompany_InitNewRow;
                        AdvisorBanner.InnerHtml = "Create your organisation profile";
                    }
                    else
                    {
                        gvCompany.DetailRows.ExpandRow(0);
                        AdvisorBanner.InnerHtml = "Manage your organisation details here!";
                    }
                }
                else if (Convert.ToInt32(usertypeid) == 1)
                {
                    Control dashboardWrapper = Master.FindControl("DashboardWrapper");
                    if (dashboardWrapper != null)
                    {
                        dashboardWrapper.Visible = false;
                    }
                    Control advisorWrapper = Master.FindControl("AdvisorWrapper");
                    if (advisorWrapper != null)
                    {
                        advisorWrapper.Visible = false;
                    }
                    Control clientWrapper = Master.FindControl("ClientWrapper");
                    if (clientWrapper != null)
                    {
                        clientWrapper.Visible = false;
                    }
                    dsGetAdvisor.SelectParameters[0].DefaultValue = "all";
                }
                else
                {
                    dsGetAdvisor.SelectParameters[0].DefaultValue = "all";
                }
            }
            if (!IsPostBack)
            {
                gvCompany.DataBind();
                gvCompany.DetailRows.ExpandRow(0);
            }
            gvCompany.DataBind();
        }

        protected void gvCompany_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Email"] = Session["userEmail"];
        }

        protected void gvAddress_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["LegalAdvisorid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gvPersonnel_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["Addressid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gvAddress_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["LegalAdvisorid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            string legaladvisorid = Session["LegalAdvisorid"].ToString();
            dsGetAddress.InsertParameters[9].DefaultValue = legaladvisorid;
        }

        protected void gvPersonnel_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["Addressid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            string addressid = Session["Addressid"].ToString();
            dsGetPersonnel.InsertParameters[5].DefaultValue = addressid;
        }


        //protected void btnGetErrorColumn_Click(object sender, EventArgs e)
        //{
        //    lblErrorColumn.Visible = false;
        //    string _text = TxbxGetErrorColumn.Value;
        //    string _tblName = dsEONElec.SelectCommand.ToString();
        //    //Response.Write(var);
        //    string SqlConn = conn.ConnStr();
        //    if (IsPostBack)
        //    {
        //        using (SqlConnection cn = new SqlConnection(SqlConn))
        //        {
        //            SqlCommand cmd = new SqlCommand("uspGetErrorColumnDetail", cn);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add("@text", SqlDbType.VarChar).Value = _text;
        //            cmd.Parameters.Add("@tblName", SqlDbType.VarChar).Value = _tblName;
        //            cmd.CommandTimeout = 60;
        //            //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //            cn.Open();
        //            try
        //            {
        //                //cmd.ExecuteNonQuery();

        //                SqlDataReader dr = cmd.ExecuteReader();
        //                ErrorColumnGrid.DataSource = dr;
        //                ErrorColumnGrid.DataBind();
        //                ErrorColumnGrid.DataColumns[0].Caption = _text;
        //                //ErrorColumnGrid.SettingsText.Title = "Search result for " + _text;
        //                //ErrorColumnGrid.Settings.ShowTitlePanel = true;
        //                //ErrorColumnGrid.DataColumns[1].Caption = "Valid";
        //                ErrorColumnGrid.Visible = true;

        //            }

        //            catch (SqlException ex)
        //            {


        //                if (ex.Number == 207)
        //                {
        //                    lblErrorColumn.Text = "Column name \'" + _text + "\' is not valid.";

        //                    lblErrorColumn.ForeColor = System.Drawing.Color.Red;
        //                    lblErrorColumn.Visible = true;
        //                }
        //                else if (ex.Number == 208)
        //                {
        //                    lblErrorColumn.Text = "Table name \'" + _tblName.Replace(_tblName.Substring(0, 6), "") + "\' is not available.";
        //                    lblErrorColumn.ForeColor = System.Drawing.Color.Red;
        //                    lblErrorColumn.Visible = true;
        //                }
        //                else
        //                {
        //                    lblErrorColumn.Text = ex.Message;
        //                    lblErrorColumn.ForeColor = System.Drawing.Color.Red;
        //                    lblErrorColumn.Visible = true;
        //                }
        //            }
        //            finally
        //            {
        //                cn.Close();
        //            }
        //        }
        //    }
        //}
    }
}