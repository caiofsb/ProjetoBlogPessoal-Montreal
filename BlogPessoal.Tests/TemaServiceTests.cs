using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using BlogPessoal.Services;

namespace BlogPessoal.Tests;

public class TemaServiceTests
{
    [Fact]
    public async Task DeveCriarTemaComDescricaoValida()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var resultado = await service.CriarAsync(new TemaDto
        {
            Descricao = " Tecnologia "
        });

        Assert.Equal(1, resultado.Id);
        Assert.Equal("Tecnologia", resultado.Descricao);
    }

    [Fact]
    public async Task DeveBuscarTemaPorIdValido()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var temaCriado = await service.CriarAsync(new TemaDto
        {
            Descricao = "Programação"
        });

        var resultado = await service.BuscarPorIdAsync(temaCriado.Id);

        Assert.NotNull(resultado);
        Assert.Equal("Programação", resultado.Descricao);
    }

    [Fact]
    public async Task DeveRetornarNullAoBuscarIdInvalido()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var resultado = await service.BuscarPorIdAsync(0);

        Assert.Null(resultado);
    }

    [Fact]
    public async Task DeveAtualizarTemaExistente()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var temaCriado = await service.CriarAsync(new TemaDto
        {
            Descricao = "Tecnologia"
        });

        var resultado = await service.AtualizarAsync(temaCriado.Id, new TemaDto
        {
            Descricao = " Inteligência Artificial "
        });

        Assert.NotNull(resultado);
        Assert.Equal("Inteligência Artificial", resultado.Descricao);
    }

    [Fact]
    public async Task DeveDeletarTemaExistente()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var temaCriado = await service.CriarAsync(new TemaDto
        {
            Descricao = "Carreira"
        });

        var deletado = await service.DeletarAsync(temaCriado.Id);
        var temaBuscado = await service.BuscarPorIdAsync(temaCriado.Id);

        Assert.True(deletado);
        Assert.Null(temaBuscado);
    }

    [Fact]
    public async Task DeveRetornarFalseAoDeletarIdInvalido()
    {
        var repository = new TemaRepositoryFake();
        var service = new TemaService(repository);

        var deletado = await service.DeletarAsync(0);

        Assert.False(deletado);
    }
}

file class TemaRepositoryFake : ITemaRepository
{
    private readonly List<Tema> _temas = [];

    public Task<List<Tema>> ListarAsync()
    {
        return Task.FromResult(_temas.OrderBy(tema => tema.Descricao).ToList());
    }

    public Task<Tema?> BuscarPorIdAsync(long id)
    {
        var tema = _temas.FirstOrDefault(item => item.Id == id);

        return Task.FromResult(tema);
    }

    public Task<Tema> CriarAsync(Tema tema)
    {
        tema.Id = _temas.Count + 1;

        _temas.Add(tema);

        return Task.FromResult(tema);
    }

    public Task<Tema?> AtualizarAsync(Tema tema)
    {
        var temaExistente = _temas.FirstOrDefault(item => item.Id == tema.Id);

        if (temaExistente is null)
        {
            return Task.FromResult<Tema?>(null);
        }

        temaExistente.Descricao = tema.Descricao;

        return Task.FromResult<Tema?>(temaExistente);
    }

    public Task<bool> DeletarAsync(long id)
    {
        var tema = _temas.FirstOrDefault(item => item.Id == id);

        if (tema is null)
        {
            return Task.FromResult(false);
        }

        _temas.Remove(tema);

        return Task.FromResult(true);
    }
}