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
    public partial class AddClient : Form
    {
        public AddClient()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string FIO = fio.Text;
            string phone = tel.Text;
            string mail = em.Text;
            string org = kodorg.Text;
            string birthday = data.Text;
            string connectionString = $@"Data Source = DESKTOP-BAT1MFP\SQLEXPRESS; Integrated Security = True; Initial Catalog = ХранительПРО";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = $"INSERT INTO Клиенты ([код клиента], ФИО, телефон, email, [код организации], [дата рождения]) VALUES ('{Randomkod()}', '{FIO}', '{phone}', '{mail}', '{org}', '{birthday}')";
                SqlCommand com = new SqlCommand(query, con);
                com.Connection.Open();
                com.ExecuteNonQuery();
                con.Close();
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
