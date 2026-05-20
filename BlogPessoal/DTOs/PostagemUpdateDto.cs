using System.ComponentModel.DataAnnotations;

namespace BlogPessoal.DTOs;

public class PostagemUpdateDto
{
    [Required(ErrorMessage = "O título da postagem é obrigatório.")]
    [StringLength(100, MinimumLength = 5, ErrorMessage = "O título deve ter entre 5 e 100 caracteres.")]
    public string Titulo { get; set; } = string.Empty;

    [Required(ErrorMessage = "O texto da postagem é obrigatório.")]
    [StringLength(5000, MinimumLength = 10, ErrorMessage = "O texto deve ter entre 10 e 5000 caracteres.")]
    public string Texto { get; set; } = string.Empty;

    [Range(1, long.MaxValue, ErrorMessage = "Informe um tema válido.")]
    public long TemaId { get; set; }
}