using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public class SepetSayisi
    {
        public int sayi { get; set; }
    }

    public partial class Site1 : System.Web.UI.MasterPage
    {
        Models.Kullanicilar kullanici = new Models.Kullanicilar();
        Data.DataKatmani dk = new Data.DataKatmani();
        string err = string.Empty;
        ListBox l = new ListBox();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Data.DataKatmani dk = new Data.DataKatmani();
            Models.PoliklinikEntities5 pContent = new Models.PoliklinikEntities5();
            
            try
            {
                var kul = (Models.Kullanicilar)Session["s1"];
                var res = kul == null ? (from c in pContent.Sepet where c.KullaniciAdi==null select c) : (from c in pContent.Sepet where c.KullaniciAdi == kul.KullaniciAdi select c);
                int SepetSayi = res.ToList().Count;
                SepetimLabel.Text = "Sepetim(" + SepetSayi.ToString() + ")";
                if (!IsPostBack)
                {

                    DataList1.DataSource = dk.UrunKatListe1(ref err);
                    DataList1.DataBind();
                    if (Menu2.Items.Count < 1)
                    {
                        MenuItem ana = new MenuItem() { Text = "Hesabım", NavigateUrl = "" };
                        List<MenuItem> alt = new List<MenuItem>() {
                        new MenuItem{ Text = "Siparişlerim", NavigateUrl = "" },
                        new MenuItem{ Text = "Mesajlarım", NavigateUrl = "" },
                        new MenuItem{ Text = "Puanlarım", NavigateUrl = "" },
                        new MenuItem{ Text = "Hızlı Öde", NavigateUrl = "" },
                        new MenuItem{ Text = "Üyelik Bilgilerim", NavigateUrl = "" },
                        new MenuItem{ Text = "Adreslerim", NavigateUrl = "" }
                        };
                        Menu2.Items.Add(ana);
                        for (int i = 0; i < alt.Count; i++)
                        {
                            Menu2.Items[0].ChildItems.Add(alt[i]);
                        };
                    }
                }

            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            Data.LoginControl login = new Data.LoginControl();
            #region try-catch
            try
            {
                if (login.LoginValidate(login_name.Text.Trim(), login_password.Text.Trim(), ref kullanici, ref err))
                {
                    Session.Add("s1", kullanici);
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }
            #endregion
        }

        protected void lblInfo_Init(object sender, EventArgs e)
        {
            var kul = (Models.Kullanicilar)Session["s1"];
            Label _lblInfo = sender as Label;
            _lblInfo.Text =kul==null?"Lüften giriş yapınız...": "Hoşgeldiniz " + kul.Adi + " " + kul.Soyadi;
        }


        protected void lnkRegister_Init(object sender, EventArgs e)
        {
            HyperLink h = sender as HyperLink;
            h.Visible = Session["s1"] == null;
          
        }

        protected void lnkLogin_Init(object sender, EventArgs e)
        {
            HyperLink h = sender as HyperLink;
            h.Visible = Session["s1"] == null;
            if (Request.RawUrl.Contains("Register.aspx")) { h.Visible = false; };
        }

        protected void lnkCikis_Click(object sender, EventArgs e)
        {
            Session.Remove("s1");
            Response.Redirect(Request.RawUrl);
        }

        protected void lnkCikis_Init(object sender, EventArgs e)
        {
            LinkButton l = sender as LinkButton;
            l.Visible = Session["s1"] != null;
        }

        protected void listboxSearch_Init(object sender, EventArgs e)
        {
            l = sender as ListBox;
        }

    }
}