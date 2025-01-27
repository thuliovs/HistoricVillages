using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projetoLocais.utilizador
{
    public partial class areaPessoal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarDadosUsuario();
            }
        }

        private void CarregarDadosUsuario()
        {
            MembershipUser usuario = Membership.GetUser();
            if (usuario != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Nome, Email, DataNascimento FROM Utilizador WHERE Id = @userId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", usuario.ProviderUserKey.ToString());

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        textNome.Text = reader["Nome"].ToString();
                        textEmail.Text = reader["Email"].ToString();
                        textData.Text = Convert.ToDateTime(reader["DataNascimento"]).ToShortDateString();
                    }
                    conn.Close();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            textNome.ReadOnly = false;
            textEmail.ReadOnly = false;
            textData.ReadOnly = false;
            btnSalvar.Visible = true;
            btnEditar.Visible = false;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            MembershipUser usuario = Membership.GetUser();
            if (usuario != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Utilizador SET Nome = @nome, Email = @email, DataNascimento = @data WHERE Id = @userId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", usuario.ProviderUserKey.ToString());
                    cmd.Parameters.AddWithValue("@nome", textNome.Text);
                    cmd.Parameters.AddWithValue("@email", textEmail.Text);
                    cmd.Parameters.AddWithValue("@data", DateTime.Parse(textData.Text));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                lblMensagem.Text = "Dados atualizados com sucesso!";
                textNome.ReadOnly = true;
                textEmail.ReadOnly = true;
                textData.ReadOnly = true;
                btnSalvar.Visible = false;
                btnEditar.Visible = true;
            }
        }
    }
}