using System.ComponentModel.DataAnnotations;

namespace BlogPessoal.DTOs;

public class TextoIARequest
{
    [Required(ErrorMessage = "O texto é obrigatório.")]
    [StringLength(5000, MinimumLength = 10, ErrorMessage = "O texto deve ter entre 10 e 5000 caracteres.")]
    public string Texto { get; set; } = string.Empty;
}