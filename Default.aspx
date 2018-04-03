<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <asp:label id="Label6" runat="server" text="Label"></asp:label>

    <nav class="navbar navbar-inverse navbar-fixed-top" style="margin-top: 50px">
        <div class="container-fluid"><span class="pull-left">
            <asp:textbox id="Textbox1" runat="server" onfocus="if (this.value=='Search Author/Title') this.value=''" type="text" onblur="(this.value=='') this.value='Search Author/Title'" value="Search Author/Title" Font-Italic="True"></asp:textbox>
            <asp:button id="Button2" runat="server" text="Search" OnClick="Button2_Click" />
            </span>
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:updatepanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
<asp:Timer id="Timer1" Interval="2000" runat="server"></asp:Timer>
                    <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlDataSource1" CssClass="ad" />
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="XMLFile.xml" />
                    </ContentTemplate>
        </asp:updatepanel>
        </div>
    </nav>



    <div class="row">
        <asp:Repeater id="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
            <div class="col-sm-12 col-md-4 col-lg-2">
                <div class="thumbnail" style="min-height:360px;">
                    <image src="images/<%# Eval("ISBN") %>.jpg" width="200" height="200"></image>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title").ToString().Length <= 30 ? Eval("Title") : Eval("Title").ToString().Substring(0, 30)+"..." %>'>
                                    </asp:Label>
                      
                                    <br />
                   
                                     <asp:Label ID="Label2" runat="server" Text='<%#Eval("Author") %>'>
                                    </asp:Label>
               
                                    <br />
                    <asp:Label ID="Label7" runat="server" Text='<%# string.Format("{0:C}", (Convert.ToDouble(Eval("Price"))*(100-(Convert.ToDouble(Eval("Discount"))))*0.01)) %>'></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Visible='<%# Eval("Discount") != null && Convert.ToDouble(Eval("Discount"))>0 %>' Text='<%#"$"+Eval("Price") %>' Font-Strikeout="true" Font-Size="Smaller" CssClass="text-muted">
                                    </asp:Label>
                                    <br /><span class="bottomaligned">
                                    <asp:Button ID="Label4" CommandName="addbooktocart" class="btn-primary" CommandArgument='<%#Eval("BookID") %>' runat="server" Text="Add to cart">
                                    </asp:Button>
                                        </span>
                        </div>
            </div>                  
        </ItemTemplate>
    </asp:Repeater>
    </div>


    <%--                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class ="floating">
                            <table style="width:100%;">
                                <tr><image src="images/<%# Eval("ISBN") %>.jpg" width="200" height="200"></image></tr>
                                <br />
                                <tr>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Title") %>'>
                                    </asp:Label>
                                    <br />
                                     <asp:Label ID="Label2" runat="server" Text='<%#Eval("Author") %>'>
                                    </asp:Label>
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Price") %>'>
                                    </asp:Label>
                                    <br />
                                    <asp:Button ID="Label4" runat="server" Text='<%#Eval("Price") %>'>
                                    </asp:Button>
                            </table>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>--%>
        <asp:Label ID="Label5" runat="server" Text="No books found!" visible=false></asp:Label>
</asp:Content>

