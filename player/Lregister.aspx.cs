using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace player
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into listener_info values(@luser_id,@name,@email,@mobile,@password,@re_password)", con);
                cmd.Parameters.AddWithValue("luser_id", userid.Text);
                cmd.Parameters.AddWithValue("name", name.Text);
                cmd.Parameters.AddWithValue("email", email.Text);
                cmd.Parameters.AddWithValue("mobile", mobile.Text);
                cmd.Parameters.AddWithValue("password", pass.Text);
                cmd.Parameters.AddWithValue("re_password", repass.Text);
                cmd.ExecuteNonQuery();
                userid.Text = "";
                name.Text = "";
                email.Text = "";
                mobile.Text = "";
                pass.Text = "";
                repass.Text = "";
                userid.Focus();
                con.Close();

            }
            Response.Write("<script>alert('Registered Successfully !\n\n Login Now');</script>");
            Response.Redirect("login.aspx");
        }
    }
    }
