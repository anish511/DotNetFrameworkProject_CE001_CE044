using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Microsoft.Office.Interop.Word;

namespace WAD_Project1
{
    public partial class home : System.Web.UI.Page
    {
        bool bold;
        bool italic;
        bool color;

     
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Request.Cookies["styles"].Value != null)
            //{
            //    string style = Request.Cookies["styles"].Value;
            //    styles.Value = style;
            //}
            if(Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

        }

        
        protected void btnBold_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "font-weight:bold;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            if (bold == false)
            {
                bold = true;
                textbox1.Style.Add("font-weight", "bold");
            }
            else
            {
                bold = false;
                textbox1.Style.Add("font-weight", "normal");
            }
        }

     
        protected void btnItalic_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "font-style:italic;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            if (italic == false)
            {
                italic = true;
                textbox1.Style.Add("font-style", "italic");
            }
            else
            {
                italic = false;
                textbox1.Style.Add("font-style", "normal");
            }
        }

       
        protected void btnUpperCase_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-Transform:uppercase;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-Transform", "uppercase");
        }

        
        protected void btnLowerCase_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-Transform:lowercase;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-Transform", "lowercase");
        }

      
        protected void btnClearText_Click(object sender, EventArgs e)
        {
            textbox1.Text = "";
            textbox1.Style.Add("font-weight", "normal");
            textbox1.Style.Add("font-style", "normal");
            textbox1.Style.Add("text-transform", "capitalize");
            bold = false;
            italic = false;
        }


   
        protected void btnLeft_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-align:left;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-align", "left");
        }

       
        protected void btnRight_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-align:right;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-align", "right");
        }

        
        protected void btnCenter_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-align:center;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-align", "center");
        }

        /*
        protected void btnSave_Click(object sender, EventArgs e)
        { 
            string fileName = tbFileName.Text;
            var styles = "body{color:red;}";
            // fileName = fileName + ".rtf";
            // var dir = Server.MapPath("~\\files");
            // var file = Path.Combine(dir, fileName);

            // Directory.CreateDirectory(dir);
            // File.WriteAllText(file, textbox1.Text);

            // lbmsg.Text = "File Saved Successfully";

            string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
            myScript += "$(\"#textbox1\").wordExport("+fileName+","+styles+");"; //35 is dynamic value
            myScript += "\n\n </script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);
        }
        */

      
        protected void btnCapital_Click(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += "text-Transform:capitalize;";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("text-transform", "capitalize");
        }

       
    
        protected void colorChange(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += $"color:#{textboxColor.Text};";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("color", "#" + textboxColor.Text);
 
        }


        
        protected void readButton_Click(object sender, EventArgs e)
        {
            try
            {
                var t = new Thread((ThreadStart)(() =>
                {
                    OpenFileDialog fileDialog = new OpenFileDialog();
                    fileDialog.ShowDialog();
                    string filepath = fileDialog.FileName.ToString();
                    Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();
                    Document doc = app.Documents.Open(filepath);
                    if (doc == null)
                    {
                        textbox1.Text = "No file selected";
                    }
                    else
                    {
                        string data = doc.Content.Text;
                        textbox1.Text = data;
                    }

                }));
                t.SetApartmentState(ApartmentState.STA);
                t.Start();
                t.Join();
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += $"font-size:{DropDownList1.SelectedValue};";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("font-size", DropDownList1.SelectedValue);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string styles1 = string.Empty;
            //styles1 = Request.Cookies["styles"].Value;
            styles1 = styles.Value;
            styles1 += $"font-family:{DropDownList2.SelectedValue};";
            Request.Cookies["styles"].Value = styles1;
            styles.Value = styles1;
            textbox1.Style.Add("font-family", DropDownList2.SelectedValue);
        }
    }
}