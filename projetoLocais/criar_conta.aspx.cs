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
                string data = DateTime.Now.AddYears(-18).ToShortDateString();
                validarDataNascimento.ErrorMessage = "Defina data igual ou anterior a " + data;
                validarDataNascimento.ValueToCompare = data;
            }
        }

        protected void btnCriarConta_Click(object sender, EventArgs e)
        {
            try
            {
                // Criar conta usando a API Membership
                Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text);

                // Obter o UserID gerado
                MembershipUser user = Membership.GetUser(textUsername.Text);
                object user_id = user.ProviderUserKey;

                // Inserir dados na tabela Utilizador
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Utilizador (Id, Nome, Email, DataNascimento) VALUES (@user_id, @nome, @email, @data)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id.ToString());
                    cmd.Parameters.AddWithValue("@nome", textUsername.Text);
                    cmd.Parameters.AddWithValue("@email", textEmail.Text);
                    cmd.Parameters.AddWithValue("@data", DateTime.Parse(textData.Text));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Erro ao criar conta: " + ex.Message);
            }
        }
    }
}