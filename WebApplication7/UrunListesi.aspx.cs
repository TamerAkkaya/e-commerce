using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class UrunListesi : System.Web.UI.Page
    {
        string err = string.Empty;
        string err1 = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Data.DataKatmani dk = new Data.DataKatmani();
                try
                {

                    DataList3.DataSource = dk.UrunListe(int.Parse(Request.QueryString["AltKatID"]),ref err1);
                    DataList3.DataBind();
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                   throw;
                }

            }
        }

        protected void SepeteEkle_Click(object sender, EventArgs e)
        {

        }
    }
}