<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="borrower.aspx.cs" Inherits="borrower" Title ="Borrower"%>
<%--Caleb MacQueen 11/9/2018 Page Created
    Caleb MacQueen 11/16/2018 DB Connection added, edit,update,delete added
    Caleb MacQueen 12/03/2018 Added RegEx Val to insert phone number field--%>
<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h3>You may use this information to edit borrower profiles, or to add a new borrower.</h3>
    <form id="form1" runat="server" class="form-horizontal">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Borrower_ID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource2"
            OnRowDeleted="grdCategories_RowDeleted" OnRowUpdated="grdCategories_RowUpdated">
            <Columns>
                
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Borrower_ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name: ">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridShortName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Borrower_Name") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridShortName" runat="server" 
                                    ControlToValidate="txtGridShortName" ValidationGroup="Edit" 
                                    ErrorMessage="First Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridShortName" runat="server" 
                                    Text='<%# Bind("Borrower_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridLName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("BorrowerLName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridLName" runat="server" 
                                    ControlToValidate="txtGridLName" ValidationGroup="Edit" 
                                    ErrorMessage="Last Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLName" runat="server" 
                                    Text='<%# Bind("BorrowerLName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone Number">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridPhone" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Borrower_Phone") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridPhone" runat="server" 
                                    ControlToValidate="txtGridPhone" ValidationGroup="Edit" 
                                    ErrorMessage="Phone Number is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="txtGridPhone" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ErrorMessage="Please enter the phone number in the correct format."
                                    ValidationGroup="Edit">
                        </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridPhone" runat="server" 
                                    Text='<%# Bind("Borrower_Phone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="Edit"/>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" DeleteCommand="SPdeleteBorrower" DeleteCommandType="StoredProcedure" InsertCommand="SPinsertBorrower" InsertCommandType="StoredProcedure" SelectCommand="SELECT Borrower_ID, Borrower_Name, BorrowerLName, Borrower_Phone FROM Borrowers" UpdateCommand="SPupdateBorrower" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Borrower_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FN" Type="String" />
                <asp:Parameter Name="LN" Type="String" />
                <asp:Parameter Name="P" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Borrower_ID" Type="Int32" />
                <asp:Parameter Name="Borrower_Name" Type="String" />
                <asp:Parameter Name="BorrowerLName" Type="String" />
                <asp:Parameter Name="Borrower_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvBorrower" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="Borrower_ID" DataSourceID="SqlDataSource2"
                    defaultMode="Insert" OnItemInserted="dvBorrower_ItemInserted">
                    <HeaderTemplate><p>To create a new Borrower, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="FName">First Name:</label>
                                <asp:RequiredFieldValidator ID="rfvFName" runat="server" Display="Dynamic" 
                                    ControlToValidate="FNametxt" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="FNametxt" runat="server" 
                                    Text='<%# Bind("FN") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="LNtxt">Last Name:</label>
                                <asp:RequiredFieldValidator ID="rfvLN" runat="server" Display="Dynamic" 
                                    ControlToValidate="LNtxt" CssClass="text-danger"
                                    ErrorMessage="Last Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="LNtxt" runat="server" 
                                    Text='<%# Bind("LN") %>' CssClass="form-control" />  
                                </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Ptxt">Phone Number:</label>
                                <asp:RequiredFieldValidator ID="rfvP" runat="server" Display="Dynamic" 
                                    ControlToValidate="Ptxt" CssClass="text-danger"
                                    ErrorMessage="Phone Number is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revP" runat="server" 
                            ControlToValidate="Ptxt" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ErrorMessage="Please enter the phone number in the correct format."
                                    ValidationGroup="insertVal">
                        </asp:RegularExpressionValidator>
                                <asp:TextBox ID="Ptxt" runat="server" 
                                    Text='<%# Bind("P") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" ValidationGroup="insertVal"/>
                    </Fields>
                    <HeaderStyle CssClass="bg-halloween"/>
                </asp:DetailsView>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="insertVal"
                    CssClass="text-danger"/>
          
                <%-- message label --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-11">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
    </form>
</asp:Content>
