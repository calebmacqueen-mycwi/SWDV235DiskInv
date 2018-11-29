<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="borrowedReport.aspx.cs" 
    Inherits="borrowedReport" Title ="Report"%>

<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <form id="form1" runat="server">
    <h1>Here is a summary of all checked out disks.</h1>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            CssClass="table table-bordered table-condensed" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CD_name" HeaderText="CD Name" SortExpression="CD_name" />
                <asp:BoundField DataField="Borrower_Name" HeaderText="Borrower Name" SortExpression="Borrower_Name" />
                <asp:BoundField DataField="Borrowed_Date" HeaderText="Borrowed Date" SortExpression="Borrowed_Date" />
                <asp:BoundField DataField="Returned_Date" HeaderText="Returned Date" SortExpression="Returned_Date" />
            </Columns>
        </asp:GridView> <%--CSS styles format like a table --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" SelectCommand="SELECT CD_name, Borrower_Name, Borrowed_Date, Returned_Date
FROM Borrowers
	JOIN Loan_History ON Borrowers.Borrower_ID = Loan_History.Borrower_ID
	JOIN CD ON Loan_History.CD_ID = CD.CD_ID
ORDER BY CD_name, Returned_Date">
        </asp:SqlDataSource>
    </form>
</asp:content>
