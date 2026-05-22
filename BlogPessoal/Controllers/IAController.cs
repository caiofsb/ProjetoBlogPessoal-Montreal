using BlogPessoal.DTOs;
using BlogPessoal.Services.IA;
using Microsoft.AspNetCore.Mvc;

namespace BlogPessoal.Controllers;

[ApiController]
[Route("api/ia")]
public class IAController(IGeminiService geminiService) : ControllerBase
{
    [HttpPost("resumir")]
    public async Task<IActionResult> Resumir([FromBody] TextoIARequest request)
    {
        var resultado = await geminiService.GerarResumoAsync(request.Texto);

        return Ok(resultado);
    }
}