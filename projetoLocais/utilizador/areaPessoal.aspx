<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="areaPessoal.aspx.cs" Inherits="projetoLocais.utilizador.areaPessoal" %>

<!DOCTYPE html>
<html lang="pt">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Área Pessoal</title>
    <link rel="stylesheet" href="../Content/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <h1>Locais de Portugal</h1>
            <nav>
                <ul>
                    <li><a href="../paginaInicial.aspx">Página Inicial</a></li>
                    <li><a href="logout.aspx">Sair</a></li>
                </ul>
            </nav>
        </header>
        <form id="form1" runat="server">
            <div class="form-container">
                <h2 class="form-title">Minha Conta</h2>
                <asp:Label ID="lblMensagem" runat="server" CssClass="error-message"></asp:Label>

                <div class="form-group">
                    <label for="textNome">Nome:</label>
                    <asp:TextBox ID="textNome" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="textEmail">Email:</label>
                    <asp:TextBox ID="textEmail" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="textData">Data de Nascimento:</label>
                    <asp:TextBox ID="textData" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>
                </div>

                <asp:Button ID="btnEditar" runat="server" CssClass="btn-submit" Text="Editar" OnClick="btnEditar_Click" />
                <asp:Button ID="btnSalvar" runat="server" CssClass="btn-submit" Text="Salvar" Visible="false" OnClick="btnSalvar_Click" />
            </div>
        </form>
        <footer>
            <p>Feito por: Thulio Vicente</p>
        </footer>
    </div>
</body>
</html>
