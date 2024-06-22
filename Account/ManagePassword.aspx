<%@ Page Title="Administrar contraseña" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="BibliotecaLibros.Account.ManagePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="row">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        No dispone de una contraseña local para este sitio. Agregue una contraseña
                            local para poder iniciar sesión sin necesidad de un inicio de sesión externo.
                    </p>
                    <div>
                        <h4>Formulario para establecer contraseña</h4>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <hr />
                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 col-form-label">Contraseña</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 col-form-label">Confirmar contraseña</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden."
                                    ValidationGroup="SetPassword" />

                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-md-2 col-md-10">
                                <asp:Button runat="server" Text="Establecer contraseña" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-outline-dark" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <div>
                        <h4>Formulario para cambiar contraseña</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="row">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 col-form-label">Contraseña actual</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="El campo de contraseña actual es obligatorio."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 col-form-label">Nueva contraseña</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="La contraseña nueva es obligatoria."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 col-form-label">Confirmar la nueva contraseña</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La confirmación de la nueva contraseña es obligatoria."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La nueva contraseña y la contraseña de confirmación no coinciden."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-md-2 col-md-10">
                                <asp:Button runat="server" Text="Cambiar contraseña" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-outline-dark" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>
        </div>
    </main>
</asp:Content>
