namespace BlogPessoal.DTOs;

public class PostagemResponseDto
{
    public long Id { get; set; }

    public string Titulo { get; set; } = string.Empty;

    public string Texto { get; set; } = string.Empty;

    public DateTime Data { get; set; }

    public string? ResumoIA { get; set; }

    public string? TagsIA { get; set; }

    public string? CategoriaIA { get; set; }

    public long UsuarioId { get; set; }

    public string UsuarioNome { get; set; } = string.Empty;

    public long TemaId { get; set; }

    public string TemaDescricao { get; set; } = string.Empty;
}