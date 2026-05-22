using System.Net;
using System.Text.Json;

namespace BlogPessoal.Middlewares;

public class ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
{
    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await next(context);
        }
        catch (Exception exception)
        {
            logger.LogError(exception, "Erro não tratado na API.");

            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var resposta = new
            {
                status = context.Response.StatusCode,
                mensagem = "Ocorreu um erro interno na aplicação.",
                detalhe = "Tente novamente mais tarde."
            };

            var json = JsonSerializer.Serialize(resposta);

            await context.Response.WriteAsync(json);
        }
    }
}