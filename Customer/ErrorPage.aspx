<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="Customer_ErrorPage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" Runat="Server">
    <section style="padding-top:30px;">
            <article>
                <div class="ui grid" style="margin: 0 20px 0 20px">
                    <div class="column">
                        <div class="ui raised segment text-left">
                            <a class="ui red ribbon label" style="font-size:x-large;" >Error</a>
                            <div style="padding-top:0px;"></div>
                            <div class="ui two column grid" style="padding-top:10px;">
                                <div class="column">
                                    <div class="ui raised segment">
                                        <a class="ui blue ribbon label" style="font-size:large;">Transaction Failed. Your cart has been deleted.</a>
                                        <br />
                                        <br />
                                        <br />
                <asp:Button ID="ButContShop" CssClass="positive ui button" runat="server" Text="Continue Shopping" OnClick="Button1_Click" />
                                    </div>
                                </div>
                                <div class="column">
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
</asp:Content>

