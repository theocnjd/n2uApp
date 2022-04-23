<%@ Page Title="Correspondence" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Correspondences.aspx.cs" Inherits="N2UApp.Correspondences" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 id="CorrespondenceBanner" runat="server" style="align-content:center" >Use the table below to manage registered legal advisors</h2>
        <br />
    <dx:ASPxCardView ID="cvCorrespondence" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetCorrespondence" KeyFieldName="LinkClientWithAdvisorid" Width="100%" CssClass="form-control-lg">
        <SettingsPager>
            <SettingsTableLayout ColumnCount="1" />
        </SettingsPager>
        <SettingsAdaptivity>
            <BreakpointsLayoutSettings CardsPerRow="1">
            </BreakpointsLayoutSettings>
        </SettingsAdaptivity>
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

<SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

        <Columns>
            <dx:CardViewTextColumn FieldName="LinkClientWithAdvisorid" ReadOnly="True" Visible="False" >
            </dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="RegisteredBusinessName" VisibleIndex="0">
            </dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="ClientName" ReadOnly="True" VisibleIndex="1">
            </dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="RatingDesc" VisibleIndex="6" Caption="Rating">
              
             
              
                <EditItemTemplate>
                    <dx:ASPxRadioButtonList ID="rdBtnRating" runat="server" Value='<%# Bind("RatingDesc") %>' 
                        DataSourceID="dsGetRating" RepeatDirection="Horizontal" TextField="RatingDesc" ValueField="RatingDesc" ValueType="System.String" Width="100%">
                    </dx:ASPxRadioButtonList>
                </EditItemTemplate>
              
            </dx:CardViewTextColumn>
            <dx:CardViewMemoColumn FieldName="RequiredService" VisibleIndex="2">
            </dx:CardViewMemoColumn>
            <dx:CardViewMemoColumn FieldName="Comment" VisibleIndex="3">
            </dx:CardViewMemoColumn>
            <dx:CardViewMemoColumn FieldName="Response" VisibleIndex="4">
            </dx:CardViewMemoColumn>
            <dx:CardViewMemoColumn FieldName="Review" VisibleIndex="5">
            </dx:CardViewMemoColumn>
        </Columns>
        <CardLayoutProperties>
            <Items>
                <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right" ShowEditButton="True">
                </dx:CardViewCommandLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="RegisteredBusinessName">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="ClientName">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="RequiredService">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="Review">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="Response">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="Comment">
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="Rating">
                  
                </dx:CardViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
            <SettingsItemCaptions Location="Top" />
            <SettingsItems Width="100%" />
        </CardLayoutProperties>

<StylesExport>
<Card BorderSize="1" BorderSides="All"></Card>

<Group BorderSize="1" BorderSides="All"></Group>

<TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

<Tab BorderSize="1"></Tab>
</StylesExport>
    </dx:ASPxCardView>
    <br />
 

    <asp:SqlDataSource ID="dsGetCorrespondence" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" 
        SelectCommand="usp_GetNoteReviewAndComment" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_UpdateLinkClientWithAdvisorAddress" UpdateCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="email" Type="String" DefaultValue="admin@attention" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Review" Type="String" />
        <asp:Parameter Name="Comment" Type="String" />
        <asp:Parameter Name="Response" Type="String" />
        <asp:Parameter Name="RatingDesc" Type="String" />
        <asp:Parameter Name="RequiredService" Type="String" />
        <asp:Parameter Name="LinkClientWithAdvisorid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGetRating" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" SelectCommand="usp_GetRating" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
