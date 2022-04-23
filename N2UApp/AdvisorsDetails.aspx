<%@ Page Title="Advisors Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvisorsDetails.aspx.cs" Inherits="N2UApp.AdvisorsDetails" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<form runat="server" id="advForm">--%>
      <h2 id="AdvisorBanner" runat="server" style="align-content:center" >Use the table below to manage registered legal advisors</h2>
        <br />
 <%--   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />--%>
        <dx:ASPxGridView ID="gvCompany" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetAdvisor" KeyFieldName="LegalAdvisorid"  Width="100%" EnableTheming="True" OnInitNewRow="gvCompany_InitNewRow">
            <SettingsDetail ShowDetailRow="True" />
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="gvAddress" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetAddress" EnableTheming="True" KeyFieldName="Addressid" OnBeforePerformDataSelect="gvAddress_BeforePerformDataSelect"  Width="100%" OnRowInserting="gvAddress_RowInserting">
                        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="gvPersonnel" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetPersonnel" KeyFieldName="LegalAdvisorPersonnelid" OnBeforePerformDataSelect="gvPersonnel_BeforePerformDataSelect" Width="100%" OnRowInserting="gvPersonnel_RowInserting">
                                    <Settings ShowFilterRow="True" GridLines="Horizontal" />
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <SettingsCommandButton>
                                        <UpdateButton Text="Save">
                                        </UpdateButton>
                                        <CancelButton>
                                            <Styles>
                                                <Style>
                                                    <Paddings PaddingLeft="15px" />
                                                </Style>
                                            </Styles>
                                        </CancelButton>
                                    </SettingsCommandButton>
                                    <SettingsPopup>
                                        <HeaderFilter MinHeight="140px">
                                        </HeaderFilter>
                                    </SettingsPopup>
                                    <EditFormLayoutProperties>
                                        <SettingsItemCaptions Location="Top" />
                                    </EditFormLayoutProperties>
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowClearFilterButton="True"  ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="LegalAdvisorPersonnelid" ReadOnly="True" Visible="False" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Addressid" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PersonnalTelephone" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="CreatedDate" Visible="False" VisibleIndex="8">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn FieldName="LastUpdated" Visible="False" VisibleIndex="9">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="Titleid" VisibleIndex="3" Caption="Title">
                                            <PropertiesComboBox DataSourceID="dsGetTitle" TextField="Title" ValueField="Titleid">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                         <dx:GridViewCommandColumn  ShowDeleteButton="True" Caption ="Delete" VisibleIndex="10">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="Gender" VisibleIndex="6">
                                            <PropertiesComboBox>
                                                <Items>
                                                    <dx:ListEditItem Text="Female" Value="Female" />
                                                    <dx:ListEditItem Text="Male" Value="Male" />
                                                </Items>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <Settings ShowFilterRow="True" GridLines="Horizontal" />
                        <SettingsBehavior ConfirmDelete="True" />
                        <SettingsCommandButton>
                            <UpdateButton Text="Save">
                            </UpdateButton>
                            <CancelButton>
                                <Styles>
                                    <Style>
                                        <Paddings PaddingLeft="15px" />
                                    </Style>
                                </Styles>
                            </CancelButton>
                        </SettingsCommandButton>
                        <SettingsPopup>
                            <HeaderFilter MinHeight="140px">
                            </HeaderFilter>
                        </SettingsPopup>
                        <EditFormLayoutProperties>
                            <SettingsItemCaptions Location="Top" />
                        </EditFormLayoutProperties>
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True"  ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Addressid" ReadOnly="True" Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="StreetNo" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Addressline 1" FieldName="Addressline1" VisibleIndex="3">
                                <PropertiesTextEdit>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Addressline 2" FieldName="Addressline2" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Postcode" VisibleIndex="7">
                                <PropertiesTextEdit>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Latitude" Visible="False" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Longitude" Visible="False" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="BusinessTelephone" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn  ShowDeleteButton="True" Caption="Delete"  VisibleIndex="11">
                            </dx:GridViewCommandColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <Settings ShowFilterRow="True" GridLines="Horizontal" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <UpdateButton Text="Save">
                </UpdateButton>
                <CancelButton>
                    <Styles>
                        <Style>
                            <Paddings PaddingLeft="15px" />
                        </Style>
                    </Styles>
                </CancelButton>
            </SettingsCommandButton>
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <EditFormLayoutProperties>
                <SettingsItemCaptions Location="Top" />
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowSelectCheckbox="True" VisibleIndex="0"  ShowEditButton="True" ShowNewButtonInHeader="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="LegalAdvisorid" Visible="False" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RegisteredBusinessName" VisibleIndex="2" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3" ShowInCustomizationForm="True" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Website" VisibleIndex="4" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreatedDate" Visible="False" VisibleIndex="8" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="LastUpdated" Visible="False" VisibleIndex="9" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="ValidatedDate" VisibleIndex="10" ShowInCustomizationForm="True">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Validatedby" VisibleIndex="11" ShowInCustomizationForm="True" Caption="Validated by" Visible="False">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                  <dx:GridViewCommandColumn  VisibleIndex="12" ShowDeleteButton="True" Caption="Delete" Name="Delete" >
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Validation Status" FieldName="ValidationStatusid" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="dsGetValStatus" TextField="ValidationStatus" ValueField="ValidationStatusid">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Regulatory Authority" FieldName="RegulatoryAuthorityid" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="dsGetRegAuth" TextField="RegulatoryAuthority" ValueField="RegulatoryAuthorityid">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsGetAdvisor" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" 
            SelectCommand="usp_GetLegalAdvisor" SelectCommandType="StoredProcedure" 
            DeleteCommand="usp_DeleteLegalAdvisor" DeleteCommandType="StoredProcedure" 
            UpdateCommand="usp_UpdateLegalAdvisor" UpdateCommandType="StoredProcedure" 
            InsertCommand="usp_InsertLegalAdvisor" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="LegalAdvisorid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RegisteredBusinessName" Type="String" /> 
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="ValidationStatusid" Type="Byte" DefaultValue ="1" />
                <asp:Parameter Name="RegulatoryAuthorityid" Type="Byte" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="all" Name="Email" QueryStringField="Email" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="RegisteredBusinessName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="ValidationStatusid" Type="Byte" />
                <asp:Parameter Name="LegalAdvisorid" Type="Int32" />
                <asp:Parameter Name="RegulatoryAuthorityid" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
     
        <br />
        <asp:SqlDataSource ID="dsGetAddress" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" 
            SelectCommand="usp_GetAddress" SelectCommandType="StoredProcedure" 
            DeleteCommand="usp_DeleteAddress" DeleteCommandType="StoredProcedure" 
            InsertCommand="usp_InsertAddress" InsertCommandType="StoredProcedure" 
            UpdateCommand="usp_UpdateAddress" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Addressid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StreetNo" Type="String" />
                <asp:Parameter Name="Addressline1" Type="String" />
                <asp:Parameter Name="Addressline2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Postcode" Type="String" />
                <asp:Parameter Name="Latitude" Type="String" />
                <asp:Parameter Name="Longitude" Type="String" />
                <asp:Parameter Name="BusinessTelephone" Type="String" />
                <asp:Parameter Name="LegalAdvisorid" Type="Int32" />
                <asp:Parameter Direction="InputOutput" Name="Addressid" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="LegalAdvisorid" SessionField="LegalAdvisorid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="StreetNo" Type="String" />
                <asp:Parameter Name="Addressline1" Type="String" />
                <asp:Parameter Name="Addressline2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Postcode" Type="String" />
                <asp:Parameter Name="Latitude" Type="String" />
                <asp:Parameter Name="Longitude" Type="String" />
                <asp:Parameter Name="BusinessTelephone" Type="String" />
                <asp:Parameter Name="Addressid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsGetPersonnel" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" 
            SelectCommand="usp_GetLegalAdvisorPersonnel" SelectCommandType="StoredProcedure" 
            DeleteCommand="usp_DeleteAdvisorPersonnel" DeleteCommandType="StoredProcedure" 
            InsertCommand="usp_InsertLegalAdvisorPersonnel" InsertCommandType="StoredProcedure" 
            UpdateCommand="usp_UpdateLegalAdvisorPersonnel" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="LegalAdvisorPersonnelid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="PersonnalTelephone" Type="String" />
                <asp:Parameter Name="Titleid" Type="Int32" />
                <asp:Parameter Name="Addressid" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Addressid" SessionField="Addressid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="PersonnalTelephone" Type="String" />
                <asp:Parameter Name="Titleid" Type="Int32" />
                <asp:Parameter Name="Addressid" Type="Int32" />
                <asp:Parameter Name="LegalAdvisorPersonnelid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <asp:SqlDataSource ID="dsGetValStatus" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" SelectCommand="usp_GetValidationStatus" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="dsGetRegAuth" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" SelectCommand="usp_GetRegulatoryAuthority" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsGetTitle" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" SelectCommand="usp_GetTitle" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>


        <br />
      
<%--    </form>--%>
</asp:Content>
