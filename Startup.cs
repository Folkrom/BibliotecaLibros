using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BibliotecaLibros.Startup))]
namespace BibliotecaLibros
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
