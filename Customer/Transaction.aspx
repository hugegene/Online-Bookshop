<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Transaction" MasterPageFile="../MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

        <section style="padding-top:30px;">
            <article>
                <div class="ui grid" style="margin: 0 20px 0 20px">
                    <div class="column">
                        <div class="ui raised segment text-left">
                            <a class="ui red ribbon label" style="font-size:x-large;">Thank you for shopping with us!</a>
                            <div style="padding-top:5px;font-size:medium;">Transaction Details</div>
                            <div class="ui two column grid" style="padding-top:10px;">
                                <div class="column">
                                    <div class="ui raised segment">
                                        <a class="ui blue ribbon label" style="font-size:large;" >Transaction ID:</a>
                                        <asp:TextBox ID="TextBoxTranID" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="ui segment">
                                        <a class="ui orange ribbon label">Transaction Date: </a>
                                        <asp:TextBox ID="TextBoxTranDate" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            <br />
            <br />
            <article>
                <div class="ui grid" style="margin: 0 20px 0 20px">
                    <div class="ui link cards">
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
            </article>
        </section>

        <footer>
            <div class="ui grid" style="margin: 30px 20px 30px 20px">
                <label>Total Price: </label>
                <input id="InputTotalPrice" runat="server" aria-readonly="False" readonly="readonly" />
            </div>
            <div class="ui grid" style="margin: 0 20px 0 40px">
                <asp:Button ID="Button1" CssClass="positive ui button" runat="server" Text="Continue Shopping" OnClick="Button1_Click" />
            </div>
        </footer>

</asp:Content>
