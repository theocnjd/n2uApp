<%@ Page Title="AdvisorProfile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvisorProfile.aspx.cs" Inherits="N2UApp.AdvisorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        /*#map {
        height: 100%;
      }*/

        /* Optional: Makes the sample page fill the window. */
        /*html,
      body {
        height:auto;
        margin: 0;
        padding: 0;
      }*/

        #locationField,
        #controls {
            position: relative;
            width: 480px;
        }

        #autocomplete {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 99%;
        }

        .label {
            text-align: right;
            font-weight: bold;
            width: 130px;
            color: #303030;
            font-family: "Roboto", Arial, Helvetica, sans-serif;
        }

        #address {
            border: 1px solid #000090;
            background-color: #f0f9ff;
            width: 480px;
            padding-right: 2px;
        }

            #address td {
                font-size: 10pt;
            }

        .field {
            width: 99%;
        }

        .slimField {
            width: 80px;
        }

        .wideField {
            width: 200px;
        }

        #locationField {
            height: 20px;
            margin-bottom: 2px;
        }

        .PcPostion {
            z-index: 100000;
        }
    </style>


    <%--<dx:ASPxLabel ID="lblTest" Font-Size="Medium" ForeColor="Green" runat="server" ></dx:ASPxLabel>--%>
    <div id="dvGetAddress" hidden="hidden">
        <div id="locationField">
            <input
                id="autocomplete"
                placeholder="Enter your address"
                onfocus="geolocate()"
                type="text" />
        </div>
        <br />
        <table id="address">
            <tr>
                <td>
                    <asp:Label ID="lbl1" runat="server" Text="Street number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="street_number" runat="server" Width="150px" ClientIDMode="Static"></asp:TextBox></td>
                <td>&nbsp;&nbsp</td>
                <td>
                    <asp:Label ID="lbl2" runat="server" Text="Street"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="route" runat="server" Width="300px" ClientIDMode="Static"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lbl3" runat="server" Text="City"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="postal_town" runat="server" Width="150px" ClientIDMode="Static"></asp:TextBox></td>
                <td>&nbsp;&nbsp</td>
                <td>
                    <asp:Label ID="lbl4" runat="server" Text="Postcode"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="postal_code" runat="server" Width="150px" ClientIDMode="Static"></asp:TextBox></td>
            </tr>

            <%--      <tr>
            <td><asp:Label ID="lbl5" runat="server" Text="Region"></asp:Label> </td>
                <td><asp:TextBox ID="administrative_area_level_1" runat="server" Width="300px" ClientIDMode="Static"></asp:TextBox></td>
              <td>&nbsp;&nbsp</td>
          <%--  <td><asp:Label ID="lbl6" runat="server" Text="Country"></asp:Label> </td>
               <td> <asp:TextBox ID="country" runat="server" Width="300px" ClientIDMode="Static"></asp:TextBox></td>
            <td><asp:Label ID="lbl8" runat="server" Text="Locality"></asp:Label> </td>
            <td><asp:TextBox ID="locality" runat="server" Width="300px" ClientIDMode="Static"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td><asp:Label ID="lbl7" runat="server" Text="County"></asp:Label> </td>
            <td><asp:TextBox ID="administrative_area_level_2" runat="server" Width="150px" ClientIDMode="Static"></asp:TextBox></td>
            <td>&nbsp;&nbsp</td>
            <td>&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp</td>
            
        </tr>--%>
        </table>

    </div>

    <!-- Collapsable Card Example -->
    <div class="card shadow mb-4">
        <!-- Card Header - Accordion -->
        <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
            role="button" aria-expanded="true" aria-controls="collapseCardExample">
            <h6 class="m-0 font-weight-bold text-primary">New Legal Advisor</h6>
        </a>
        <!-- Card Content - Collapse -->
        <div class="collapse show" id="collapseCardExample">
            <div class="card-body">
                <asp:Label ID="lbl_Advisorid" runat="server"  Visible="false" />
                <div id="dvEdit" runat="server" class="row" visible="true" style="align-content: flex-start;">
                    <div class="col-md-12">
                        <section id="InsertForm">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtbxBusinessName" CssClass="col-md-3 control-label">Registered Business Name</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtbxBusinessName" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbxBusinessName"
                                            CssClass="text-danger" ErrorMessage="Business name field is required." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtbxEmail" CssClass="col-md-2 control-label">Email</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtbxEmail" runat="server" TextMode="Email" CssClass="form-control" Width="400px" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbxEmail"
                                            CssClass="text-danger" ErrorMessage="The email field is required." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" CssClass="col-md-2 control-label">Website</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="TxtbxWebsite" runat="server"  CssClass="form-control" Width="400px" ToolTip="Text must include: HTTP" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="DDlRegulatoryAuthority" CssClass="col-md-3 control-label">Regulatory Authority</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList
                                            ID="DDlRegulatoryAuthority"
                                            runat="server"
                                            CssClass="form-control"
                                            DataSourceID="dsGeRegulatoryAuthority"
                                            DataTextField="RegulatoryAuthority"
                                            DataValueField="RegulatoryAuthorityid"
                                            Width="400px" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DDlRegulatoryAuthority"
                                            CssClass="text-danger" ErrorMessage="Regulatory Authority field is required." />
                                    </div>
                                </div>

                                <div style="margin-left: 25px">
                                    <asp:Button ID="BtnCreateAdvisor" runat="server" CssClass="row btn btn-primary"  Text="Create Advisor" OnClick="BtnCreateAdvisor_Click" />
                                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        
                                </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsGeRegulatoryAuthority" runat="server" ConnectionString="<%$ ConnectionStrings:New2UkDB_CS %>"
        SelectCommand="usp_GetRegulatoryAuthority" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


    <script src="Scripts/AutoComplate.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbpMrOCpxEKk6Vv9cQuBQ6cJ-0OcYLNjU&callback=initAutocomplete&libraries=places&v=weekly" defer="defer">
    </script>
</asp:Content>
