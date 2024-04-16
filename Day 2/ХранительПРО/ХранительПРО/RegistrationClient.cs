using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ХранительПРО
{
    public partial class RegistrationClient : Form
    {
        public RegistrationClient()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string klient = kli.Text;
            string login = log.Text;
            string password = pas.Text;
            string connectionString = $@"Data Source = DESKTOP-BAT1MFP\SQLEXPRESS; Integrated Security = True; Initial Catalog = ХранительПРО";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                    string query = $"INSERT INTO [Учетные данные клиентов] ([код учетных данных], [код клиента], логин, пароль) VALUES ('{Randomkod()}', '{klient}', '{login}', '{password}')";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
            }
           
        }

        public int Randomkod()
        {
            Random rnd = new Random();
            int value = rnd.Next(0, 1000);
            return value;
        }
    }
}
