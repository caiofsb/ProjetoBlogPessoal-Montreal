using BlogPessoal.DTOs;
using BlogPessoal.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BlogPessoal.Controllers;

[ApiController]
[Route("api/temas")]
public class TemasController(TemaService service) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> Listar()
    {
        var temas = await service.ListarAsync();

        return Ok(temas);
    }

    [HttpGet("{id:long}")]
    public async Task<IActionResult> BuscarPorId(long id)
    {
        var tema = await service.BuscarPorIdAsync(id);

        if (tema is null)
        {
            return NotFound();
        }

        return Ok(tema);
    }

    [Authorize(Roles = "ADMIN")]
    [HttpPost]
    public async Task<IActionResult> Criar([FromBody] TemaDto dto)
    {
        var tema = await service.CriarAsync(dto);

        return CreatedAtAction(nameof(BuscarPorId), new { id = tema.Id }, tema);
    }

    [Authorize(Roles = "ADMIN")]
    [HttpPut("{id:long}")]
    public async Task<IActionResult> Atualizar(long id, [FromBody] TemaDto dto)
    {
        var tema = await service.AtualizarAsync(id, dto);

        if (tema is null)
        {
            return NotFound();
        }

        return Ok(tema);
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
