<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="artist.aspx.cs" Inherits="artist" Title="Artist"%>
<%-- Caleb MacQueen 11/16/2018 Page Created --%>
<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1>Use this interface to edit, delete, or remove items from the database.</h1>
    <form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Artist_ID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource2"
            OnRowDeleted="grdA_RowDeleted" OnRowUpdated="grdA_RowUpdated">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                            <EditItemTemplate>                                
                                <asp:TextBox ID="IDtxt" runat="server" 
                                    Text='<%# Bind("Artist_ID") %>' CssClass="form-control disabled" />  
                            </EditItemTemplate>
                    <ItemTemplate>
                                <asp:Label ID="lblGridID" runat="server" 
                                    Text='<%# Bind("Artist_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvFName" runat="server" Display="Dynamic" 
                                    ControlToValidate="FNametxt" CssClass="text-danger"
                                    ErrorMessage="First Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="FNametxt" runat="server" 
                                    Text='<%# Bind("Artist_First_Name") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                    <ItemTemplate>
                                <asp:Label ID="lblGridFName" runat="server" 
                                    Text='<%# Bind("Artist_First_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvLName" runat="server" Display="Dynamic" 
                                    ControlToValidate="LNametxt" CssClass="text-danger"
                                    ErrorMessage="Last Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="LNametxt" runat="server" 
                                    Text='<%# Bind("Artist_Last_Name") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLName" runat="server" 
                                    Text='<%# Bind("Artist_Last_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ID="rfvType" runat="server" Display="Dynamic" 
                                    ControlToValidate="Typetxt" CssClass="text-danger"
                                    ErrorMessage="Artist Type is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Typetxt" runat="server" 
                                    Text='<%# Bind("Artist_Type") %>' CssClass="form-control" />  
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridType" runat="server" 
                                    Text='<%# Bind("Artist_Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="Desctxt" runat="server" 
                                    Text='<%# Bind("Artist_Desc") %>' CssClass="form-control" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridDesc" runat="server" 
                                    Text='<%# Bind("Artist_Desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" DeleteCommand="SPdeleteArtist" DeleteCommandType="StoredProcedure" InsertCommand="SPinsertArtist" InsertCommandType="StoredProcedure" SelectCommand="SELECT Artist_ID, Artist_First_Name, Artist_Last_Name, Artist_Type, Artist_Desc FROM Artist" UpdateCommand="SPupdateArtist" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Artist_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FN" Type="String" />
                <asp:Parameter Name="LN" Type="String" />
                <asp:Parameter Name="T" Type="String" />
                <asp:Parameter Name="D" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Artist_Desc" Type="String" />
                <asp:Parameter Name="Artist_ID" Type="Int32" />
                <asp:Parameter Name="Artist_First_Name" Type="String" />
                <asp:Parameter Name="Artist_Last_Name" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvCD" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="Artist_ID" DataSourceID="SqlDataSource2"
                    defaultMode="Insert" OnItemInserted="dvA_ItemInserted">
                    <HeaderTemplate><p>To create a new Artist, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="FNametxt">Arist First Name:</label>
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
                                <label for="LNametxt">Arist Last Name:</label>
                                <asp:RequiredFieldValidator ID="rfvLName" runat="server" Display="Dynamic" 
                                    ControlToValidate="LNametxt" CssClass="text-danger"
                                    ErrorMessage="Last Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="LNametxt" runat="server" 
                                    Text='<%# Bind("LN") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Typetxt">Arist Type:</label>
                                <asp:RequiredFieldValidator ID="rfvType" runat="server" Display="Dynamic" 
                                    ControlToValidate="Typetxt" CssClass="text-danger"
                                    ErrorMessage="Artist Type is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Typetxt" runat="server" 
                                    Text='<%# Bind("T") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Desctxt">Arist Description:</label>
                                <asp:TextBox ID="Desctxt" runat="server" 
                                    Text='<%# Bind("D") %>' CssClass="form-control" />
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" ValidationGroup="insertVal"/>
                    </Fields>
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
