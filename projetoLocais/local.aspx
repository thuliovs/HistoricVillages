<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="local.aspx.cs" Inherits="ProjetoLocais.local" %>

<!DOCTYPE html>
<html lang="pt">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes do Local</title>
    <link rel="stylesheet" href="Content/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <a href="paginaInicial.aspx"><h1>Locais de Portugal</h1></a>
            <nav>
                <ul>
                    <li><a href="paginaInicial.aspx">Página Inicial</a></li>
                    <li><a href="#">Pesquisa</a></li>
                    <li><a href="login.aspx" class="login">Iniciar Sessão</a></li>
                    <li><a href="criar_conta.aspx" class="login">Registro</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <asp:Label ID="lblNomeLocal" runat="server" CssClass="location-title"></asp:Label>
            <div class="location-details">
                <asp:Image ID="imgLocal" runat="server" CssClass="location-image" />
                <p><strong>Descrição:</strong> <asp:Label ID="lblDescricao" runat="server"></asp:Label></p>
                <p><strong>Concelho:</strong> <asp:Label ID="lblConcelho" runat="server"></asp:Label></p>
                <p><strong>Distrito:</strong> <asp:Label ID="lblDistrito" runat="server"></asp:Label></p>
                <p><strong>Coordenadas:</strong> 
                    <asp:Label ID="lblLatitude" runat="server"></asp:Label>, 
                    <asp:Label ID="lblLongitude" runat="server"></asp:Label>
                </p>
            </div>

            <div class="sidebar">
                <h3>Comentários</h3>
                <asp:Repeater ID="rptComentarios" runat="server">
                    <ItemTemplate>
                        <div class="comment">
                            <p><strong><%# Eval("Utilizador") %>:</strong> <%# Eval("TextoComentario") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </main>

        <footer>
            <p>Feito por: Thúlio Vicente</p>
        </footer>
    </div>
</body>
</html>