using BlogPessoal.Models;

namespace BlogPessoal.Repositories;

public interface ITemaRepository
{
    Task<List<Tema>> ListarAsync();

    Task<Tema?> BuscarPorIdAsync(long id);

    Task<Tema> CriarAsync(Tema tema);

    Task<Tema?> AtualizarAsync(Tema tema);

    Task<bool> DeletarAsync(long id);
}