using BlogPessoal.DTOs;

namespace BlogPessoal.Services.IA;

public interface IGeminiService
{
    Task<ResultadoIA> GerarResumoAsync(string texto);
}