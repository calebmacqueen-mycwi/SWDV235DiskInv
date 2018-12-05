<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="borrowedReport.aspx.cs" 
    Inherits="borrowedReport" Title ="Report"%>
<%--Caleb MacQueen 11/29/2018 Page Created
    Caleb MacQueen 12/05/2018 Added ListView, and embedded styles--%>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            width: 100%;
        }
        td {
            width: 25%;
        }
    </style>
</asp:Content>

<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <form id="form1" runat="server">
    <h1>Here is a summary of all checked out disks.</h1>
        <%--<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            CssClass="table table-bordered table-condensed" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CD_name" HeaderText="CD Name" SortExpression="CD_name" />
                <asp:BoundField DataField="Borrower_Name" HeaderText="Borrower Name" SortExpression="Borrower_Name" />
                <asp:BoundField DataField="Borrowed_Date" HeaderText="Borrowed Date" SortExpression="Borrowed_Date" />
                <asp:BoundField DataField="Returned_Date" HeaderText="Returned Date" SortExpression="Returned_Date" />
            </Columns>
        </asp:GridView> --%> <%--Switched to luistview to meet the requirement of the assignment  --%>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
           
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:TextBox ID="CD_nameTextBox" runat="server" Text='<%# Bind("CD_name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Borrower_NameTextBox" runat="server" Text='<%# Bind("Borrower_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Borrowed_DateTextBox" runat="server" Text='<%# Bind("Borrowed_Date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Returned_DateTextBox" runat="server" Text='<%# Bind("Returned_Date") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="CD_nameLabel" runat="server" Text='<%# Eval("CD_name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Borrower_NameLabel" runat="server" Text='<%# Eval("Borrower_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Borrowed_DateLabel" runat="server" Text='<%# Eval("Borrowed_Date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Returned_DateLabel" runat="server" Text='<%# Eval("Returned_Date") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" Class="table table-bordered table-condensed">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="" CssClass="table table-bordered table-condensed">
                                <tr runat="server" style="">
                                    <th runat="server">CD_name</th>
                                    <th runat="server">Borrower_Name</th>
                                    <th runat="server">Borrowed_Date</th>
                                    <th runat="server">Returned_Date</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" SelectCommand="SELECT CD_name, Borrower_Name, Borrowed_Date, Returned_Date
FROM Borrowers
	JOIN Loan_History ON Borrowers.Borrower_ID = Loan_History.Borrower_ID
	JOIN CD ON Loan_History.CD_ID = CD.CD_ID
ORDER BY CD_name, Returned_Date">
        </asp:SqlDataSource>
    </form>
</asp:content>
