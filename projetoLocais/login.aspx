<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="projetoLocais.login" %>

<!DOCTYPE html>
<html lang="pt">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="Content/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <a href="paginaInicial.aspx"><h1>Locais de Portugal</h1></a>
            <nav>
                <ul>
                    <li><a href="paginaInicial.aspx">Página Inicial</a></li>
                    <li><a href="criar_conta.aspx">Registro</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <form id="form1" runat="server">
                <div class="form-container" style="margin-top:10%;margin-bottom:10%">
                    <h2 class="form-title">Iniciar Sessão</h2>

                    <asp:Label ID="lblMensagem" runat="server" CssClass="error-message" />

                    <div class="form-group">
                        <label for="textUsername">Nome de utilizador</label>
                        <asp:TextBox ID="textUsername" runat="server" CssClass="input-field" placeholder="Digite seu nome de utilizador..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="textUsername"
                            ErrorMessage="Obrigatório" CssClass="error-message" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="textPassword">Palavra-passe</label>
                        <asp:TextBox ID="textPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Digite sua palavra-passe..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="textPassword"
                            ErrorMessage="Obrigatório" CssClass="error-message" Display="Dynamic" />
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="btn-submit" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnCriarConta" runat="server" Text="Ainda não tenho conta" CssClass="btn-submit" OnClick="btnCriarConta_Click" Style="margin-top: 20px" CausesValidation="false" />
                </div>
            </form>
        </main>

        <footer>
            Feito por: Thulio Vicente
        </footer>
    </div>
</body>
</html>