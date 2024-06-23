using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BibliotecaLibros.DataAccess;
using MySql.Data.MySqlClient;

namespace BibliotecaLibros
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    pnlLibrary.Visible = true;
                    pnlNavbar.Visible = true;
                    pnlLogin.Visible = false;
                    LoadData();
                }
                else
                {
                    pnlLibrary.Visible = false;
                    pnlNavbar.Visible = false;
                    pnlLogin.Visible = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (ValidateUser(username, password))
            {
                Session["Username"] = username;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Usuario o contraseña incorrectos.";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (CreateUser(username, password))
            {
                lblMessage.Text = "Usuario creado exitosamente. Por favor, inicie sesión.";
            }
            else
            {
                lblMessage.Text = "El usuario ya existe. Por favor, elija otro nombre de usuario.";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Default.aspx");
        }

        private bool ValidateUser(string username, string password)
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
            MySqlParameter[] parameters = {
                new MySqlParameter("@Username", username),
                new MySqlParameter("@Password", password)
            };
            DataTable result = dbHelper.ExecuteQuery(query, parameters);
            return result.Rows[0][0].ToString() == "1";
        }

        private bool CreateUser(string username, string password)
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            string queryCheck = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
            MySqlParameter[] parametersCheck = {
                new MySqlParameter("@Username", username)
            };
            DataTable resultCheck = dbHelper.ExecuteQuery(queryCheck, parametersCheck);

            if (resultCheck.Rows[0][0].ToString() == "0")
            {
                string queryInsert = "INSERT INTO Users (Username, Password) VALUES (@Username, @Password)";
                MySqlParameter[] parametersInsert = {
                    new MySqlParameter("@Username", username),
                    new MySqlParameter("@Password", password)
                };
                dbHelper.ExecuteNonQuery(queryInsert, parametersInsert);
                return true;
            }
            return false;
        }

        private void LoadData()
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            string query = "SELECT ISBN, Edicion, FechaPublicacion, Titulo, NombreAutor, PrimerApellidoAutor, SegundoApellidoAutor, Paginas, Categoria, Editorial FROM libros";
            DataTable dataTable = dbHelper.ExecuteQuery(query, null);
            RepeaterBooks.DataSource = dataTable;
            RepeaterBooks.DataBind();
        }



    }
}