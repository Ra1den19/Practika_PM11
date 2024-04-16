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
    public partial class SotrudnikEnter : Form
    {
        public SotrudnikEnter()
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
                using (SqlCommand command = new SqlCommand("EnterSotrudnik", connection))
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
                        Sotrudnik sot = new Sotrudnik();
                        sot.ShowDialog();
                       
                    }
                    else
                    {
                        MessageBox.Show("Безуспешно");
                    }
                }
            }
        }
    }
}
