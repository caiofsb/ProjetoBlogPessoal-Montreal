namespace BlogPessoal.Services.IA;

public static class PromptBuilder
{
    public static string CriarPromptResumoPostagem(string texto)
    {
        return $"""
        Analise o texto abaixo de uma postagem que vem de um blog pessoal.

        Retorne exatamente neste formato:

        Resumo: escreva um resumo curto em até 2 frases.
        Tags: liste de 3 a 5 tags separadas por vírgula.
        Categoria: informe uma única categoria principal.

        Texto:
        {texto}
        """;
    }
}