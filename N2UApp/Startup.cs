using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(N2UApp.Startup))]
namespace N2UApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
