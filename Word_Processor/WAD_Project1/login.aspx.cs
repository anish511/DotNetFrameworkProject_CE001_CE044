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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errEmail.Visible = false;
            errPassword.Visible = false;
            Panel1.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = tbLoginEmail.Text;
            string password = tbLoginPassword.Text;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;

            try
            {
                using (con)
                {
                    string command = "Select * from Users where Email='" + email + "'";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {

                        if (rdr.Read())
                        {
                            string dbPassword = rdr.GetString(4);


                            if (password == dbPassword)
                            {
                                Session["email"] = rdr.GetString(3);
                                Session["firstName"] = rdr.GetString(1);
                                Response.Write("User Logged in successfully");
                                HttpCookie userInfo = new HttpCookie("styles");
                                userInfo["styles"] = "body{";
                                Response.Cookies.Add(userInfo);
                                Response.Redirect("home.aspx");
                            }
                            else
                            {
                                errPassword.Visible = true;
                            }
                        }

                    }
                    else
                    {
                        errEmail.Visible = true;
                    }

                    rdr.Close();
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Panel1.Visible = true;
            }
        }

        
    }
}