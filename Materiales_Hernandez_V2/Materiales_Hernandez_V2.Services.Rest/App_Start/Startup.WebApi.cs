using Owin;
using System.Web.Http;
using Xomega.Framework;

namespace Materiales_Hernandez_V2.Services.Rest
{
    public partial class Startup
    {
        public void ConfigureWebApi(IAppBuilder app)
        {
            HttpConfiguration config = new HttpConfiguration();
            config.DependencyResolver = new DependencyResolver(DI.DefaultServiceProvider);
            config.MapHttpAttributeRoutes();
            config.Filters.Add(new AuthorizeAttribute());
            app.UseWebApi(config);
        }
    }
}
