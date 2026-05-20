using BlogPessoal.Data;
using BlogPessoal.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogPessoal.Repositories;

public class PostagemRepository(AppDbContext context) : IPostagemRepository
{
    public async Task<List<Postagem>> ListarAsync()
    {
        return await context.Postagens
            .AsNoTracking()
            .Include(postagem => postagem.Usuario)
            .Include(postagem => postagem.Tema)
            .OrderByDescending(postagem => postagem.Data)
            .ToListAsync();
    }

    public async Task<Postagem?> BuscarPorIdAsync(long id)
    {
        return await context.Postagens
            .Include(postagem => postagem.Usuario)
            .Include(postagem => postagem.Tema)
            .FirstOrDefaultAsync(postagem => postagem.Id == id);
    }

    public async Task<List<Postagem>> BuscarPorUsuarioAsync(long usuarioId)
    {
        return await context.Postagens
            .AsNoTracking()
            .Include(postagem => postagem.Usuario)
            .Include(postagem => postagem.Tema)
            .Where(postagem => postagem.UsuarioId == usuarioId)
            .OrderByDescending(postagem => postagem.Data)
            .ToListAsync();
    }

    public async Task<List<Postagem>> BuscarPorTemaAsync(long temaId)
    {
        return await context.Postagens
            .AsNoTracking()
            .Include(postagem => postagem.Usuario)
            .Include(postagem => postagem.Tema)
            .Where(postagem => postagem.TemaId == temaId)
            .OrderByDescending(postagem => postagem.Data)
            .ToListAsync();
    }

    public async Task<Postagem> CriarAsync(Postagem postagem)
    {
        context.Postagens.Add(postagem);
        await context.SaveChangesAsync();

        return await BuscarPorIdAsync(postagem.Id) ?? postagem;
    }

    public async Task<Postagem?> AtualizarAsync(Postagem postagem)
    {
        var postagemExistente = await context.Postagens
            .FirstOrDefaultAsync(item => item.Id == postagem.Id);

        if (postagemExistente is null)
        {
            return null;
        }

        postagemExistente.Titulo = postagem.Titulo;
        postagemExistente.Texto = postagem.Texto;
        postagemExistente.TemaId = postagem.TemaId;

        await context.SaveChangesAsync();

        return await BuscarPorIdAsync(postagemExistente.Id);
    }

    public async Task<bool> DeletarAsync(long id)
    {
        var postagem = await context.Postagens
            .FirstOrDefaultAsync(item => item.Id == id);

        if (postagem is null)
        {
            return false;
        }

        context.Postagens.Remove(postagem);
        await context.SaveChangesAsync();

        return true;
    }
}