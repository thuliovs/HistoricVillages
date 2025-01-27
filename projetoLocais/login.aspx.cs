using System;
using System.Web.Security;

namespace projetoLocais
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensagem.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(textUsername.Text, textPassword.Text))
            {
                FormsAuthentication.SetAuthCookie(textUsername.Text, false);
                Response.Redirect("utilizador/areaPessoal.aspx");
            }
            else
            {
                lblMensagem.Text = "Nome de utilizador ou palavra-passe inválidos.";
            }
        }

        protected void btnCriarConta_Click(object sender, EventArgs e)
        {
            Response.Redirect("criar_conta.aspx");
        }
    }
}