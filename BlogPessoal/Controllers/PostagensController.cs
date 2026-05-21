using BlogPessoal.DTOs;
using BlogPessoal.Services;
using Microsoft.AspNetCore.Mvc;

namespace BlogPessoal.Controllers;

[ApiController]
[Route("api/postagens")]
public class PostagensController(PostagemService service) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> Listar()
    {
        var postagens = await service.ListarAsync();

        return Ok(postagens);
    }

    [HttpGet("{id:long}")]
    public async Task<IActionResult> BuscarPorId(long id)
    {
        var postagem = await service.BuscarPorIdAsync(id);

        if (postagem is null)
        {
            return NotFound();
        }

        return Ok(postagem);
    }

    [HttpGet("usuario/{usuarioId:long}")]
    public async Task<IActionResult> BuscarPorUsuario(long usuarioId)
    {
        var postagens = await service.BuscarPorUsuarioAsync(usuarioId);

        return Ok(postagens);
    }

    [HttpGet("tema/{temaId:long}")]
    public async Task<IActionResult> BuscarPorTema(long temaId)
    {
        var postagens = await service.BuscarPorTemaAsync(temaId);

        return Ok(postagens);
    }

    [HttpPost]
    public async Task<IActionResult> Criar([FromBody] PostagemCreateDto dto)
    {
        var postagem = await service.CriarAsync(dto);

        return CreatedAtAction(nameof(BuscarPorId), new { id = postagem.Id }, postagem);
    }

    [HttpPut("{id:long}")]
    public async Task<IActionResult> Atualizar(long id, [FromBody] PostagemUpdateDto dto)
    {
        var postagem = await service.AtualizarAsync(id, dto);

        if (postagem is null)
        {
            return NotFound();
        }

        return Ok(postagem);
    }

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