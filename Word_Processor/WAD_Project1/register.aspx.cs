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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errEmail.Visible = false;
            errPassword.Visible = false;
            Panel1.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string firstName = tbFirstName.Text;
            string lastName = tbLastName.Text;
            string email = tbEmailAddress.Text;
            string password = tbPassword.Text;
            string confirmPassword = tbConfirmPassword.Text;
            string phone = tbPhoneNumber.Text;

            if(password == confirmPassword)
            {
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

                        if(!rdr.HasRows)
                        {
                            con.Close();
                            string query = "INSERT INTO Users (FirstName, LastName, Email, Password, MobileNumber) VALUES (@firstName, @lastName, @email, @password, @phone)";

                            using(cmd = new SqlCommand(query))
                            {
                                cmd.Parameters.AddWithValue("@firstName", firstName);
                                cmd.Parameters.AddWithValue("@lastName", lastName);
                                cmd.Parameters.AddWithValue("@email", email);
                                cmd.Parameters.AddWithValue("@password", password);
                                cmd.Parameters.AddWithValue("@phone", phone);
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Response.Redirect("login.aspx");
                                Response.Write("User created successfully");
                                con.Close();
                            }
                            
                        }
                        else
                        {
                            errEmail.Visible = true;
                        }

                        rdr.Close();
                    }
                }
                catch(Exception ex)
                {
                    Panel1.Visible = true;
                }

            }
            else
            {
                errPassword.Visible = true;
            }
        }
    }
}