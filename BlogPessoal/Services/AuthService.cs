using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using BlogPessoal.Config;
using BlogPessoal.DTOs;
using BlogPessoal.Models;
using BlogPessoal.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace BlogPessoal.Services;

public class AuthService(
    IUsuarioRepository usuarioRepository,
    IPasswordHasher<Usuario> passwordHasher,
    IOptions<JwtSettings> jwtOptions)
{
    private readonly JwtSettings _jwtSettings = jwtOptions.Value;

    public async Task<UsuarioLoginResponseDto?> LoginAsync(UsuarioLoginDto dto)
    {
        var email = dto.Email.Trim().ToLowerInvariant();

        var usuario = await usuarioRepository.BuscarPorEmailAsync(email);

        if (usuario is null)
        {
            return null;
        }

        var resultadoSenha = passwordHasher.VerifyHashedPassword(
            usuario,
            usuario.Senha,
            dto.Senha);

        if (resultadoSenha == PasswordVerificationResult.Failed)
        {
            return null;
        }

        var expiraEm = DateTime.UtcNow.AddMinutes(_jwtSettings.ExpirationMinutes);
        var token = GerarToken(usuario, expiraEm);

        return new UsuarioLoginResponseDto
        {
            Id = usuario.Id,
            Nome = usuario.Nome,
            UsuarioNome = usuario.UsuarioNome,
            Email = usuario.Email,
            Tipo = usuario.Tipo,
            Token = token,
            ExpiraEm = expiraEm
        };
    }

    private string GerarToken(Usuario usuario, DateTime expiraEm)
    {
        var claims = new List<Claim>
        {
            new(JwtRegisteredClaimNames.Sub, usuario.Id.ToString()),
            new(ClaimTypes.NameIdentifier, usuario.Id.ToString()),
            new(JwtRegisteredClaimNames.Email, usuario.Email),
            new(ClaimTypes.Email, usuario.Email),
            new(ClaimTypes.Name, usuario.UsuarioNome),
            new(ClaimTypes.Role, usuario.Tipo)
        };

        var chave = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.Key));
        var credenciais = new SigningCredentials(chave, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _jwtSettings.Issuer,
            audience: _jwtSettings.Audience,
            claims: claims,
            expires: expiraEm,
            signingCredentials: credenciais);

        return new JwtSecurityTokenHandler().WriteToken(token);
    }
}