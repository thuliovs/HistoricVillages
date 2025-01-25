<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="projetoLocais.criar_conta" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Criar Conta</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Criar Conta</h2>
            <asp:Label ID="lblUsername" runat="server" Text="Nome de usuário:" />
            <asp:TextBox ID="textUsername" runat="server" />
            <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="textUsername" ErrorMessage="Obrigatório" />

            <asp:Label ID="lblPassword" runat="server" Text="Senha:" />
            <asp:TextBox ID="textPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="textPassword" ErrorMessage="Obrigatório" />

            <asp:Label ID="lblEmail" runat="server" Text="Email:" />
            <asp:TextBox ID="textEmail" runat="server" />
            <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="textEmail" ErrorMessage="Obrigatório" />
            <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="textEmail" ErrorMessage="Email inválido" ValidationExpression="\w+@\w+\.\w+" />

            <asp:Label ID="lblDataNascimento" runat="server" Text="Data de Nascimento:" />
            <asp:TextBox ID="textData" runat="server" TextMode="Date" />
            <asp:RequiredFieldValidator ID="reqData" runat="server" ControlToValidate="textData" ErrorMessage="Obrigatório" />
            <asp:CompareValidator ID="validarDataNascimento" runat="server" ControlToValidate="textData" Operator="LessThanEqual" Type="Date" ErrorMessage="" />

            <asp:Button ID="btnCriarConta" runat="server" Text="Criar Conta" OnClick="btnCriarConta_Click" />
        </div>
    </form>
</body>
</html>