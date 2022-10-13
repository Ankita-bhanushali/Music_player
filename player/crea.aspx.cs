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
    public partial class crea : System.Web.UI.Page
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
                String txt = "select * from musiclist";
                SqlCommand cmd = new SqlCommand(txt, con);
                cmd.CommandText = txt;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
            }
        }

        protected void ImageButton2_Click(object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("delete from musiclist where music_name=@music_name ", con);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@music_name", SqlDbType.NVarChar).Value = e.CommandArgument.ToString();
            con.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script>alert('Song Removed!');</script>");
            }

            else
            {
                Response.Write("<script>alert('Not Removed');</script>");
            }
            con.Close();
            BindDataList();
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("addcreator.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("clogin.aspx");
        }
    }
}