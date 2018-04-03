<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageInv.aspx.cs" Inherits="Owner_ManageInv" MasterPageFile="../MasterPage.master"%>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="headPlaceHolder">
    <style type="text/css">
        .auto-style1 {
            position: absolute;
        }
    </style>
    <</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="bodyPlaceHolder">
    <asp:Button ID="UpdInvBtn" runat="server" Height="101px" PostBackUrl="~/Owner/EditBook.aspx" Text="Update Inventory" Width="401px" Font-Size="Larger" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="CreNewBkBtn" runat="server" Height="101px" PostBackUrl="~/Owner/AddBook.aspx" Text="Create New Book" Width="400px" Font-Size ="Larger" />
</asp:Content>


