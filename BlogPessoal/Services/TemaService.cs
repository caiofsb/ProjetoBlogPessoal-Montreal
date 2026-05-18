using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;

namespace BlogPessoal.Services;

public class TemaService(ITemaRepository repository)
{
    public async Task<List<Tema>> ListarAsync()
    {
        return await repository.ListarAsync();
    }

    public async Task<Tema?> BuscarPorIdAsync(long id)
    {
        if (id <= 0)
        {
            return null;
        }

        return await repository.BuscarPorIdAsync(id);
    }

    public async Task<Tema> CriarAsync(TemaDto dto)
    {
        var tema = new Tema
        {
            Descricao = dto.Descricao.Trim()
        };

        return await repository.CriarAsync(tema);
    }

    public async Task<Tema?> AtualizarAsync(long id, TemaDto dto)
    {
        if (id <= 0)
        {
            return null;
        }

        var tema = new Tema
        {
            Id = id,
            Descricao = dto.Descricao.Trim()
        };

        return await repository.AtualizarAsync(tema);
    }

    public async Task<bool> DeletarAsync(long id)
    {
        if (id <= 0)
        {
            return false;
        }

        return await repository.DeletarAsync(id);
    }
}