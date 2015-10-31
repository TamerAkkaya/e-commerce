using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.PoliklinikEntities4 p=new Models.PoliklinikEntities4();

            var res = from c in p.UrunKategori select new {Adi = c.Adi };
            Menu m = new Menu();
            foreach (var item in res.ToList())
	{
		 MenuItem l=new MenuItem();
                l.Value=item.Adi;
                m.Items.Add(l);
                Menu1.Items.Add(l);
	}


        }
    }
}