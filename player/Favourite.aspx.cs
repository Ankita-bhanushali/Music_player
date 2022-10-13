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
    public partial class Favourite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }
        }
        private void BindDataList()
        {
            String CS = ConfigurationManager.ConnectionStrings["musicplayerConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                String Id = (Session["user"].ToString());
                String txt = "select * from musiclist where music_name IN( select music_name from favourite where luser_id = @luser_id )";
                SqlCommand cmd = new SqlCommand(txt, con);
                cmd.CommandText = txt;
                cmd.Parameters.AddWithValue("@luser_id", Id);
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void ImageButton2_Click(object sender, CommandEventArgs e)
        {
            String s = Session["user"].ToString();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("delete from favourite where luser_id = @luser_id and music_name=@music_name ", con);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@luser_id", SqlDbType.NVarChar).Value = s;
            cmd.Parameters.AddWithValue("@music_name", SqlDbType.NVarChar).Value = e.CommandArgument.ToString();
            con.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script>alert('Removed from Favourites');</script>");
            }

            else
            {
                Response.Write("<script>alert('Not Removed from Favourites');</script>");
            }
            con.Close();
            BindDataList();
        }
    }
}