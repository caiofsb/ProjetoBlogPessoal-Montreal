using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using BlogPessoal.Services;
using Microsoft.AspNetCore.Identity;

namespace BlogPessoal.Tests;

public class UsuarioServiceTests
{
    [Fact]
    public async Task DeveCriarUsuarioComSenhaEmHash()
    {
        var repository = new UsuarioRepositoryFake();
        var passwordHasher = new PasswordHasher<Usuario>();
        var service = new UsuarioService(repository, passwordHasher);

        var resultado = await service.CriarAsync(new UsuarioCreateDto
        {
            Nome = " Caio Felipe ",
            UsuarioNome = " caio ",
            Email = " CAIO.BINDEIRO@GMAIL.COM ",
            Senha = "Senha123456",
            Foto = " https://exemplo.com/foto.png ",
            Tipo = "normal"
        });

        var usuarioSalvo = await repository.BuscarPorEmailAsync("caio.bindeiro@gmail.com");

        Assert.NotNull(resultado);
        Assert.NotNull(usuarioSalvo);
        Assert.Equal("Caio Felipe", resultado.Nome);
        Assert.Equal("caio", resultado.UsuarioNome);
        Assert.Equal("caio.bindeiro@gmail.com", resultado.Email);
        Assert.Equal("NORMAL", resultado.Tipo);
        Assert.NotEqual("Senha123456", usuarioSalvo.Senha);
    }

    [Fact]
    public async Task NaoDeveCriarUsuarioComEmailDuplicado()
    {
        var repository = new UsuarioRepositoryFake();
        var passwordHasher = new PasswordHasher<Usuario>();
        var service = new UsuarioService(repository, passwordHasher);

        await service.CriarAsync(new UsuarioCreateDto
        {
            Nome = "Caio Felipe",
            UsuarioNome = "caio",
            Email = "caio.bindeiro@gmail.com",
            Senha = "Senha123456",
            Tipo = "NORMAL"
        });

        var resultadoDuplicado = await service.CriarAsync(new UsuarioCreateDto
        {
            Nome = "Outro Usuário",
            UsuarioNome = "outro",
            Email = "caio.bindeiro@gmail.com",
            Senha = "Senha123456",
            Tipo = "NORMAL"
        });

        Assert.Null(resultadoDuplicado);
    }

    [Fact]
    public async Task DeveRetornarNullAoBuscarUsuarioComIdInvalido()
    {
        var repository = new UsuarioRepositoryFake();
        var passwordHasher = new PasswordHasher<Usuario>();
        var service = new UsuarioService(repository, passwordHasher);

        var resultado = await service.BuscarPorIdAsync(0);

        Assert.Null(resultado);
    }

    [Fact]
    public async Task DeveAtualizarUsuarioExistente()
    {
        var repository = new UsuarioRepositoryFake();
        var passwordHasher = new PasswordHasher<Usuario>();
        var service = new UsuarioService(repository, passwordHasher);

        var usuarioCriado = await service.CriarAsync(new UsuarioCreateDto
        {
            Nome = "Caio Felipe",
            UsuarioNome = "caio",
            Email = "caio.bindeiro@gmail.com",
            Senha = "Senha123456",
            Tipo = "NORMAL"
        });

        Assert.NotNull(usuarioCriado);

        var usuarioAtualizado = await service.AtualizarAsync(usuarioCriado.Id, new UsuarioUpdateDto
        {
            Nome = " Caio Felipe Bindeiro ",
            UsuarioNome = " caiofelipe ",
            Foto = " https://exemplo.com/nova-foto.png ",
            Tipo = "admin"
        });

        Assert.NotNull(usuarioAtualizado);
        Assert.Equal("Caio Felipe Bindeiro", usuarioAtualizado.Nome);
        Assert.Equal("caiofelipe", usuarioAtualizado.UsuarioNome);
        Assert.Equal("ADMIN", usuarioAtualizado.Tipo);
    }
}

file class UsuarioRepositoryFake : IUsuarioRepository
{
    private readonly List<Usuario> _usuarios = [];

    public Task<List<Usuario>> ListarAsync()
    {
        return Task.FromResult(_usuarios.OrderBy(usuario => usuario.Nome).ToList());
    }

    public Task<Usuario?> BuscarPorIdAsync(long id)
    {
        var usuario = _usuarios.FirstOrDefault(item => item.Id == id);

        return Task.FromResult(usuario);
    }

    public Task<Usuario?> BuscarPorEmailAsync(string email)
    {
        var usuario = _usuarios.FirstOrDefault(item =>
            item.Email.Equals(email, StringComparison.OrdinalIgnoreCase));

        return Task.FromResult(usuario);
    }

    public Task<Usuario> CriarAsync(Usuario usuario)
    {
        usuario.Id = _usuarios.Count + 1;

        _usuarios.Add(usuario);

        return Task.FromResult(usuario);
    }

    public Task<Usuario?> AtualizarAsync(Usuario usuario)
    {
        var usuarioExistente = _usuarios.FirstOrDefault(item => item.Id == usuario.Id);

        if (usuarioExistente is null)
        {
            return Task.FromResult<Usuario?>(null);
        }

        usuarioExistente.Nome = usuario.Nome;
        usuarioExistente.UsuarioNome = usuario.UsuarioNome;
        usuarioExistente.Foto = usuario.Foto;
        usuarioExistente.Tipo = usuario.Tipo;

        return Task.FromResult<Usuario?>(usuarioExistente);
    }

    public Task<bool> DeletarAsync(long id)
    {
        var usuario = _usuarios.FirstOrDefault(item => item.Id == id);

        if (usuario is null)
        {
            return Task.FromResult(false);
        }

        _usuarios.Remove(usuario);

        return Task.FromResult(true);
    }
}