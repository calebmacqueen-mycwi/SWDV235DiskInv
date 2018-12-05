<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Check out a Disk.aspx.cs" 
    Inherits="Check_out_a_Disk" Title ="Check Out"%>

<%-- Caleb MacQueen 11/29/2018 Page Created--%>

<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <form runat="server">
    <br />
        <%--Use a details view to provide a convenient layout for my form --%>
    <asp:DetailsView ID="dvLoan" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
        CssClass="table table-bordered table-condensed" DataKeyNames="CD_ID"
        defaultMode="Insert" OnItemInserted="dvLoan_ItemInserted">
        <HeaderTemplate><p>To check out a disk, select the information and click insert.</p></HeaderTemplate>
        <Fields>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="CDddl">CD:</label>
                        <asp:DropDownList ID="CDddl" runat="server" CssClass="form-control" DataSourceID="sqlDataSourceCD" 
                            DataTextField="CD_name" DataValueField="CD_ID" SelectedValue='<%# Bind("CD_ID") %>'>
                        </asp:DropDownList>
                 </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate><%--B is for Borrower --%>
                    <label for="Bddl">Borrower:</label>
                        <asp:DropDownList ID="Bddl" runat="server" CssClass="form-control" DataSourceID="sqlDataSourceB" 
                            DataTextField="Borrower_name" DataValueField="Borrower_ID" SelectedValue='<%# Bind("Borrower_ID") %>'>
                        </asp:DropDownList>
                 </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <label for="Datetxt">Date:</label>
                    <asp:TextBox ID="Datetxt" runat="server" CssClass="form-control" TextMode="Date" 
                        Text='<%# Bind("Date") %>'></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please enter a date" ControlToValidate="Datetxt" 
                        CssClass="text-danger"></asp:RequiredFieldValidator>
                 </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True"/>

        </Fields>
    </asp:DetailsView>
        <%--I wrote a new stored procedure for the insert, in order to compartmentalize the code more--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" InsertCommand="spInsertLoan" InsertCommandType="StoredProcedure" SelectCommand="SELECT Borrower_ID, CD_ID, Borrowed_Date FROM Loan_History">
        <InsertParameters>
            <asp:Parameter Name="CD_ID" Type="Int32" />
            <asp:Parameter Name="Borrower_ID" Type="Int32" />
            <asp:Parameter Name="Date" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCD" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" SelectCommand="SELECT [CD_name], [CD_ID] FROM [CD] WHERE StatusType = 'Returned'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceB" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" SelectCommand="SELECT [Borrower_Name], [Borrower_ID] FROM [Borrowers]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    </form>
</asp:content>
