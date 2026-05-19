using System.ComponentModel.DataAnnotations;

namespace BlogPessoal.DTOs;

public class UsuarioUpdateDto
{
    [Required(ErrorMessage = "O nome é obrigatório.")]
    [StringLength(120, ErrorMessage = "O nome deve ter no máximo 120 caracteres.")]
    public string Nome { get; set; } = string.Empty;

    [Required(ErrorMessage = "O nome de usuário é obrigatório.")]
    [StringLength(80, ErrorMessage = "O nome de usuário deve ter no máximo 80 caracteres.")]
    public string UsuarioNome { get; set; } = string.Empty;

    [StringLength(500, ErrorMessage = "A foto deve ter no máximo 500 caracteres.")]
    public string Foto { get; set; } = string.Empty;

    [StringLength(30, ErrorMessage = "O tipo deve ter no máximo 30 caracteres.")]
    public string Tipo { get; set; } = "NORMAL";
}