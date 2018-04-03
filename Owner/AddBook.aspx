<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="Owner_Add" MasterPageFile="../MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <h2>Add New Book</h2>
    <br />
    <br />
    <br />
    <table class="auto-style1" border="0">

        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Title"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="bkTitleTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="bkTitleTB"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="CategoryID"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="catIDTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="catIDTB"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="ISBN"></asp:Label>

            </td>
            <td class="auto-style2">
                <asp:TextBox ID="isbnTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="isbnTB"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="isbnTB" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Author"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="authorTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="authorTB"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Stock"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="stockTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="stockTB"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Price"></asp:Label>

            </td>
            <td class="auto-style2">
                <asp:TextBox ID="priceTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="priceTB"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Discount"></asp:Label>

            </td>
            <td class="auto-style2">
                <asp:TextBox ID="discountTB" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="discountTB"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label11" runat="server"></asp:Label>
    <br />

    <br />
    <asp:Button ID="creBkBtn" runat="server" Text="Create" OnClick="creBkBtn_Click" />
    &nbsp;&nbsp;&nbsp;
                <asp:Button ID="refBkBtn2" runat="server" Text="Refresh" Style="height: 26px" UseSubmitBehavior="False" CausesValidation="False" OnClick="refBkBtn2_Click" />
    <br />

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="headPlaceHolder">
    <style type="text/css">
        .auto-style1 {
            width: 41%;
            position: absolute;
            left: 336px;
            top: 222px;
        }

        .auto-style2 {
            width: 850px;
        }
    </style>
</asp:Content>

