using BlogPessoal.Config;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddSwaggerConfiguration();

var app = builder.Build();

app.UseSwaggerConfiguration();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.MapGet("/api/health", () =>
{
    return Results.Ok(new
    {
        status = "API do Blog Pessoal funcionando",
        ambiente = app.Environment.EnvironmentName,
        data = DateTime.UtcNow
    });
});

app.Run();

public partial class Program { }