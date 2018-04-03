<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" Runat="Server">
    <p>
    <br />
    <asp:Label ID="LabSummaryCart" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButLogin" runat="server" Text="Login to Buy" OnClick="ButLogin_Click" />
</p>
<p>
    &nbsp;</p>
<asp:GridView ID="GridViewCartDetails" runat="server" AllowPaging="True" HorizontalAlign="Center">
    <Columns>
        <asp:CheckBoxField />
    </Columns>
</asp:GridView>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ButRemoveColumn" runat="server" Height="31px" OnClick="ButRemoveColumn_Click" Text="Remove Cart" Width="109px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabTotalTxt" runat="server" Text="Total:"></asp:Label>
&nbsp;<asp:Label ID="LabTotalPrice" runat="server" Font-Bold="True" Font-Underline="True"></asp:Label>
<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="ButBuy" runat="server" Enabled="False" OnClick="ButBuy_Click" Text="Buy" Height="42px" Width="62px" />
<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="LabErrorMsg" runat="server"></asp:Label>
<br />
<br />
<asp:Button ID="ButContShop" runat="server" OnClick="ButContShop_Click" Text="Continue Shopping" Height="39px" Width="190px" />
</asp:Content>

