using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class MainPage : System.Web.UI.Page
    {
        string err = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Data.DataKatmani dk=new Data.DataKatmani();
                try
                {
                    Repeater1.DataSource = dk.UrunKatListe1(ref err);
                    Repeater1.DataBind();
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                    throw;
                }

            }
        }

    }

}