using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace projetoLocais
{
    public partial class criar_conta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Definir mensagem de erro e data mínima para a criação da conta (18 anos atrás)
                string data = DateTime.Now.AddYears(-18).ToShortDateString();
                reqDataNascimento.ErrorMessage = "Defina uma data igual ou anterior a " + data;
                reqDataNascimento.ValueToCompare = data;
            }
        }

        protected void btnFazerLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnCriarConta_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Criar conta de utilizador usando a API Membership
                    MembershipCreateStatus status;
                    Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text, null, null, true, out status);

                    if (status == MembershipCreateStatus.Success)
                    {
                        // Obter o UserID gerado automaticamente
                        MembershipUser user = Membership.GetUser(textUsername.Text);
                        object user_id = user.ProviderUserKey;

                        // Inserir dados adicionais na tabela Utilizador
                        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            string query = "INSERT INTO Utilizador (Id, Nome, Email, DataNascimento) VALUES (@user_id, @nome, @email, @data)";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@user_id", user_id.ToString());
                                cmd.Parameters.AddWithValue("@nome", textNome.Text);
                                cmd.Parameters.AddWithValue("@email", textEmail.Text);
                                cmd.Parameters.AddWithValue("@data", DateTime.Parse(textData.Text));

                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }

                        // Redirecionar para a página de login após a criação bem-sucedida
                        Response.Redirect("login.aspx");
                    }
                    else
                    {
                        lblMensagem.Text = "Erro ao criar conta: " + GetErrorMessage(status);
                    }
                }
                catch (Exception ex)
                {
                    lblMensagem.Text = "Erro ao processar o pedido. Tente novamente.";
                    // Registrar erro no log do servidor para depuração
                    System.Diagnostics.Debug.WriteLine("Erro ao criar conta: " + ex.Message);
                }
            }
        }

        private string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Nome de utilizador já existe.";
                case MembershipCreateStatus.DuplicateEmail:
                    return "Já existe uma conta com este email.";
                case MembershipCreateStatus.InvalidPassword:
                    return "A senha fornecida não atende aos requisitos de segurança.";
                case MembershipCreateStatus.InvalidEmail:
                    return "O email fornecido não é válido.";
                case MembershipCreateStatus.UserRejected:
                    return "A criação do utilizador foi rejeitada. Tente novamente.";
                default:
                    return "Erro desconhecido ao criar conta.";
            }
        }
    }
}