using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace ProjetoLocais
{
    public partial class local: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idLocal;
                if (int.TryParse(Request.QueryString["id"], out idLocal))
                {
                    CarregarDetalhesDoLocal(idLocal);
                    CarregarComentarios(idLocal);
                }
                else
                {
                    Response.Redirect("paginaInicial.aspx");
                }
            }
        }

        private void CarregarDetalhesDoLocal(int idLocal)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT l.Nome, l.Descricao, l.Latitude, l.Longitude, c.Nome AS Concelho, d.Nome AS Distrito, f.Ficheiro " +
                                                "FROM Local l " +
                                                "JOIN Concelho c ON l.Concelho = c.Id " +
                                                "JOIN Distrito d ON c.Distrito = d.Id " +
                                                "LEFT JOIN Foto f ON l.Id = f.Local " +
                                                "WHERE l.Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", idLocal);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblNomeLocal.Text = reader["Nome"].ToString();
                    lblDescricao.Text = reader["Descricao"].ToString();
                    lblConcelho.Text = reader["Concelho"].ToString();
                    lblDistrito.Text = reader["Distrito"].ToString();
                    lblLatitude.Text = reader["Latitude"].ToString();
                    lblLongitude.Text = reader["Longitude"].ToString();
                    imgLocal.ImageUrl = reader["Ficheiro"].ToString();
                }
            }
        }

        private void CarregarComentarios(int idLocal)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT u.Nome AS Utilizador, c.Comentario AS TextoComentario " +
                                                "FROM Comentario c " +
                                                "JOIN Utilizador u ON c.Utilizador = u.Id " +
                                                "WHERE c.Local = @Id ORDER BY c.Data DESC", conn);
                cmd.Parameters.AddWithValue("@Id", idLocal);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                rptComentarios.DataSource = dt;
                rptComentarios.DataBind();
            }
        }
    }
}