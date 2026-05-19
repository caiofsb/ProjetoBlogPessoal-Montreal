using BlogPessoal.Data;
using BlogPessoal.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogPessoal.Repositories;

public class UsuarioRepository(AppDbContext context) : IUsuarioRepository
{
    public async Task<List<Usuario>> ListarAsync()
    {
        return await context.Usuarios
            .AsNoTracking()
            .OrderBy(usuario => usuario.Nome)
            .ToListAsync();
    }

    public async Task<Usuario?> BuscarPorIdAsync(long id)
    {
        return await context.Usuarios
            .FirstOrDefaultAsync(usuario => usuario.Id == id);
    }

    public async Task<Usuario?> BuscarPorEmailAsync(string email)
    {
        return await context.Usuarios
            .FirstOrDefaultAsync(usuario => usuario.Email == email);
    }

    public async Task<Usuario> CriarAsync(Usuario usuario)
    {
        context.Usuarios.Add(usuario);
        await context.SaveChangesAsync();

        return usuario;
    }

    public async Task<Usuario?> AtualizarAsync(Usuario usuario)
    {
        var usuarioExistente = await BuscarPorIdAsync(usuario.Id);

        if (usuarioExistente is null)
        {
            return null;
        }

        usuarioExistente.Nome = usuario.Nome;
        usuarioExistente.UsuarioNome = usuario.UsuarioNome;
        usuarioExistente.Foto = usuario.Foto;
        usuarioExistente.Tipo = usuario.Tipo;

        await context.SaveChangesAsync();

        return usuarioExistente;
    }

    public async Task<bool> DeletarAsync(long id)
    {
        var usuario = await BuscarPorIdAsync(id);

        if (usuario is null)
        {
            return false;
        }

        context.Usuarios.Remove(usuario);
        await context.SaveChangesAsync();

        return true;
    }
}