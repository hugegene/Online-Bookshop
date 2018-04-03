<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 " style="padding-top: 30px;">
                <div style="min-width: 300px; text-align: center;">
                    <div style="text-align: center;">
                        <div class="panel panel-default" style="width: 350px; margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px; padding-left: 60px; padding-bottom: 10px;">
                            <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
                                <LayoutTemplate>
                                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td>
                                                <table cellpadding="0">
                                                    <tr>
                                                        <td align="center" class="h4 " style="padding-bottom: 10px; padding-top: 10px;" colspan="2">Log In</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <div style="padding: 2px;" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="padding: 5px;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <div style="padding: 2px;" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td colspan="2">
                                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me  " CssClass="checkbox" TextAlign="Right" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="3" style="color: Red;">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="3">
                                                            <asp:Button CssClass="positive ui button" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                            </asp:Login>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div style="min-width: 300px">
                    <div style="text-align: center;">
                        <div class="panel panel-default" style="width: 350px; margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px; padding: 20px;">
                            <asp:CreateUserWizard ID="CreateUserWizard1" Height="300px" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
                                <CreateUserButtonStyle CssClass="positive ui button" />
                                <WizardSteps>
                                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td align="center" class="h4 " style="padding-bottom: 10px;" colspan="3">New User? Sign up Below!</td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Verify Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="NameLabel" runat="server" AssociatedControlID="NameTextBox">Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Name is required." ToolTip="Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail Address:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" ControlToValidate="Email" ErrorMessage="Use proper format" ToolTip="Use proper format" ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="AddressLabel" runat="server" AssociatedControlID="AddressTextBox">Home Address:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PhoneLabel" runat="server" AssociatedControlID="PhoneTextBox">Phone Number:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="PhoneTextBox" MaxLength="8" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Phone is required." ToolTip="Phone is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="PhoneRegularExpressionValidator" ValidationExpression="\d{8}" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Use 8 digit format" ToolTip="Use 8 digit format" ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <div style="padding: 2px;" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="3">
                                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="padding: 5px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="3" style="color: Red;">
                                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:CreateUserWizardStep>
                                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                        <ContentTemplate>
                                            <table style="font-size: 100%; height: 250px;">
                                                <tr>
                                                    <td align="center" colspan="2">Complete</td>
                                                </tr>
                                                <tr>
                                                    <td>Your account has been successfully created.</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2">
                                                        <asp:Button CssClass="positive ui button" ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:CompleteWizardStep>
                                </WizardSteps>
                            </asp:CreateUserWizard>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
