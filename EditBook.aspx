<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="BibliotecaLibros.EditBook" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Editar Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlNavbar" runat="server" Visible="true">
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
            <h2>Editar Libro</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="mb-3">
                <asp:Label ID="lblISBN" runat="server" Text="ISBN:" AssociatedControlID="txtISBN" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEdicion" runat="server" Text="Edición:" AssociatedControlID="txtEdicion" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEdicion" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaPublicacion" runat="server" Text="Fecha de Publicación:" AssociatedControlID="txtFechaPublicacion" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtFechaPublicacion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblTitulo" runat="server" Text="Título:" AssociatedControlID="txtTitulo" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblNombreAutor" runat="server" Text="Nombre del Autor:" AssociatedControlID="txtNombreAutor" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNombreAutor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPrimerApellidoAutor" runat="server" Text="Primer Apellido del Autor:" AssociatedControlID="txtPrimerApellidoAutor" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPrimerApellidoAutor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblSegundoApellidoAutor" runat="server" Text="Segundo Apellido del Autor:" AssociatedControlID="txtSegundoApellidoAutor" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtSegundoApellidoAutor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPaginas" runat="server" Text="Páginas:" AssociatedControlID="txtPaginas" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPaginas" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblCategoria" runat="server" Text="Categoría:" AssociatedControlID="txtCategoria" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEditorial" runat="server" Text="Editorial:" AssociatedControlID="txtEditorial" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEditorial" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-grid gap-2">
                <asp:Button ID="btnUpdate" runat="server" Text="Actualizar" CssClass="btn btn-primary btn-block" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-secondary btn-block" OnClick="btnCancel_Click" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>
