using BlogPessoal.DTOs;
using BlogPessoal.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BlogPessoal.Controllers;

[ApiController]
[Route("api/usuarios")]
public class UsuariosController(UsuarioService service) : ControllerBase
{
    [Authorize(Roles = "ADMIN")]
    [HttpGet]
    public async Task<IActionResult> Listar()
    {
        var usuarios = await service.ListarAsync();

        return Ok(usuarios);
    }

    [Authorize]
    [HttpGet("{id:long}")]
    public async Task<IActionResult> BuscarPorId(long id)
    {
        var usuario = await service.BuscarPorIdAsync(id);

        if (usuario is null)
        {
            return NotFound();
        }

        return Ok(usuario);
    }

    [HttpPost]
    public async Task<IActionResult> Criar([FromBody] UsuarioCreateDto dto)
    {
        var usuario = await service.CriarAsync(dto);

        if (usuario is null)
        {
            return Conflict(new
            {
                mensagem = "Já existe um usuário cadastrado com este e-mail."
            });
        }

        return CreatedAtAction(nameof(BuscarPorId), new { id = usuario.Id }, usuario);
    }

    [Authorize]
    [HttpPut("{id:long}")]
    public async Task<IActionResult> Atualizar(long id, [FromBody] UsuarioUpdateDto dto)
    {
        var usuario = await service.AtualizarAsync(id, dto);

        if (usuario is null)
        {
            return NotFound();
        }

        return Ok(usuario);
    }

    [Authorize(Roles = "ADMIN")]
    [HttpDelete("{id:long}")]
    public async Task<IActionResult> Deletar(long id)
    {
        var deletado = await service.DeletarAsync(id);

        if (!deletado)
        {
            return NotFound();
        }

        return NoContent();
    }
}