<%@ Page Title="Contact Advisors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactAdvisors.aspx.cs" Inherits="N2UApp.ContactAdvisors" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .textfg{
            padding-right:15px;
        }
    </style>
    <asp:Label ID="lblTest" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="dvConfirmPermission" class="col-md-12" runat="server" visible="false" style="display: inline-flex;">
        <div class="col-md-3">
            <div class="col-md-6">
                <asp:Label ID="lblConfirmPermission" runat="server" AutoPostBack="false" Text="Use your location" />
            </div>

            <div class="col-md-6">
             
                        <asp:RadioButtonList ID="RBtnLocation" runat="server"  OnSelectedIndexChanged="RBtnLocation_SelectedIndexChanged" AutoPostBack="True" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                        </asp:RadioButtonList>
                
            </div>

        </div>

        <div class="col-md-9">
            <div class="col-md-9">
                <asp:Label ID="lblPreferredDistance" runat="server" AutoPostBack="false" Text="Preferred Distance (miles)" />
            </div>

            <div class="col-md-9">
                <asp:RadioButtonList ID="RBtnPreferredDistance" runat="server" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="RBtnPreferredDistance_SelectedIndexChanged">
                    <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
                    <asp:ListItem Value="5"> 5</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="50">50</asp:ListItem>
                    <asp:ListItem Value="250">250</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <hr />
    <div style="width: auto">
        <div class="container-fluid">
            <h3 id="ContentTitle" runat="server"></h3>

            <dx:ASPxGridView ID="gvAdvisorWithAdd" runat="server" AutoGenerateColumns="False" DataSourceID="dsAdvisorwithAdd" KeyFieldName="id" Width="100%">
                <Settings ShowFilterRow="True" />
                <SettingsPopup>
                    <HeaderFilter MinHeight="140px"></HeaderFilter>
                </SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RegisteredBusinessName" VisibleIndex="2" SortIndex="2" SortOrder="Ascending">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3" SortIndex="1" SortOrder="Ascending">
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FullAddress" ReadOnly="True" VisibleIndex="5">
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LinkAddWithAdvisorid" Visible="False" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LegalAdvisorid" Visible="False" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BusinessTelephone" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Addressid" Visible="False" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AdvisorFirstName" Visible="False" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn FieldName="Website" VisibleIndex="4" SortIndex="0" SortOrder="Ascending">
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataTextColumn FieldName="FullName" VisibleIndex="7" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsAdvisorwithAdd" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
                SelectCommand="usp_GetLegalAdvisorWithAddress" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="all" Name="email" Type="String" />
                    <asp:Parameter DefaultValue="0" Name="lat" Type="Double" />
                    <asp:Parameter DefaultValue="0" Name="lon" Type="Double" />
                    <asp:Parameter DefaultValue="2" Name="distance" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <div id="dvreqservice" runat="server" class="container-fluid">
            <h3>Briefly describe your required service.</h3>
            <dx:ASPxMemo ID="morequiredService" runat="server" Height="120px" Width="100%" Font-Size="Medium"></dx:ASPxMemo>
        </div>
        <br />
        <div id="dvsubmit" runat="server" style="margin-left: 25px">
            <dx:ASPxLabel ID="lblNotification" runat="server" CssClass="text-danger" Visible="false" />
            <dx:ASPxButton ID="BtnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="BtnSubmit_Click">
                   <ClientSideEvents Click="function(s, e) {
                    LoadingPanel.Show();
                    }" />

            </dx:ASPxButton>
        </div>

        
        <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Text="contacting advisor(s)................"
                Modal="True">
            <Image Url="~/img/Loading_Motion_2.gif">
            </Image>
        </dx:ASPxLoadingPanel>
        <script type="text/javascript">
            $(function () {
                $("#BtnSubmit").on('click', function () {
                  
                    $("#LoadingPanel").show();
                });
            });
            </script> 
     
            
        <br />
             <br />
        <dx:ASPxLabel ID="lblLoadResult" runat="server" />



    </div>
    <div id="dvCoordinate" runat="server" style="display:none">
        <asp:TextBox ID="txtbxLat" runat="server" ClientIDMode="Static"  />
        <asp:TextBox ID="txtbxLon" runat="server" ClientIDMode="Static"  />

       <%-- <input type="text" id="txtbxLat1" runat="server" />
         <input type="text" id="txtbxLon1" runat="server" />--%>
    </div>
    <script src="Scripts/getUserLocation.js" ></script>
</asp:Content>
