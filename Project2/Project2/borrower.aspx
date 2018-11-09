<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="borrower.aspx.cs" Inherits="borrower" Title ="Borrower"%>
<%--Caleb MacQueen 11/9/2018 Page Created --%>
<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h3>Please enter information for a new borrower.</h3>
    <form id="form1" runat="server" class="form-horizontal">
    <div class="form-group">
                    <label class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                            ControlToValidate="txtFirstName" text="*" CssClass="text-danger" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
        <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                            ControlToValidate="txtLastName" text="*" CssClass="text-danger" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
        <br />
        <div class="form-group">
                    <label class="col-sm-3 control-label">Telephone number</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                            ControlToValidate="txtPhone" text="*" CssClass="text-danger" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="txtPhone" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                        </asp:RegularExpressionValidator>    
                    </div>
                </div>
        <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                             CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                             CssClass="btn btn-primary" CausesValidation="false"  />
                    </div>
                </div> 
            
                <%-- message label --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-11">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
                    </div>
                </div>
    </form>
</asp:Content>
