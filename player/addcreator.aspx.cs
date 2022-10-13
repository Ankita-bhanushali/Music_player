using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Windows.Input;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace player
{
    public partial class addcreator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                byte[] sound;
                Stream stream = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(stream);
                sound = br.ReadBytes((Int32)stream.Length);
                SqlConnection con = new SqlConnection("Data Source=DESKTOP-AGD0GAQ\\SQLEXPRESS;Initial Catalog=music_player;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("insert into musiclist values(@music_file,@music_name,@singer)");
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@music_file", sound);
                cmd.Parameters.AddWithValue("@music_name", music.Text);
                cmd.Parameters.AddWithValue("@singer", singer.Text);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Label5.Text = "Success"; 
                }
              
                else
                {
                    Label5.Text = "Failed";

                }
                con.Close();
            }
            else
            {
                Label5.Text = "Kindly Select Mp3 File on Your PC For Upload First";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("crea.aspx");
        }

       
    }


}