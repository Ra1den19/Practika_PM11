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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Authorization_Click(object sender, EventArgs e)
        {
            string username = log.Text;
            string password = pas.Text;
            string connectionString = $@"Data Source = DESKTOP-BAT1MFP\SQLEXPRESS; Integrated Security = True; Initial Catalog = ХранительПРО";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Enter", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Username", username));
                    command.Parameters.Add(new SqlParameter("@Password", password));

                    connection.Open();
                    int isAuthenticated = (int)command.ExecuteScalar();
                    connection.Close();

                    if (isAuthenticated == 1)
                    {
                        MessageBox.Show("Успешно");
                        Client cc = new Client();
                        cc.ShowDialog();

                    }
                    else
                    {
                        MessageBox.Show("Безуспешно");
                    }
                }
            }
        }


        private void label3_Click(object sender, EventArgs e)
        {
            SotrudnikEnter st = new SotrudnikEnter();
            st.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RegistrationClient rg = new RegistrationClient();
            rg.ShowDialog();
        }
    }
}
