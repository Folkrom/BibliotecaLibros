<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="BibliotecaLibros.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar Libro</title>
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
            <h2>Agregar Libro</h2>
            <div class="mb-3">
                <label for="txtISBN" class="form-label">ISBN</label>
                <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtEdicion" class="form-label">Edición</label>
                <asp:TextBox ID="txtEdicion" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtFechaPublicacion" class="form-label">Fecha de Publicación</label>
                <asp:TextBox ID="txtFechaPublicacion" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtTitulo" class="form-label">Título</label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombreAutor" class="form-label">Nombre del Autor</label>
                <asp:TextBox ID="txtNombreAutor" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtPrimerApellidoAutor" class="form-label">Primer Apellido del Autor</label>
                <asp:TextBox ID="txtPrimerApellidoAutor" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtSegundoApellidoAutor" class="form-label">Segundo Apellido del Autor</label>
                <asp:TextBox ID="txtSegundoApellidoAutor" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtPaginas" class="form-label">Páginas</label>
                <asp:TextBox ID="txtPaginas" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCategoria" class="form-label">Categoría</label>
                <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtEditorial" class="form-label">Editorial</label>
                <asp:TextBox ID="txtEditorial" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnAddBook" runat="server" Text="Agregar Libro" CssClass="btn btn-primary" OnClick="btnAddBook_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="form-text mt-3" />
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>
