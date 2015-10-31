using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Web.Services;

namespace WebApplication7
{
    public partial class _default : System.Web.UI.Page
    {
        Models.Kullanicilar kullanici = new Models.Kullanicilar();
        MainPage main = new MainPage();
        string err,err1,err2=string.Empty;

        /// <summary>
        /// Arama çubuğunundaki metni parametre olarak alıp veritabanındaki StoredProcedure çalıştırır.
        /// </summary>
        /// <param name="Metin"></param>
        /// <returns></returns>
        [WebMethod]
        public static List<Data.DataKatmani.BulunanMetin> MetinAra(string Metin)
        {

            using (Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5())
            {
                List<Data.DataKatmani.BulunanMetin> sonucList = new List<Data.DataKatmani.BulunanMetin>();
                var S = p.sp_MetinAra(Metin).ToList();
                ContentPlaceHolder ContentHolder;
                _default dd=new _default();
                ListBox list;
                ContentHolder = (ContentPlaceHolder) dd.Master.FindControl("ContentPlaceHolder1");
                list =  ContentHolder.FindControlRecursive("listboxSearch") as ListBox;
                foreach (var item in S)
                {
                    Data.DataKatmani.BulunanMetin sonuc = new Data.DataKatmani.BulunanMetin();
                    sonuc.UrunAdi = item.UrunAdi;
                    sonuc.UrunID = item.UrunID;
                    sonucList.Add(sonuc);
                    list.Items.Add(new ListItem(sonuc.UrunAdi, sonuc.UrunID.ToString()));
                }
                //l.DataBind();
                return sonucList; 
            }


        }




        /// <summary>
        /// <remarks>Ana ve alt kategorileri Linq ile alıp Menu ve MenuItem kullanır</remarks>
        /// </summary>
        public void LeftMenuHazirla()
        {
            try
            {
                Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
                var res = from c in p.UrunKategori
                          select new { Adi = c.Adi, ID = c.AnaKategoriID };

                foreach (var item in res.ToList())
                {
                    MenuItem Ana = new MenuItem();
                    Ana.Text = item.Adi;
                    Ana.NavigateUrl = @"MainPage.aspx?KatID=" + item.ID.ToString();
                    var res1 = from c in p.UrunKategori
                               join d in p.UrunAltKategori on c.AnaKategoriID equals d.AnaKategori
                               where c.AnaKategoriID == item.ID
                               select new { ID = c.AnaKategoriID, AltKatID = d.AltKategoriID, AltKatAdi = d.Adi };
                    foreach (var altkat in res1.ToList())
                    {
                        MenuItem Alt = new MenuItem();
                        Alt.Text = altkat.AltKatAdi;
                        Alt.NavigateUrl = @"UrunListesi.aspx?KatID=" + item.ID.ToString() + "&AltKatID=" + altkat.AltKatID.ToString();
                        Ana.ChildItems.Add(Alt);
                    }

                    Menu1.Items.Add(Ana);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LeftMenuHazirla();
            if (Session["s1"] != null)
            {
                
                var kul = (Models.Kullanicilar)Session["s1"];
                //lblInfo1.Text = "Hoşgeldiniz " + kul.Adi + " " + kul.Soyadi;
            }
            

            #region !IsPostBack
            if (!IsPostBack)
            {
                Models.PoliklinikEntities5 pContent = new Models.PoliklinikEntities5();
                var res = from c in pContent.Sepet where c.SessionID == Session.SessionID select c;
                //int SepetSayi = res.ToList().Count;
                //SepetimLabel.Text = "Sepetim(" + SepetSayi.ToString() + ")";
                Data.DataKatmani dk = new Data.DataKatmani();
                try
                {

                    
                    if (Request.QueryString["KatID"]== null)
                    {
                        DataList1.DataSource = dk.UrunListe(1, ref err1);
                        DataList1.DataBind();

                    }
                    else
                    {
                        DataList1.DataSource = dk.UrunListe(int.Parse(Request.QueryString["KatID"]), ref err1);
                        DataList1.DataBind();

                    }
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                    throw;
                }

            }
            #endregion
        }
    }
}