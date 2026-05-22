using BlogPessoal.Config;
using BlogPessoal.Data;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using BlogPessoal.Services;
using BlogPessoal.Services.IA;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddSwaggerConfiguration();
builder.Services.AddJwtConfiguration(builder.Configuration);

builder.Services.Configure<GeminiOptions>(
    builder.Configuration.GetSection("Gemini"));

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(connectionString);
});

builder.Services.AddScoped<ITemaRepository, TemaRepository>();
builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();
builder.Services.AddScoped<IPostagemRepository, PostagemRepository>();

builder.Services.AddScoped<TemaService>();
builder.Services.AddScoped<UsuarioService>();
builder.Services.AddScoped<PostagemService>();
builder.Services.AddHttpClient<IGeminiService, GeminiService>();
builder.Services.AddScoped<AuthService>();
builder.Services.AddScoped<IPasswordHasher<Usuario>, PasswordHasher<Usuario>>();

builder.Services.AddHttpClient<IGeminiService, GeminiService>();

var app = builder.Build();

app.UseSwaggerConfiguration();

app.UseHttpsRedirection();

app.UseAuthentication();
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