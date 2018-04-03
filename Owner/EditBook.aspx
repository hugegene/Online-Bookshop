<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditBook.aspx.cs" Inherits="Owner_Default" MasterPageFile="../MasterPage.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
        <div>
            <br />
            <asp:GridView ID="bListView" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" Height="152px" Width="838px" OnRowCancelingEdit="OnRowCancelingEdit" OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" OnSelectedIndexChanged="bListView_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BookID" SortExpression="BookID">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("BookID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author" SortExpression="Author">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount" SortExpression="Discount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Discount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Discount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=BookshopEntities" DefaultContainerName="BookshopEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Books">
            </asp:EntityDataSource>
            <br />

            <div />
            <div>

                <asp:Label ID="bkTitleLabel" runat="server" Text="Book Title"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="bkTitleSearchB" runat="server" Width="286px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="bkTitleSBtn" runat="server" Text="Search" OnClick="bkTitleSBtn_Click" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button ID="bkTitleRBtn" runat="server" Text="Refresh" OnClick="bkTitleRBtn_Click" />
              
            </div>

             <p>
                 <br />
                  </p>
</asp:Content>
  
