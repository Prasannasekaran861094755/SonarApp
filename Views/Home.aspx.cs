using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonarApp.Views
{
    public partial class Home : System.Web.UI.Page
    {
readonly string test="1234";
        protected void Page_Load(object sender, EventArgs e)
        {
textlabel.Text=test;
        }
    }
}