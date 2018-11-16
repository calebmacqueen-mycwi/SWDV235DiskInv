<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="disk.aspx.cs" Inherits="disk" Title ="Disk"%>

<asp:Content ID="main" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1>Use this interface to edit, delete, or remove items from the database.</h1>
    <form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CD_ID"
            CssClass="table table-bordered table-condensed" DataSourceID="SqlDataSource2"
            OnRowDeleted="grdCD_RowDeleted" OnRowUpdated="grdCD_RowUpdated">
            <Columns>
                
               
                <asp:TemplateField HeaderText="ID" ControlStyle-CssClass="">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtID" runat="server" 
                                        MaxLength="15" CssClass="form-control disabled"  
                                        Text='<%# Bind("CD_ID") %>'></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridID" runat="server" 
                                    Text='<%# Bind("CD_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:TemplateField HeaderText="CD Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("CD_Name") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridName" runat="server" 
                                    ControlToValidate="txtGridName" ValidationGroup="Edit" 
                                    ErrorMessage="CD Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridName" runat="server" 
                                    Text='<%# Bind("CD_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtStatus" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("StatusType") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" 
                                    ControlToValidate="txtStatus" ValidationGroup="Edit" 
                                    ErrorMessage="Status is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" 
                                    Text='<%# Bind("StatusType") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>
                <asp:TemplateField HeaderText="Genre">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridGenre" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Genre") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridGenre" runat="server" 
                                    ControlToValidate="txtGridGenre" ValidationGroup="Edit" 
                                    ErrorMessage="Genre is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridGenre" runat="server" 
                                    Text='<%# Bind("Genre") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Release Date">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridRelease" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Release_Date") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridRelease" runat="server" 
                                    ControlToValidate="txtGridRelease" ValidationGroup="Edit" 
                                    ErrorMessage="Release Date is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Use format: MM/DD/YYYY" ControlToValidate="txtGridRelease" Operator="DataTypeCheck"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridRelease" runat="server" 
                                    Text='<%# Bind("Release_Date") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="Edit"/>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DIConnection %>" DeleteCommand="SPdeleteCD" DeleteCommandType="StoredProcedure" InsertCommand="SPinsertCD" InsertCommandType="StoredProcedure" SelectCommand="SELECT CD_ID, CD_Name, StatusType, Genre, Release_Date FROM CD" UpdateCommand="SPupdateCD" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="CD_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="N" Type="String" />
                <asp:Parameter Name="S" Type="String" />
                <asp:Parameter Name="G" Type="String" />
                <asp:Parameter DbType="Date" Name="RD" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CD_ID" Type="Int32" />
                <asp:Parameter Name="CD_Name" Type="String" />
                <asp:Parameter Name="StatusType" Type="String" />
                <asp:Parameter Name="Genre" Type="String" />
                <asp:Parameter DbType="Date" Name="Release_Date" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Edit"/>
                <asp:DetailsView ID="dvCD" runat="server" CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" DataKeyNames="CD_ID" DataSourceID="SqlDataSource2"
                    defaultMode="Insert" OnItemInserted="dvCD_ItemInserted">
                    <HeaderTemplate><p>To create a new CD, enter the information 
                    and click Insert</p></HeaderTemplate>
                    <Fields>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="CDtxt">CD Name:</label>
                                <asp:RequiredFieldValidator ID="rfvCD" runat="server" Display="Dynamic" 
                                    ControlToValidate="CDtxt" CssClass="text-danger"
                                    ErrorMessage="CD Name is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="CDtxt" runat="server" 
                                    Text='<%# Bind("N") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Statustxt">Status:</label>
                                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" Display="Dynamic" 
                                    ControlToValidate="Statustxt" CssClass="text-danger"
                                    ErrorMessage="Status is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Statustxt" runat="server" 
                                    Text='<%# Bind("S") %>' CssClass="form-control" />  
                                </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="Gtxt">Genre:</label>
                                <asp:RequiredFieldValidator ID="rfvG" runat="server" Display="Dynamic" 
                                    ControlToValidate="Gtxt" CssClass="text-danger"
                                    ErrorMessage="Genre is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="Gtxt" runat="server" 
                                    Text='<%# Bind("G") %>' CssClass="form-control" />  
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <InsertItemTemplate>
                                <label for="RDtxt">Release Date:</label>
                                <asp:RequiredFieldValidator ID="rfvRD" runat="server" Display="Dynamic" 
                                    ControlToValidate="RDtxt" CssClass="text-danger"
                                    ErrorMessage="Release Date is a required field." Text="*"
                                    ValidationGroup="insertVal">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ErrorMessage="Please enter a date in this format: MM/DD/YYYY"
                                    ControlToValidate="RDtxt" Type="Date" ValidationGroup="insertVal" 
                                    Operator="DataTypeCheck"></asp:CompareValidator>
                                <asp:TextBox ID="RDtxt" runat="server" 
                                    Text='<%# Bind("RD") %>' CssClass="form-control" />  
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
