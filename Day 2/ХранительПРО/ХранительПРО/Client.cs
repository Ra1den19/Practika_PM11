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
    public partial class Client : Form
    {
        public Client()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SotrList sl = new SotrList();
            sl.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            string client = klient.Text;
            string sotrudnik = sotr.Text;
            string connectionString = $@"Data Source = DESKTOP-BAT1MFP\SQLEXPRESS; Integrated Security = True; Initial Catalog = ХранительПРО";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"INSERT INTO Заявки ([код заявки], [код клиента], [код сотрудника]) VALUES ('{Randomkod()}', '{client}', '{sotrudnik}')";
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
