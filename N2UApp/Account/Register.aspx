<%@ Page Title="Register" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="N2UApp.Register" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="Content/sb-admin-2.min.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"  >

    <div class="col-lg-6 " style="align-content: center; top: 50%; left: 50%; position: absolute; transform: translate(-50%, -50%); background-color:indigo" height: auto" >
        <div class="form-horizontal">
            <h4 style="color:white;margin-left:10px">Create a new account</h4>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
           <%-- <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">UserName</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" Text="UserName" Width="400px" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                        CssClass="text-danger" ErrorMessage="The user name field is required." />
                </div>
            </div>--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" ForeColor="White" CssClass="col-md-4 control-label">Email address</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Width="400px" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" ForeColor="White" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Width="400px" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" ForeColor="White" CssClass="col-md-4 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" Width="400px" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="cmbxusertypeid" ForeColor="White" CssClass="col-md-3 control-label">Usage type</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="cmbxusertypeid" 
                        runat="server"
                        DataSourceID="dsGetUserType"
                        DataTextField="UserTypeDesc" 
                        DataValueField="UserTypeid" 
                        style="width:400px"
                        CssClass="form-control"
                        SelectedImdex="0"
                        >
                    </asp:DropDownList>
                   
                    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger"  
                        ErrorMessage="Usage Type field is required" ControlToValidate="cmbxusertypeid" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10 ">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsGetUserType" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>" SelectCommand="usp_GetUserType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </div>
    
    <%--   </form>
</body>
</html>--%>
</asp:Content>
