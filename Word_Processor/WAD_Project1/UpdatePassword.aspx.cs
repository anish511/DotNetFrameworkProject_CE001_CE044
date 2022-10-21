using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Project1
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newPassword = updatePassword.Text;
            string confirmPwd = confirmPassword.Text;

            if(newPassword == confirmPwd)
            {
                int id = int.Parse(Request.QueryString["id"]);

                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;

                try
                {
                    using (con)
                    {
                        string command = "Update [Users] set [Password]=@password Where [Id]=@id";
                        using (SqlCommand cmd = new SqlCommand(command))
                        {
                            cmd.Parameters.AddWithValue("@password", newPassword);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            Response.Redirect("login.aspx");
                            con.Close();
                        }
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
               

            }
            else
            {
                Response.Write("Please Confirm your password...");
            }
        }
    }
}