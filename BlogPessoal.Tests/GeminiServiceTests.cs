using BlogPessoal.Config;
using BlogPessoal.Services.IA;
using Microsoft.Extensions.Options;

namespace BlogPessoal.Tests;

public class GeminiServiceTests
{
    [Fact]
    public async Task DeveRetornarRespostaPadraoQuandoApiKeyNaoConfigurada()
    {
        var service = new GeminiService(
            new HttpClient(),
            Options.Create(new GeminiOptions
            {
                ApiKey = "",
                Model = "gemini-3.1-flash-lite"
            }));

        var resultado = await service.GerarResumoAsync(
            "Texto de teste para validar o comportamento do serviço de inteligência artificial.");

        Assert.Contains("Chave da API Gemini não configurada", resultado.Resumo);
        Assert.Equal("configuração, gemini, ia", resultado.Tags);
        Assert.Equal("Configuração", resultado.Categoria);
    }

    [Fact]
    public async Task DeveRetornarRespostaPadraoQuandoApiKeyVazia()
    {
        var service = new GeminiService(
            new HttpClient(),
            Options.Create(new GeminiOptions
            {
                ApiKey = "",
                Model = "gemini-3.1-flash-lite"
            }));

        var resultado = await service.GerarResumoAsync(
            "Outro texto de teste para validar resposta padrão sem chave configurada.");

        Assert.Contains("Chave da API Gemini não configurada", resultado.Resumo);
        Assert.False(string.IsNullOrWhiteSpace(resultado.Tags));
        Assert.False(string.IsNullOrWhiteSpace(resultado.Categoria));
    }
}