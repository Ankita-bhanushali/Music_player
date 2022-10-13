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
    
    public partial class list : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            String key = (Session["user"].ToString());
            int i = Convert.ToInt32(key);
            String que = "select distinct(name) from listener_info where luser_id='"+i+"' ";
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(que, con);
            string n = "";
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                n = reader["name"].ToString();
            }

            con.Close();

            Label3.Text = "Hello " + n;
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
            String s = Session["user"].ToString();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("insert into favourite values(@luser_id,@music_name)");
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@luser_id", s);
            cmd.Parameters.AddWithValue("@music_name", e.CommandArgument.ToString());
            con.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script>alert('Added to favourites!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Not Added to Favourites!');</script>");
            }
            con.Close();
        }

    
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["luser_id"] != null)
            {

                ImageButton btn = e.Item.FindControl("ImageButton2") as ImageButton;
                Label lb1 = e.Item.FindControl("Label1") as Label;
                SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("select * from favourite where music_name='" + lb1.Text + "' and luser_id='" + Session["luser_id"].ToString() + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();

                if (i == 1)
                {
                    btn.ImageUrl = "~/done.png";
                }
                else
                {
                    btn.ImageUrl = "~/add.png";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Favourite.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        
    }
}