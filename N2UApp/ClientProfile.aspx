<%@ Page Title="Client Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientProfile.aspx.cs" Inherits="N2UApp.ClientProfile" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbl" runat="server" />

    <asp:FormView ID="fvClientProfile" runat="server" DataKeyNames="Clientid" DataSourceID="dsClient_CRUD" Width="459px">


        <ItemTemplate>
            <div class="row">
                <h2>Your Profile.</h2>
                <br />
                <div class="col-md-12">
                    <section id="ReadForm">
                        <div class="form-horizontal">
                            <%--  Clientid:--%>
                            <asp:Label ID="ClientidLabel" Visible="false" runat="server" CssClass="form-control" Text='<%# Eval("Clientid") %>' />
                            <br />
                            Title:
            <asp:Label ID="TitleLabel" runat="server" CssClass="form-control" Text='<%# Bind("Title") %>' />
                            <br />
                            First Name:
            <asp:Label ID="FirstNameLabel" runat="server" CssClass="form-control" Text='<%# Bind("FirstName") %>' />
                            <br />
                            Last Name:
            <asp:Label ID="LastNameLabel" runat="server" CssClass="form-control" Text='<%# Bind("LastName") %>' />
                            <br />
                            Gender:
            <asp:Label ID="GenderLabel" runat="server" CssClass="form-control" Text='<%# Bind("Gender") %>' />
                            <br />
                            Telephone:
            <asp:Label ID="TelephoneLabel" runat="server" CssClass="form-control" Text='<%# Bind("Telephone") %>' />
                            <br />
                            Email:
            <asp:Label ID="EmailLabel" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>' />
                            <br />
                            Client Type:
            <asp:Label ID="ClientTypeidLabel" runat="server" CssClass="form-control" Text='<%# Bind("ClientType") %>' />
                            <br />
                            <div>
                                <asp:Button ID="BtnShowEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="BtnShowEdit_Click" />
                                <%--<asp:LinkButton ID="EditButton" runat="server" CssClass="row btn btn-primary" CausesValidation="False" CommandName="Edit" Text="Edit" />--%>
                                <%-- &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CssClass="row btn btn-secondary" CausesValidation="False" CommandName="New" Text="New" />--%>
                            </div>
                    </section>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <br />
    <div id="dvEdit" runat="server" class="row" visible="false" style="align-content: flex-start;">
        <div class="col-md-12">
            <section id="EditForm">
                <div class="form-horizontal">

                    <p class="text-danger">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Visible="false">Clientid</asp:Label>
                        <div class="col-md-10">
                            <asp:Label ID="ClientidLabel1" runat="server" AutoPostBack="false" CssClass="form-control" Visible="false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Title</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList
                                ID="DDlTitle1"
                                runat="server"
                                CssClass="form-control"
                                DataSourceID="dsGetTitle"
                                DataTextField="Title"
                                DataValueField="Titleid"
                                Width="400px" />
                        </div>
                        <asp:CompareValidator runat="server" CssClass="text-danger"
                            ErrorMessage="Title field is required" ControlToValidate="DDlTitle1" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">First Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="FirstNameTextBox1" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="FirstName field is required" ControlToValidate="FirstNameTextBox1" CssClass="text-danger"></asp:RequiredFieldValidator >
                       
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Last Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="LastNameTextBox1" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                          <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="LastName field is required" ControlToValidate="LastNameTextBox1" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Gender</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList
                                ID="DDLGender1"
                                runat="server"
                                CssClass="form-control"
                                DataSourceID="dsGender"
                                DataTextField="Gender"
                                DataValueField="Genderid"
                                Width="400px" />
                        </div>
                        <asp:CompareValidator runat="server" CssClass="text-danger"
                            ErrorMessage="Gender field is required" ControlToValidate="DDLGender1" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AutoPostBack="false" AssociatedControlID="TelephoneTextBox1" CssClass="col-md-2 control-label">Telephone</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TelephoneTextBox1" runat="server" TextMode="Phone" CssClass="form-control" Width="400px" ToolTip="Phone number must start with '0'" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TelephoneTextBox1"
                                CssClass="text-danger" ErrorMessage="Phone number is not valid."  />
                     
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EmailTextBox1" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="EmailTextBox1" runat="server" TextMode="Email" CssClass="form-control" Width="400px" ReadOnly="True" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailTextBox1"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Client Type</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList
                                ID="DDlClientTypeid1"
                                runat="server"
                                CssClass="form-control"
                                DataSourceID="dsGetClientType"
                                DataTextField="ClientType"
                                DataValueField="ClientTypeid"
                                Width="400px" />
                        </div>
                        <asp:CompareValidator runat="server" CssClass="text-danger"
                            ErrorMessage="Client Type field is required" ControlToValidate="DDlClientTypeid1" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
                    </div>
                    <div style="margin-left: 25px">
                        <asp:Button ID="BtnUpdate" runat="server" CssClass="row btn btn-primary" OnClick="BtnUpdate_Click" Text="Save" />
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="BtnCancel" runat="server" CssClass="row btn btn-secondary" OnClick="BtnCancel_Click" Text="Cancel" />
                    </div>
                </div>
            </section>
        </div>
    </div>

    <asp:SqlDataSource ID="dsClient_CRUD" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
        SelectCommand="usp_GetClient" SelectCommandType="StoredProcedure"
        UpdateCommand="usp_UpdateClient" UpdateCommandType="StoredProcedure">

        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" DefaultValue="nat@gmail.com" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="Titleid" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Gender" Type="Int32" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ClientTypeid" Type="Int32" />
            <asp:Parameter Name="Clientid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsGetClientType" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
        SelectCommand="usp_GetClientType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGetTitle" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
        SelectCommand="usp_GetTitle" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsGender" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
        SelectCommand="usp_GetGender" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
