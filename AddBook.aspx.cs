using BibliotecaLibros.DataAccess;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotecaLibros
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string isbn = txtISBN.Text.Trim();
            int edicion = int.Parse(txtEdicion.Text.Trim());
            int fechaPublicacion = int.Parse(txtFechaPublicacion.Text.Trim());
            string titulo = txtTitulo.Text.Trim();
            string nombreAutor = txtNombreAutor.Text.Trim();
            string primerApellidoAutor = txtPrimerApellidoAutor.Text.Trim();
            string segundoApellidoAutor = txtSegundoApellidoAutor.Text.Trim();
            int paginas = int.Parse(txtPaginas.Text.Trim());
            string categoria = txtCategoria.Text.Trim();
            string editorial = txtEditorial.Text.Trim();

            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "INSERT INTO libros (ISBN, Edicion, FechaPublicacion, Titulo, NombreAutor, PrimerApellidoAutor, SegundoApellidoAutor, Paginas, Categoria, Editorial) VALUES (@ISBN, @Edicion, @FechaPublicacion, @Titulo, @NombreAutor, @PrimerApellidoAutor, @SegundoApellidoAutor, @Paginas, @Categoria, @Editorial)";
            MySqlParameter[] parameters = {
                new MySqlParameter("@ISBN", isbn),
                new MySqlParameter("@Edicion", edicion),
                new MySqlParameter("@FechaPublicacion", fechaPublicacion),
                new MySqlParameter("@Titulo", titulo),
                new MySqlParameter("@NombreAutor", nombreAutor),
                new MySqlParameter("@PrimerApellidoAutor", primerApellidoAutor),
                new MySqlParameter("@SegundoApellidoAutor", segundoApellidoAutor),
                new MySqlParameter("@Paginas", paginas),
                new MySqlParameter("@Categoria", categoria),
                new MySqlParameter("@Editorial", editorial)
            };

            try
            {
                dbHelper.ExecuteNonQuery(query, parameters);
                lblMessage.Text = "¡Libro agregado con éxito!";
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}