<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BibliotecaLibros.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Biblioteca - Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlNavbar" runat="server" Visible="false">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Default.aspx">Biblioteca</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="SearchBook.aspx">Buscar Libro</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="AddBook.aspx">Agregar Libro</a>
                            </li>
                        </ul>
                        <div class="d-flex">
                            <asp:Button ID="btnLogout" runat="server" Text="Cerrar Sesión" CssClass="btn btn-outline-danger" OnClick="btnLogout_Click" />
                        </div>
                    </div>
                </div>
            </nav>
        </asp:Panel>

        <div class="container mt-5">
            <asp:Panel ID="pnlLogin" runat="server" Visible="false">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header text-center">
                                <h2>Iniciar Sesión</h2>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                                <div class="mb-3">
                                    <asp:Label ID="lblUsername" runat="server" Text="Usuario:" AssociatedControlID="txtUsername" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" AssociatedControlID="txtPassword" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                                    <asp:Button ID="btnRegister" runat="server" Text="Crear Cuenta" CssClass="btn btn-secondary btn-block" OnClick="btnRegister_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            
            <asp:Panel ID="pnlLibrary" runat="server" Visible="false">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header text-center">
                                <h2>Bienvenido a la Biblioteca</h2>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <asp:Repeater ID="RepeaterBooks" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4 mb-3">
                                                <div class="card h-100">
                                                    <div class="card-body">
                                                        <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">ISBN: <%# Eval("ISBN") %></h6>
                                                        <h6 class="card-subtitle mb-2 text-muted">Autor: <%# Eval("NombreAutor") %> <%# Eval("PrimerApellidoAutor") %> <%# Eval("SegundoApellidoAutor") %></h6>
                                                        <p class="card-text">Fecha de Publicación: <%# Eval("FechaPublicacion") %></p>
                                                        <p class="card-text">Editorial: <%# Eval("Editorial") %></p>
                                                        <p class="card-text">Categoría: <%# Eval("Categoria") %></p>
                                                        <p class="card-text">Páginas: <%# Eval("Paginas") %></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>         
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>