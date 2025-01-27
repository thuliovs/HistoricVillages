<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="projetoLocais.criar_conta" %>

<!DOCTYPE html>
<html lang="pt">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta</title>
    <link rel="stylesheet" href="Content/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <a href="paginaInicial.aspx"><h1>Locais de Portugal</h1></a>
            <nav>
                <ul>
                    <li><a href="paginaInicial.aspx">Página Inicial</a></li>
                    <li><a href="login.aspx" class="login">Iniciar Sessão</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <form id="form1" runat="server">
                <div class="form-container">
                    <h2 class="form-title">Fazer Registro</h2>
                    <div class="form-group">
                        <label for="textNome">Nome</label>
                        <asp:TextBox ID="textNome" runat="server" CssClass="input-field" placeholder="Digite seu nome..." />
                        <asp:RequiredFieldValidator ID="reqNome" runat="server" ControlToValidate="textNome" ErrorMessage="Obrigatório" CssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="textEmail">Email</label>
                        <asp:TextBox ID="textEmail" runat="server" CssClass="input-field" placeholder="Digite seu email..." />
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="textEmail" ErrorMessage="Obrigatório" CssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="textData">Data de nascimento</label>
                        <asp:TextBox ID="textData" runat="server" CssClass="input-field" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="reqData" runat="server" ControlToValidate="textData" ErrorMessage="Obrigatório" CssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="textUsername">Nome de utilizador</label>
                        <asp:TextBox ID="textUsername" runat="server" CssClass="input-field" placeholder="Escolha um nome de utilizador..." />
                        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="textUsername" ErrorMessage="Obrigatório" CssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="textPassword">Palavra-passe</label>
                        <asp:TextBox ID="textPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Digite sua senha..." />
                        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="textPassword" ErrorMessage="Obrigatório" CssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="textConfirmPassword">Repita a palavra-passe</label>
                        <asp:TextBox ID="textConfirmPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Confirme sua senha..." />
                        <asp:RequiredFieldValidator ID="reqConfirmPassword" runat="server" ControlToValidate="textConfirmPassword" ErrorMessage="Obrigatório" CssClass="error-message" />
                        <asp:CompareValidator ID="comparePasswords" runat="server" ControlToValidate="textConfirmPassword" ControlToCompare="textPassword" ErrorMessage="As senhas não coincidem" CssClass="error-message" />
                    </div>

                    <asp:CompareValidator 
                        ID="reqDataNascimento" 
                        runat="server" 
                        ControlToValidate="textData" 
                        Operator="LessThanEqual" 
                        Type="Date" 
                        ErrorMessage="Data inválida!" 
                        CssClass="error-message" />

                    <asp:Label 
                        ID="lblMensagem" 
                        runat="server" 
                        CssClass="error-message" />

                    <asp:Button ID="btnCriarConta" runat="server" Text="Criar conta" CssClass="btn-submit" OnClick="btnCriarConta_Click" /><br>
                    <asp:Button ID="btnFazerLogin" runat="server" Text="Já tenho conta" CssClass="btn-submit" OnClick="btnFazerLogin_Click" Style="margin-top: 20px" CausesValidation="false" />
                </div>
            </form>
        </main>

        <footer>
            <p>Feito por: Thúlio Vicente</p>
        </footer>
    </div>
</body>
</html>