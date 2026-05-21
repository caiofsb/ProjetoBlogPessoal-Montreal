namespace BlogPessoal.DTOs;

public class UsuarioLoginResponseDto
{
    public long Id { get; set; }

    public string Nome { get; set; } = string.Empty;

    public string UsuarioNome { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string Tipo { get; set; } = string.Empty;

    public string Token { get; set; } = string.Empty;

    public DateTime ExpiraEm { get; set; }
}