<%@ webhandler language="C#" class="GenericHandler1" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class GenericHandler1 : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int ID = int.Parse(context.Request.QueryString["ID"]);
        byte[] bytes;
        string CS = ConfigurationManager.ConnectionStrings["musicplayerConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select music_file from musiclist where ID=@ID";
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Connection = con;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                bytes = (byte[])sdr["music_file"];
                con.Close();
            }
        }
        context.Response.Clear();
            context.Response.Buffer=true;
            context.Response.BinaryWrite(bytes);
            context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}