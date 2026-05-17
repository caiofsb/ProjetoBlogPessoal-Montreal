using BlogPessoal.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogPessoal.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
{
    public DbSet<Usuario> Usuarios => Set<Usuario>();

    public DbSet<Tema> Temas => Set<Tema>();

    public DbSet<Postagem> Postagens => Set<Postagem>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Usuario>()
            .HasIndex(usuario => usuario.Email)
            .IsUnique();

        modelBuilder.Entity<Postagem>()
            .HasOne(postagem => postagem.Usuario)
            .WithMany(usuario => usuario.Postagens)
            .HasForeignKey(postagem => postagem.UsuarioId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Postagem>()
            .HasOne(postagem => postagem.Tema)
            .WithMany(tema => tema.Postagens)
            .HasForeignKey(postagem => postagem.TemaId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}