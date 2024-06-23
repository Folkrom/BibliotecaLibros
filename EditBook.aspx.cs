using BibliotecaLibros.DataAccess;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotecaLibros
{
    public partial class EditBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Default.aspx");
                }

                string isbn = Request.QueryString["isbn"];
                int edicion = int.Parse(Request.QueryString["edicion"]);
                LoadBookDetails(isbn, edicion);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Default.aspx");
        }
        private void LoadBookDetails(string isbn, int edicion)
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "SELECT * FROM libros WHERE ISBN = @ISBN AND Edicion = @Edicion";
            MySqlParameter[] parameters = {
                new MySqlParameter("@ISBN", isbn),
                new MySqlParameter("@Edicion", edicion)
            };
            DataTable dataTable = dbHelper.ExecuteQuery(query, parameters);

            if (dataTable.Rows.Count > 0)
            {
                DataRow row = dataTable.Rows[0];
                txtISBN.Text = row["ISBN"].ToString();
                txtEdicion.Text = row["Edicion"].ToString();
                txtFechaPublicacion.Text = row["FechaPublicacion"].ToString();
                txtTitulo.Text = row["Titulo"].ToString();
                txtNombreAutor.Text = row["NombreAutor"].ToString();
                txtPrimerApellidoAutor.Text = row["PrimerApellidoAutor"].ToString();
                txtSegundoApellidoAutor.Text = row["SegundoApellidoAutor"].ToString();
                txtPaginas.Text = row["Paginas"].ToString();
                txtCategoria.Text = row["Categoria"].ToString();
                txtEditorial.Text = row["Editorial"].ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
            string query = "UPDATE libros SET FechaPublicacion = @FechaPublicacion, Titulo = @Titulo, NombreAutor = @NombreAutor, PrimerApellidoAutor = @PrimerApellidoAutor, SegundoApellidoAutor = @SegundoApellidoAutor, Paginas = @Paginas, Categoria = @Categoria, Editorial = @Editorial WHERE ISBN = @ISBN AND Edicion = @Edicion";
            MySqlParameter[] parameters = {
                new MySqlParameter("@FechaPublicacion", fechaPublicacion),
                new MySqlParameter("@Titulo", titulo),
                new MySqlParameter("@NombreAutor", nombreAutor),
                new MySqlParameter("@PrimerApellidoAutor", primerApellidoAutor),
                new MySqlParameter("@SegundoApellidoAutor", segundoApellidoAutor),
                new MySqlParameter("@Paginas", paginas),
                new MySqlParameter("@Categoria", categoria),
                new MySqlParameter("@Editorial", editorial),
                new MySqlParameter("@ISBN", isbn),
                new MySqlParameter("@Edicion", edicion)
            };
            dbHelper.ExecuteNonQuery(query, parameters);

            lblMessage.Text = "El libro ha sido actualizado exitosamente.";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchBook.aspx");
        }

    }
}