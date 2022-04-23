<%@ Page Title="Log in" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="N2UApp.Login" Async="true" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="Content/sb-admin-2.min.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <div class="col-lg-6 " style="align-content: center; top: 50%; left: 50%; position: absolute; transform: translate(-50%, -50%); height: auto; background-color:indigo" runat="server">
            <h2 style="color:white;margin-left:10px">Login to your account</h2>
            <div class="row">
                <div class="col-md-12">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <%--  <h4>Use a local account to log in.</h4>
                            <hr />--%>
                            <br />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" ForeColor="White" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email Address</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Width="400px" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="The email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ForeColor="White" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" Width="400px" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <div class="checkbox">
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <asp:Label runat="server" ForeColor="White" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" ForeColor="White" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                                  
                                </div>
                            </div>
                        </div>
                        <p>
                            <asp:HyperLink runat="server" ForeColor="White" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                        </p>
                        <p>
                            <%-- Enable this once you have account confirmation enabled for password reset functionality--%>
                    <asp:HyperLink runat="server" ForeColor="White" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                            
                        </p>
                    </section>
                </div>

                <div class="col-md-4">
                    <section id="socialLoginForm">
                        <%-- <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />--%>
                    </section>
                </div>
            </div>
        </div>
 <%--   </form>
</body>
</html>--%>
    </asp:Content>
