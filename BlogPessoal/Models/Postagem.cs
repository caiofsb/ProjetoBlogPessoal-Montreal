namespace BlogPessoal.Models;

public class Postagem
{
    public long Id { get; set; }

    public string Titulo { get; set; } = string.Empty;

    public string Texto { get; set; } = string.Empty;

    public DateTime Data { get; set; } = DateTime.UtcNow;

    public string? ResumoIA { get; set; }

    public string? TagsIA { get; set; }

    public string? CategoriaIA { get; set; }

    public long UsuarioId { get; set; }

    public long TemaId { get; set; }
}