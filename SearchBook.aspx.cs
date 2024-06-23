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
    public partial class SearchBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "SELECT ISBN, Edicion, FechaPublicacion, Titulo, NombreAutor, PrimerApellidoAutor, SegundoApellidoAutor, Paginas, Categoria, Editorial FROM libros WHERE Titulo LIKE @Search OR ISBN LIKE @Search";
            MySqlParameter[] parameters = {
                new MySqlParameter("@Search", "%" + searchQuery + "%")
            };
            DataTable dataTable = dbHelper.ExecuteQuery(query, parameters);
            GridViewBooks.DataSource = dataTable;
            GridViewBooks.DataBind();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split(';');
            string isbn = args[0];
            int edicion = int.Parse(args[1]);

            Response.Redirect($"EditBook.aspx?isbn={isbn}&edicion={edicion}");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split(';');
            string isbn = args[0];
            int edicion = int.Parse(args[1]);

            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "DELETE FROM libros WHERE ISBN = @ISBN AND Edicion = @Edicion";
            MySqlParameter[] parameters = {
                new MySqlParameter("@ISBN", isbn),
                new MySqlParameter("@Edicion", edicion)
            };
            dbHelper.ExecuteNonQuery(query, parameters);

            btnSearch_Click(null, null);  // Refresh the search results
        }

    }
}