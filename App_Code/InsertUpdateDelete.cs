using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for InsertUpdateDelete
/// </summary>
public class InsertUpdateDelete
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DocumentUpload"].ToString());
    public InsertUpdateDelete()
    {

    }
    private string _Query = "";
    public string Query
    {
        get { return _Query; }
        set { _Query = value; }
    }


    public DataTable FetchToDataBase()
    {
        SqlDataAdapter sda = new SqlDataAdapter(Query, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        return dt;
    }
    public int Insert()
    {
        int a = 0;
        try
        {
            SqlCommand cmd = new SqlCommand(Query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            a = 1;
        }
        catch (Exception Ex)
        {
            a = 0;
            con.Close();
        }
        return a;
    }
    public int Delete()
    {
        int a = 0;
        try
        {
            SqlCommand cmd = new SqlCommand(Query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception Ex)
        {
            a = 0;
            con.Close();
        }
        return a;
    }
    public int Update()
    {
        int a = 0;
        try
        {
            SqlCommand cmd = new SqlCommand(Query, con);
            con.Close();
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            a = 1;
        }
        catch (Exception Ex)
        {
            a = 0;
            con.Close();
        }
        return a;
    }


   
}