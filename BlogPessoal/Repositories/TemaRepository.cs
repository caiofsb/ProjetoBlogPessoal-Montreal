using BlogPessoal.Data;
using BlogPessoal.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogPessoal.Repositories;

public class TemaRepository(AppDbContext context) : ITemaRepository
{
    public async Task<List<Tema>> ListarAsync()
    {
        return await context.Temas
            .AsNoTracking()
            .OrderBy(tema => tema.Descricao)
            .ToListAsync();
    }

    public async Task<Tema?> BuscarPorIdAsync(long id)
    {
        return await context.Temas
            .FirstOrDefaultAsync(tema => tema.Id == id);
    }

    public async Task<Tema> CriarAsync(Tema tema)
    {
        context.Temas.Add(tema);
        await context.SaveChangesAsync();

        return tema;
    }

    public async Task<Tema?> AtualizarAsync(Tema tema)
    {
        var temaExistente = await BuscarPorIdAsync(tema.Id);

        if (temaExistente is null)
        {
            return null;
        }

        temaExistente.Descricao = tema.Descricao;

        await context.SaveChangesAsync();

        return temaExistente;
    }

    public async Task<bool> DeletarAsync(long id)
    {
        var tema = await BuscarPorIdAsync(id);

        if (tema is null)
        {
            return false;
        }

        context.Temas.Remove(tema);
        await context.SaveChangesAsync();

        return true;
    }
}