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
    public partial class updateProfile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            sucChange.Visible = false;
            Panel1.Visible = false;

            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;
                string email = (string)Session["email"];
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
                                updateFirstName.Text = rdr.GetString(1);
                                updateLastName.Text = rdr.GetString(2);
                                updateEmail.Text = rdr.GetString(3);
                                updatePassword.Text = rdr.GetString(4);
                                updateMobile.Text = rdr.GetString(5);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Panel1.Visible = true;
                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["userConnection"].ConnectionString;
            string email = (string)Session["email"];

            try
            {
                using (con)
                {
                    string command = "Update [Users] set [FirstName]=@firstName, [LastName]=@lastName, [Email]=@email, [Password]=@password, [MobileNumber]=@mobile where Email='" + email + "'"; 
                    using (SqlCommand cmd = new SqlCommand(command))
                    {
                        cmd.Parameters.AddWithValue("@firstName", updateFirstName.Text);
                        cmd.Parameters.AddWithValue("@lastName", updateLastName.Text);
                        cmd.Parameters.AddWithValue("@email", updateEmail.Text);
                        cmd.Parameters.AddWithValue("@password", updatePassword.Text);
                        cmd.Parameters.AddWithValue("@mobile", updateMobile.Text);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Session["email"] = updateEmail.Text;
                        Session["firstName"] = updateFirstName.Text;

                        sucChange.Visible = true;
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Panel1.Visible = true;
            }

        }
    }
}