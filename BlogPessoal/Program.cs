using BlogPessoal.Config;
using BlogPessoal.Data;
using BlogPessoal.Repositories;
using BlogPessoal.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddSwaggerConfiguration();

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(connectionString);
});

builder.Services.AddScoped<ITemaRepository, TemaRepository>();
builder.Services.AddScoped<TemaService>();

var app = builder.Build();

app.UseSwaggerConfiguration();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.MapGet("/api/health", () =>
{
    return Results.Ok(new
    {
        status = "API funcionando",
        ambiente = app.Environment.EnvironmentName,
        data = DateTime.UtcNow
    });
});

app.Run();

public partial class Program { }