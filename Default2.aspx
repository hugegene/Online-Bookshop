<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" Runat="Server">
    
    
     <nav class= "navbar navbar-inverse navbar-fixed-top" style="margin-top:50px">
            <div class = "container-fluid">
                <asp:Button ID="Button2" runat="server" Text="Button" />
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </div>
        </nav>



    <%-- <div class="row">--%>
       <asp:DataList OnItemCommand="DataList1_ItemCommand" ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="row">
                <ItemTemplate>
                      <div class="col-sm-12 col-md-6 col-lg-2" style ="min-height: 400px"> 

                          <image src="images/<%# Eval("ISBN") %>.jpg" ></image><br/>
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label><br/>
                          <asp:Label ID="Label2" runat="server" Text='<%# Eval("Author") %>'></asp:Label><br/>
                          <asp:Label ID="Label3" runat="server" Text='<%# string.Format("{0:C}", (Convert.ToDouble(Eval("Price"))*(100-(Convert.ToDouble(Eval("Discount"))))*0.01)) %>'></asp:Label>
                          <asp:Label ID="Label6" runat="server" Visible='<% #Eval("Discount") != null && (int)Eval("Discount") > 0  %>' Text='<%# "$" + Eval("Price") %>' Font-Strikeout="True"></asp:Label>
                          <asp:Button ID="Button3" CommandName="addbooktocart" CommandArgument='<%# Eval("BookID") %>' runat="server" Text="Button" /><br/>
                      </div>
                </ItemTemplate>
                        
                </asp:DataList>
         <%-- </div>--%>

    <p>
    </p>

</asp:Content>

