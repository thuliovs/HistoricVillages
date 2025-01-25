<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paginaInicial.aspx.cs" Inherits="projetoLocais.paginaInicial" %>

<!DOCTYPE html>
<html lang="pt">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locais de Portugal</title>
    <link rel="stylesheet" href="Content/styles.css" />
</head>
<body>
    <div class="container">
        <header>
            <h1>Locais de Portugal</h1>
            <nav>
                <ul>
                    <li><a href="paginaInicial.aspx">Página Inicial</a></li>
                    <li><a href="#">Pesquisa</a></li>
                    <li><a href="login.aspx" class="login">Iniciar Sessão</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Bem-vindo!</h2>
            <div class="locations">
                <asp:Repeater ID="listLocais" runat="server">
                    <ItemTemplate>
                        <div class="location">
                            <a href='local.aspx?id=<%# Eval("LocalID") %>'>
                                <img src='<%# Eval("PrimeiraFoto") %>' alt='<%# Eval("NomeLocal") %>' />
                            </a>
                            <h3><%# Eval("NomeLocal") %></h3>
                            <p><strong>Concelho:</strong> <%# Eval("Concelho") %></p>
                            <p><strong>Distrito:</strong> <%# Eval("Distrito") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="sidebar">
                <h3>Locais com melhor classificação</h3>
            </div>

            <div class="pagination">
                <a href="#">Primeira</a>
                <a href="#">Anterior</a>
                <a href="#">Seguinte</a>
                <a href="#">Última</a>
            </div>
        </main>

        <footer>
            <p>Feito por: Thúlio Vicente</p>
        </footer>
    </div>
</body>
</html>