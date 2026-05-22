using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using BlogPessoal.Services.IA;

namespace BlogPessoal.Services;

public class PostagemService(
    IPostagemRepository repository,
    IGeminiService geminiService)
{
    public async Task<List<PostagemResponseDto>> ListarAsync()
    {
        var postagens = await repository.ListarAsync();

        return postagens
            .Select(MapearParaResponse)
            .ToList();
    }

    public async Task<PostagemResponseDto?> BuscarPorIdAsync(long id)
    {
        if (id <= 0)
        {
            return null;
        }

        var postagem = await repository.BuscarPorIdAsync(id);

        return postagem is null ? null : MapearParaResponse(postagem);
    }

    public async Task<List<PostagemResponseDto>> BuscarPorUsuarioAsync(long usuarioId)
    {
        if (usuarioId <= 0)
        {
            return [];
        }

        var postagens = await repository.BuscarPorUsuarioAsync(usuarioId);

        return postagens
            .Select(MapearParaResponse)
            .ToList();
    }

    public async Task<List<PostagemResponseDto>> BuscarPorTemaAsync(long temaId)
    {
        if (temaId <= 0)
        {
            return [];
        }

        var postagens = await repository.BuscarPorTemaAsync(temaId);

        return postagens
            .Select(MapearParaResponse)
            .ToList();
    }

    public async Task<PostagemResponseDto> CriarAsync(PostagemCreateDto dto, long usuarioId)
    {
        var resultadoIA = await geminiService.GerarResumoAsync(dto.Texto);

        var postagem = new Postagem
        {
            Titulo = dto.Titulo.Trim(),
            Texto = dto.Texto.Trim(),
            UsuarioId = usuarioId,
            TemaId = dto.TemaId,
            Data = DateTime.UtcNow,
            ResumoIA = resultadoIA.Resumo,
            TagsIA = resultadoIA.Tags,
            CategoriaIA = resultadoIA.Categoria
        };

        var postagemCriada = await repository.CriarAsync(postagem);

        return MapearParaResponse(postagemCriada);
    }

    public async Task<PostagemResponseDto?> AtualizarAsync(long id, PostagemUpdateDto dto)
    {
        if (id <= 0)
        {
            return null;
        }

        var resultadoIA = await geminiService.GerarResumoAsync(dto.Texto);

        var postagem = new Postagem
        {
            Id = id,
            Titulo = dto.Titulo.Trim(),
            Texto = dto.Texto.Trim(),
            TemaId = dto.TemaId,
            ResumoIA = resultadoIA.Resumo,
            TagsIA = resultadoIA.Tags,
            CategoriaIA = resultadoIA.Categoria
        };

        var postagemAtualizada = await repository.AtualizarAsync(postagem);

        return postagemAtualizada is null ? null : MapearParaResponse(postagemAtualizada);
    }

    public async Task<bool> DeletarAsync(long id)
    {
        if (id <= 0)
        {
            return false;
        }

        return await repository.DeletarAsync(id);
    }

    private static PostagemResponseDto MapearParaResponse(Postagem postagem)
    {
        return new PostagemResponseDto
        {
            Id = postagem.Id,
            Titulo = postagem.Titulo,
            Texto = postagem.Texto,
            Data = postagem.Data,
            ResumoIA = postagem.ResumoIA,
            TagsIA = postagem.TagsIA,
            CategoriaIA = postagem.CategoriaIA,
            UsuarioId = postagem.UsuarioId,
            UsuarioNome = postagem.Usuario?.UsuarioNome ?? string.Empty,
            TemaId = postagem.TemaId,
            TemaDescricao = postagem.Tema?.Descricao ?? string.Empty
        };
    }
}