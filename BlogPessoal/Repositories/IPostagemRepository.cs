using BlogPessoal.Models;

namespace BlogPessoal.Repositories;

public interface IPostagemRepository
{
    Task<List<Postagem>> ListarAsync();

    Task<Postagem?> BuscarPorIdAsync(long id);

    Task<List<Postagem>> BuscarPorUsuarioAsync(long usuarioId);

    Task<List<Postagem>> BuscarPorTemaAsync(long temaId);

    Task<Postagem> CriarAsync(Postagem postagem);

    Task<Postagem?> AtualizarAsync(Postagem postagem);

    Task<bool> DeletarAsync(long id);
}