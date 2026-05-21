using Microsoft.OpenApi;

namespace BlogPessoal.Config;

public static class SwaggerConfig
{
    public static IServiceCollection AddSwaggerConfiguration(this IServiceCollection services)
    {
        services.AddEndpointsApiExplorer();

        services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc("v1", new OpenApiInfo
            {
                Title = "Api do Blog Pessoal",
                Version = "v1",
                Description = "API RESTful de gerenciamento de usuários, postagens e resumo inteligente  deitos com IA.",
                Contact = new OpenApiContact
                {
                    Name = "Caio Felipe"
                }
            });
            options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                Name = "Authorization",
                Description = "Informe o token JWT no formato: Bearer {seu_token}",
                In = ParameterLocation.Header,
                Type = SecuritySchemeType.ApiKey,
                Scheme = "Bearer"
            });

        });

        return services;
    }

    public static WebApplication UseSwaggerConfiguration(this WebApplication app)
    {
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();

            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "Blog Pessoal API v1");
                options.RoutePrefix = "swagger";
                options.DocumentTitle = "Api do Blog Pessoal";
            });
        }

        return app;
    }
}