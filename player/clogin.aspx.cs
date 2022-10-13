using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace player
{
    public partial class clogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BLOG_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from creator_info where cuser_id=@cuser_id and password=@password", con);
            cmd.Parameters.AddWithValue("@cuser_id", UIDT.Text);
            cmd.Parameters.AddWithValue("@password", PASST.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();

            con.Close();
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("crea.aspx");
            }
            else
            {
                Label1.Text = "Your username and word is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}