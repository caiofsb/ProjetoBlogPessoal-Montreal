using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using Microsoft.AspNetCore.Identity;

namespace BlogPessoal.Services;

public class UsuarioService(
    IUsuarioRepository repository,
    IPasswordHasher<Usuario> passwordHasher)
{
    public async Task<List<UsuarioResponseDto>> ListarAsync()
    {
        var usuarios = await repository.ListarAsync();

        return usuarios
            .Select(MapearParaResponse)
            .ToList();
    }

    public async Task<UsuarioResponseDto?> BuscarPorIdAsync(long id)
    {
        if (id <= 0)
        {
            return null;
        }

        var usuario = await repository.BuscarPorIdAsync(id);

        return usuario is null ? null : MapearParaResponse(usuario);
    }

    public async Task<UsuarioResponseDto?> CriarAsync(UsuarioCreateDto dto)
    {
        var emailNormalizado = dto.Email.Trim().ToLowerInvariant();

        var usuarioExistente = await repository.BuscarPorEmailAsync(emailNormalizado);

        if (usuarioExistente is not null)
        {
            return null;
        }

        var usuario = new Usuario
        {
            Nome = dto.Nome.Trim(),
            UsuarioNome = dto.UsuarioNome.Trim(),
            Email = emailNormalizado,
            Foto = dto.Foto.Trim(),
            Tipo = string.IsNullOrWhiteSpace(dto.Tipo) ? "NORMAL" : dto.Tipo.Trim().ToUpperInvariant()
        };

        usuario.Senha = passwordHasher.HashPassword(usuario, dto.Senha);

        var usuarioCriado = await repository.CriarAsync(usuario);

        return MapearParaResponse(usuarioCriado);
    }

    public async Task<UsuarioResponseDto?> AtualizarAsync(long id, UsuarioUpdateDto dto)
    {
        if (id <= 0)
        {
            return null;
        }

        var usuario = new Usuario
        {
            Id = id,
            Nome = dto.Nome.Trim(),
            UsuarioNome = dto.UsuarioNome.Trim(),
            Foto = dto.Foto.Trim(),
            Tipo = string.IsNullOrWhiteSpace(dto.Tipo) ? "NORMAL" : dto.Tipo.Trim().ToUpperInvariant()
        };

        var usuarioAtualizado = await repository.AtualizarAsync(usuario);

        return usuarioAtualizado is null ? null : MapearParaResponse(usuarioAtualizado);
    }

    public async Task<bool> DeletarAsync(long id)
    {
        if (id <= 0)
        {
            return false;
        }

        return await repository.DeletarAsync(id);
    }

    private static UsuarioResponseDto MapearParaResponse(Usuario usuario)
    {
        return new UsuarioResponseDto
        {
            Id = usuario.Id,
            Nome = usuario.Nome,
            UsuarioNome = usuario.UsuarioNome,
            Email = usuario.Email,
            Foto = usuario.Foto,
            Tipo = usuario.Tipo
        };
    }
}