namespace BlogPessoal.Models;

public class Usuario
{
    public long Id { get; set; }

    public string Nome { get; set; } = string.Empty;

    public string UsuarioNome { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string Senha { get; set; } = string.Empty;

    public string Foto { get; set; } = string.Empty;

    public string Tipo { get; set; } = "NORMAL";
}