using System.ComponentModel.DataAnnotations;

namespace BlogPessoal.Models;

public class Postagem
{
    public long Id { get; set; }

    [Required(ErrorMessage = "O título da postagem é obrigatório.")]
    [StringLength(100, MinimumLength = 5, ErrorMessage = "O título deve ter entre 5 e 100 caracteres.")]
    public string Titulo { get; set; } = string.Empty;

    [Required(ErrorMessage = "O texto da postagem é obrigatório.")]
    [StringLength(5000, MinimumLength = 10, ErrorMessage = "O texto deve ter entre 10 e 5000 caracteres.")]
    public string Texto { get; set; } = string.Empty;

    public DateTime Data { get; set; } = DateTime.UtcNow;

    [StringLength(1000, ErrorMessage = "O resumo gerado pela IA deve ter no máximo 1000 caracteres.")]
    public string? ResumoIA { get; set; }

    [StringLength(500, ErrorMessage = "As tags geradas pela IA devem ter no máximo 500 caracteres.")]
    public string? TagsIA { get; set; }

    [StringLength(100, ErrorMessage = "A categoria gerada pela IA deve ter no máximo 100 caracteres.")]
    public string? CategoriaIA { get; set; }

    public long UsuarioId { get; set; }

    public long TemaId { get; set; }
}