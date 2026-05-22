using System.Text;
using System.Text.Json;
using BlogPessoal.Config;
using BlogPessoal.DTOs;
using Microsoft.Extensions.Options;

namespace BlogPessoal.Services.IA;

public class GeminiService(
    HttpClient httpClient,
    IOptions<GeminiOptions> options) : IGeminiService
{
    private readonly GeminiOptions _options = options.Value;

    public async Task<ResultadoIA> GerarResumoAsync(string texto)
    {
        if (string.IsNullOrWhiteSpace(_options.ApiKey) ||
            _options.ApiKey == "SUA_CHAVE_GEMINI_AQUI")
        {
            return new ResultadoIA
            {
                Resumo = "Chave da API Gemini não configurada. Configure Gemini:ApiKey para usar a IA.",
                Tags = "configuração, gemini, ia",
                Categoria = "Configuração"
            };
        }

        var prompt = PromptBuilder.CriarPromptResumoPostagem(texto);

        var requestBody = new
        {
            contents = new[]
            {
                new
                {
                    parts = new[]
                    {
                        new
                        {
                            text = prompt
                        }
                    }
                }
            }
        };

        var json = JsonSerializer.Serialize(requestBody);

        using var request = new HttpRequestMessage(
            HttpMethod.Post,
            $"https://generativelanguage.googleapis.com/v1beta/models/{_options.Model}:generateContent");

        request.Headers.Add("x-goog-api-key", _options.ApiKey);
        request.Content = new StringContent(json, Encoding.UTF8, "application/json");

        using var response = await httpClient.SendAsync(request);

        if (!response.IsSuccessStatusCode)
        {
            return new ResultadoIA
            {
                Resumo = "Não foi possível gerar o resumo com Gemini neste momento.",
                Tags = "erro, gemini, ia",
                Categoria = "Indisponível"
            };
        }

        var responseContent = await response.Content.ReadAsStringAsync();
        var textoGerado = ExtrairTextoGerado(responseContent);

        return InterpretarResposta(textoGerado);
    }

    private static string ExtrairTextoGerado(string json)
    {
        try
        {
            using var document = JsonDocument.Parse(json);

            var root = document.RootElement;

            var texto = root
                .GetProperty("candidates")[0]
                .GetProperty("content")
                .GetProperty("parts")[0]
                .GetProperty("text")
                .GetString();

            return texto ?? string.Empty;
        }
        catch
        {
            return string.Empty;
        }
    }

    private static ResultadoIA InterpretarResposta(string texto)
    {
        if (string.IsNullOrWhiteSpace(texto))
        {
            return new ResultadoIA
            {
                Resumo = "A IA não retornou conteúdo para o texto informado.",
                Tags = "ia, resposta, vazia",
                Categoria = "Indefinida"
            };
        }

        var resultado = new ResultadoIA
        {
            Resumo = texto,
            Tags = "blog, postagem, ia",
            Categoria = "Geral"
        };

        var linhas = texto
            .Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

        foreach (var linha in linhas)
        {
            if (linha.StartsWith("Resumo:", StringComparison.OrdinalIgnoreCase))
            {
                resultado.Resumo = linha.Replace("Resumo:", string.Empty, StringComparison.OrdinalIgnoreCase).Trim();
            }

            if (linha.StartsWith("Tags:", StringComparison.OrdinalIgnoreCase))
            {
                resultado.Tags = linha.Replace("Tags:", string.Empty, StringComparison.OrdinalIgnoreCase).Trim();
            }

            if (linha.StartsWith("Categoria:", StringComparison.OrdinalIgnoreCase))
            {
                resultado.Categoria = linha.Replace("Categoria:", string.Empty, StringComparison.OrdinalIgnoreCase).Trim();
            }
        }

        return resultado;
    }
}