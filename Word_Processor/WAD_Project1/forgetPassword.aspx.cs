using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace WAD_Project1
{
    public partial class forgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errEmail.Visible = false;
            sucEmail.Visible = false;
            Panel1.Visible = false;
        }

        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            string email = forgetEmail.Text;
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
                        if (rdr.Read()) {
                            string to = email; //To address    
                            string from = "girianishpramodbhai@gmail.com"; //From address    
                            MailMessage message = new MailMessage(from, to);

                            string mailbody = "Hey, follow this link to reset your password: http://localhost:57069/UpdatePassword.aspx?id=" + rdr.GetInt32(0);
                            message.Subject = "Reset Password";
                            message.Body = mailbody;
                            message.BodyEncoding = Encoding.UTF8;
                            message.IsBodyHtml = true;
                            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                            System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("girianishpramodbhai@gmail.com", "biwywbsqocxahzmq");
                            client.EnableSsl = true;
                            client.UseDefaultCredentials = true;
                            client.Credentials = basicCredential1;
                            try
                            {
                                client.Send(message);
                                sucEmail.Visible = true;
                            }

                            catch (Exception ex)
                            {
                                Panel1.Visible = true;
                            }
                        }

                    }
                    else
                    {
                        errEmail.Visible = true;
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