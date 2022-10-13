
using System;
using System.Data;
using System.Data.SqlClient;

namespace player
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BLOG_Click(object sender, EventArgs e)
        {

            String mycon = "Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from listener_info where luser_id='" + UIDT.Text + "' and password='" + PASST.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            String uname;
            String pass;
            if (ds.Tables[0].Rows.Count > 0)
            {
                uname = ds.Tables[0].Rows[0]["luser_id"].ToString();
                pass = ds.Tables[0].Rows[0]["password"].ToString();

                scon.Close();
                if (uname == UIDT.Text && pass == PASST.Text)
                {
                    Session["user"] = UIDT.Text;
                    Response.Redirect("list.aspx");
                }
                else
                {
                    Label1.Text = "Invalid Username or Password - Relogin with Correct Username Password";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label1.Text = "Invalid Username or Password - Relogin with Correct Username Password";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}