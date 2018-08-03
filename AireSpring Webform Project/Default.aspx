<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AireSpring_Webform_Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .validationField {
            color: red;
        }

        .row {
            margin-left: 0px;
        }

        .employeeGridview {
            margin-top: 20px;
        }

        .submitButton {
            margin-top: 20px;
        }

        .sortByDropdownlist {
            padding-right: 2px;
        }
    </style>

    <div class="row">
        <div class="col-md-6">
            <div class="jumbotron">
                <h2 style="margin-top:0px;">Employee Info</h2>

                <div id="dError" runat="server" visible="False" class="alert alert-danger">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>
                        <asp:Label ID="lblError" runat="server" Text="sdlfkjsdlfjsdfljk" /></strong>
                </div>

                <div class="row">
                    <label>ID</label>
                    <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvId" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Id Required" ControlToValidate="txtEmployeeId"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvId2" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Please enter a valid number" ControlToValidate="txtEmployeeId" ValidationExpression="^[1-9][0-9]*$">
                    </asp:RegularExpressionValidator>
                </div>

                <div class="row">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtEmployeeLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Last Name Required" ControlToValidate="txtEmployeeLastName"></asp:RequiredFieldValidator>
                </div>

                <div class="row">
                    <label>First Name</label>
                    <asp:TextBox ID="txtEmployeeFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="First Name Required" ControlToValidate="txtEmployeeFirstName"></asp:RequiredFieldValidator>
                </div>

                <div class="row">
                    <label>Phone</label>
                    <asp:TextBox ID="txtEmployeePhone" runat="server" CssClass="form-control" placeholder="(XXX)XXX-XXXX"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Phone Required" ControlToValidate="txtEmployeePhone"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvPhone2" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Please use correct format" ControlToValidate="txtEmployeePhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                    </asp:RegularExpressionValidator>
                </div>

                <div class="row">
                    <label>Zip</label>
                    <asp:TextBox ID="txtEmployeeZip" runat="server" CssClass="form-control" placeholder="Zip"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Zip Required" ControlToValidate="txtEmployeeZip"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvZip2" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Please enter a valid number" ControlToValidate="txtEmployeeZip" ValidationExpression="^[1-9][0-9]*$">
                    </asp:RegularExpressionValidator>
                </div>

                <div class="row">
                    <label>Hire Date</label>
                    <asp:TextBox ID="txtEmployeeHireDate" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHireDate" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Hire Date Required" ControlToValidate="txtEmployeeHireDate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvHireDate2" runat="server" Display="Dynamic" CssClass="validationField"
                        ErrorMessage="Please use correct format" ControlToValidate="txtEmployeeHireDate" ValidationExpression="^\d{1,2}/\d{1,2}/\d{4}$">
                    </asp:RegularExpressionValidator>
                </div>

                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary submitButton" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <div class="col-md-6">
            <div class="row" style="margin-top: 15px;">
                <div class="col-md-2" style="padding-right: 0px; padding-top: 6px;">
                    <label>Search By </label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSortBy" runat="server" AutoPostBack="false" CssClass="form-control sortByDropdownlist">
                        <asp:ListItem Selected="True" Value="LastName"> Last Name </asp:ListItem>
                        <asp:ListItem Value="Phone"> Phone </asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <asp:TextBox ID="txtSearchBy" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnSearch" CausesValidation="false" runat="server"
                        CssClass="form-control" Text="Search" OnClick="btnSearch_Click" />
                </div>
            </div>

            <asp:GridView ID="gvEmployee" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" AllowPaging="True" runat="server"
                CssClass="table table-hover table-striped employeeGridview" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID"
                        SortExpression="Id" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name"
                        SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name"
                        SortExpression="FirstName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone"
                        SortExpression="Phone" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip"
                        SortExpression="Zip" />
                    <asp:BoundField DataField="HireDate" HeaderText="Hire Date"
                        SortExpression="HireDate" DataFormatString="{0:MM/dd/yyyy}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
