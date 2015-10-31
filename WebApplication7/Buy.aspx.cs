using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class Buy : System.Web.UI.Page
    {
        string err = string.Empty; 
        Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
        decimal? ToplamFiyat = 0;
        decimal? KargoUcreti = 0;
        int TaksitSayisi=0;
        TextBox txtAdres = new TextBox();
        string _txtAdres = string.Empty;
        bool Kaydetti = false;
        Button btnAdresGuncelle = new Button();
        RadioButtonList rKargo = new RadioButtonList();
        RadioButtonList rOdeme = new RadioButtonList();
        TextBox txtKrediKartNo = new TextBox();
        string KrediKartNo= string.Empty;
        TextBox CardOwnertmp = new TextBox();
        string CardOwnerName = string.Empty;
        DropDownList dlistAYtmp = new DropDownList();
        string Ay = "01";//Varsayılan AY
        DropDownList dlistYILtmp = new DropDownList();
        string Yil=(DateTime.Now.Year+1).ToString();//Varsayılan YIL
        TextBox txtCVC2 = new TextBox();
        string CVC2Value = string.Empty;
        Label lblKontrolKargo = null;
        Label lblKontrolGenelToplam = null;
        decimal? GenelToplam = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session.Count<1)
                {
                    Response.Redirect("/default.aspx");
                }
                if (!IsPostBack)
                {
                    tabBuy.ActiveTabIndex = 0;
                }
                int ActiveTab = tabBuy.ActiveTabIndex;
                if (ActiveTab==0)
                {
                    int TabCount = tabBuy.Tabs.Count;
                    for (int i = 0; i < TabCount; i++)
                    {
                        tabBuy.Tabs[i].Enabled = false;
                    }
                    tabBuy.Tabs[0].Enabled = true;
                }
                    var kul=Session["s1"] as Models.Kullanicilar;
                //Urunler Tab
                if (!IsPostBack)
                {
                    if (dlistUrunlerTab.DataSource == null)
                    {
                        var resSepet = p.Sepet.Where(x => x.KullaniciAdi == kul.KullaniciAdi);
                        dlistUrunlerTab.DataSource = resSepet.ToList();
                        dlistUrunlerTab.DataBind();
                    }
                }
               
                //Kargo Tab

                if(!IsPostBack)
                {                
                    if (radiolistKargo.Items.Count<1)
                    {
                        var KargoList = p.Kargolar.Select(x=>new {Adi=x.KargoAdi,Ucret=x.KargoUcreti});
                        foreach (var item in KargoList.ToList())
                        {
                            var radiolistitem = new ListItem();
                            radiolistitem.Text = item.Adi + "  " + item.Ucret + "TL";
                            radiolistKargo.Items.Add(radiolistitem);
                        }
                        radiolistKargo.Items[0].Selected = true;
                    }
                }
                KontrolKargo.Text = (p.Kargolar.Select(x => new { Adi = x.KargoAdi }).ToList())[radiolistKargo.SelectedIndex].Adi;
                KargoUcreti=p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList()[rKargo.SelectedIndex].Ucret;
                GenelToplam = ToplamFiyat + KargoUcreti;
                //lblKontrolKargo = Page.FindControlRecursive("lblKontrol1") as Label;
                if(lblKontrolKargo!=null)
                {
                    lblKontrolKargo.Text = KargoUcreti + "TL";
                }
                //lblKontrolGenelToplam = Page.FindControlRecursive("lblKontrol2") as Label;
                if (lblKontrolGenelToplam!=null)
                {
                    lblKontrolGenelToplam.Text=String.Format("{0:0.00}TL",GenelToplam);
                }
                
                //Adres Tab
                var res = p.Kullanicilar.Where(x => x.KullaniciAdi == kul.KullaniciAdi).ToList();
                _txtAdres = txtAdres.Text;
                dlistAdres.DataSource = res;
                dlistAdres.DataBind();
                if(res[0].Adres.Length>6)
                {
                    txtAdres.Text = res[0].Adres;
                    txtAdres.Enabled = false;
                }
                //Taksit Tab
                if(!IsPostBack)
                {
                    var resTaksit = p.Taksitlendirme.Select(x => new { Taksit = x.TaksitSayisi, TaksitliFiyat = x.SonFiyatOrani });
                    if (radiolistTaksit.Items.Count < 1)
                    {
                        foreach (var item in resTaksit.ToList())
                        {
                            if (item.Taksit == "Peşin")
                            {
                                radiolistTaksit.Items.Add(item.Taksit + String.Format(" ({0:0.00}TL)", item.TaksitliFiyat.Value * ToplamFiyat));
                            }
                            else
                            {
                                radiolistTaksit.Items.Add(item.Taksit + " ay" + String.Format(" ({0:0.00}TL)", item.TaksitliFiyat.Value * ToplamFiyat));
                            }

                        }
                    }
                    radiolistTaksit.SelectedIndex = 0;
                }
                //Kontrol Tab
                if (DataList2.DataSource == null)
                {
                    var resSepet = p.Sepet.Where(x => x.KullaniciAdi == kul.KullaniciAdi);
                    DataList2.DataSource = resSepet.ToList();
                    DataList2.DataBind();
                }

            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }
        }

        protected void toplam_Init(object sender, EventArgs e)
        {
            ToplamFiyat = 0;
            try
            {
                if (dlistUrunlerTab.DataSource == null)
                {
                    var kul = Session["s1"] as Models.Kullanicilar;
                    var resSepet = p.Sepet.Where(x => x.KullaniciAdi == kul.KullaniciAdi);
                    dlistUrunlerTab.DataSource = resSepet.ToList();
                    dlistUrunlerTab.DataBind();
                }
                else
                {
                    var res = (List<Models.Sepet>)dlistUrunlerTab.DataSource;
                    foreach (var item in res)
                    {
                        ToplamFiyat += item.ToplamFiyat;
                    }
                    Label l = sender as Label;
                    l.Text = ToplamFiyat.ToString() + "  TL";
                    }
            }
            catch (Exception ex)
            {
                err = ex.Message;

            }
        }

        protected void btnIleri()
        {
            tabBuy.ActiveTabIndex++;
            int ActiveTab = tabBuy.ActiveTabIndex;
            int TabCount = tabBuy.Tabs.Count;
            for (int i = 0; i < TabCount; i++)
            {
                tabBuy.Tabs[i].Enabled = false;
            }
            tabBuy.Tabs[ActiveTab].Enabled = true;
        }

        protected void btnGeri()
        {
            tabBuy.ActiveTabIndex--;
            int ActiveTab = tabBuy.ActiveTabIndex;
            int TabCount = tabBuy.Tabs.Count;
            for (int i = 0; i < TabCount; i++)
            {
                tabBuy.Tabs[i].Enabled = false;
            }
            tabBuy.Tabs[ActiveTab].Enabled = true;
        }

        protected void btnUrunlerIleri_Click(object sender, EventArgs e)
        {
            btnIleri();
        }


        protected void btnKargoIleri_Click(object sender, EventArgs e)
        {
            btnIleri();
        }

        protected void btnKargoGeri_Click(object sender, EventArgs e)
        {
            btnGeri();
        }

        protected void btnAdresGeri_Click(object sender, EventArgs e)
        {
            btnGeri();
        }

        protected void btnAdresIleri_Click(object sender, EventArgs e)
        {
            if (Kaydetti==true||txtAdres.Enabled==false)
            {
                btnIleri();
            }
            else
            {
                btnAdresGuncelle.Visible = true;
                btnAdresGuncelle.Enabled = true;
                this.btnAdresIleri.Enabled = false;
            }
           
        }

        protected void btnOdemeGeri_Click(object sender, EventArgs e)
        {
            btnGeri();
        }

        protected void btnOdemeIleri_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (CreditCardNumber.Text.Length == 16 && CVC2.Text.Length == 3 && IsValid &&CardOwner.Text.Length>4 && Data.CreditCardValidation.ValidateCardNumber(CreditCardNumber.Text))
            {
                Ay = dlistAYtmp.SelectedValue;
                Yil = dlistYILtmp.SelectedValue;
                
                btnIleri();
            }
            else if (!Data.CreditCardValidation.ValidateCardNumber(CreditCardNumber.Text))
            {
                RegularExpressionValidator1.IsValid = false;
                //RegularExpressionValidator1.ErrorMessage = "Test Başarısız";
                RegularExpressionValidator1.Text = "Test Başarısız";
            }
            else
            {
                RequiredFieldValidator1.Validate();
                RequiredFieldValidator2.Validate();
                RequiredFieldValidator3.Validate();
            }
        }

        protected void btnKontrolGeri_Click(object sender, EventArgs e)
        {
            btnGeri();
        }

        protected void btnAdresGuncelle_Click(object sender, EventArgs e)
        {
            var kul = Session["s1"] as Models.Kullanicilar;
            if(_txtAdres.Length<6)
            {
                txtAdres.Focus();
                return;
            }
            else
            {
                Data.YeniKayit y = new Data.YeniKayit();
                y.AdresKaydet(kul.KullaniciAdi, _txtAdres, ref err);
                txtAdres.Text = _txtAdres;
                txtAdres.Enabled = false;
                btnAdresGuncelle.Visible = false;
                btnAdresIleri.Enabled = true;
                Kaydetti = true;
            };
        }

        protected void btnAdresGuncelle_Init(object sender, EventArgs e)
        {
            var kul = Session["s1"] as Models.Kullanicilar;
            var res = p.Kullanicilar.Where(x => x.KullaniciAdi == kul.KullaniciAdi).ToList();
            btnAdresGuncelle=sender as Button;
            try
            {
                if (res[0].Adres == null || res[0].Adres.Length < 6)
                {
                    btnAdresGuncelle.Visible = true;
                    btnAdresGuncelle.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }

        }

        protected void txtAdres_Init(object sender, EventArgs e)
        {
            txtAdres=sender as TextBox;
            

        }

        protected void radiolistKargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            rKargo = (RadioButtonList)sender;
            List<decimal?> lKargo = new List<decimal?>();
            var KargoList = p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList();
            if (lKargo.Count < 1)
            {
                foreach (var item in KargoList)
                {
                    lKargo.Add(item.Ucret);
                }
            }
            KargoUcreti = rKargo.SelectedIndex < 0 ? p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList()[0].Ucret : p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList()[rKargo.SelectedIndex].Ucret;
        }

        protected void radiolistKargo_Init(object sender, EventArgs e)
        {
            rKargo = (RadioButtonList)sender;
            KargoUcreti = rKargo.SelectedIndex < 0 ? p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList()[0].Ucret : p.Kargolar.Select(x => new { Adi = x.KargoAdi, Ucret = x.KargoUcreti }).ToList()[rKargo.SelectedIndex].Ucret;
        }

        protected void radiolistTaksit_SelectedIndexChanged(object sender, EventArgs e)
        {
            rOdeme = (RadioButtonList)sender;
            List<int> lTaksitler = new List<int>();
            var TaksitList = p.Taksitlendirme.Select(x => new { Taksit = x.TaksitSayisi, FiyatOran = x.SonFiyatOrani }).ToList();
            if (lTaksitler.Count<1)
            {
                foreach (var item in TaksitList)
                {
                    if(item.Taksit=="Peşin")
                    {
                        lTaksitler.Add(0);
                    }
                    else
                    {
                        lTaksitler.Add(int.Parse(item.Taksit));
                    }
                }
                TaksitSayisi = rOdeme.SelectedIndex < 0 ? 0 : lTaksitler[rOdeme.SelectedIndex];

            }
        
        }

        protected void CreditCardNumber_TextChanged(object sender, EventArgs e)
        {
            txtKrediKartNo = sender as TextBox;
            KrediKartNo = txtKrediKartNo.Text;
            
        }



        protected void CVC2_TextChanged(object sender, EventArgs e)
        {
            txtCVC2 = sender as TextBox;
            CVC2Value = txtCVC2.Text;
        }

        protected void dlistAy_Init(object sender, EventArgs e)
        {
            dlistAYtmp = sender as DropDownList;
        }

        protected void dlistYil_Init(object sender, EventArgs e)
        {
            dlistYILtmp = sender as DropDownList;
        }

        protected void lblKontrol1_Init(object sender, EventArgs e)
        {
            if(lblKontrolKargo==null)
            {
                lblKontrolKargo = sender as Label;
            }
           
        }

        protected void btnTamamla_Click(object sender, EventArgs e)
        {
            //Tamamla
            try
            {
                Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
                Models.Siparisler s_temp=new Models.Siparisler();
                var kul=Session["s1"] as Models.Kullanicilar;
                var resSepet = p.Sepet.Where(x => x.KullaniciAdi == kul.KullaniciAdi).ToList();
                int i=0;
                s_temp.SiparisNo = Guid.NewGuid();
                s_temp.Kargo_Adi = KontrolKargo.Text;
                s_temp.KartNo = KrediKartNo;
                s_temp.KullaniciAdi = kul.KullaniciAdi;
                s_temp.SiparisTarihi = DateTime.Now;
                s_temp.Taksit_Adet = TaksitSayisi==0?"Peşin":TaksitSayisi.ToString();
                s_temp.ToplamFiyat = GenelToplam;
                s_temp.UrunID1 = (Guid)resSepet[0].UrunID;
                s_temp.UrunID1_Adet = (byte)resSepet[0].UrunSiparisAdet;
                s_temp.UrunID1_Adi = resSepet[0].UrunAdi;
                s_temp.UrunID1_Fiyat = resSepet[0].UrunFiyat;
                #region for
                for(i=2;i<=resSepet.Count;i++)
                {
                    switch (i)
                    {
                        case 2:
                            s_temp.UrunID2 = (Guid)resSepet[i-1].UrunID;
                            s_temp.UrunID2_Adet = (byte)resSepet[i-1].UrunSiparisAdet;
                            s_temp.UrunID2_Adi = resSepet[i-1].UrunAdi;
                            s_temp.UrunID2_Fiyat = resSepet[i-1].UrunFiyat;
                            break;
                        case 3:
                            s_temp.UrunID3 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID3_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID3_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID3_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 4:
                            s_temp.UrunID4 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID4_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID4_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID4_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 5:
                            s_temp.UrunID5 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID5_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID5_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID5_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 6:
                            s_temp.UrunID6 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID6_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID6_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID6_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 7:
                            s_temp.UrunID7 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID7_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID7_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID7_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 8:
                            s_temp.UrunID8 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID8_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID8_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID8_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 9:
                            s_temp.UrunID9 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID9_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID9_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID9_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        case 10:
                            s_temp.UrunID10 = (Guid)resSepet[i - 1].UrunID;
                            s_temp.UrunID10_Adet = (byte)resSepet[i - 1].UrunSiparisAdet;
                            s_temp.UrunID10_Adi = resSepet[i - 1].UrunAdi;
                            s_temp.UrunID10_Fiyat = resSepet[i - 1].UrunFiyat;
                            break;
                        default:
                            break;
                    }
                }
                #endregion
                p.Siparisler.Add(s_temp);
                p.SaveChanges();
                string script = "alert(\"Siparişiniz başarıyla kaydedildi.\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            catch (Exception ex)
            {
                err=ex.Message;
                string script = "alert(\""+err+" hatası oluştu.\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                Response.Redirect("/default.aspx");
            }
            finally
            {
                txtAdres.Dispose();
                btnAdresGuncelle.Dispose();
                rKargo.Dispose();
                rOdeme.Dispose();
                txtKrediKartNo.Dispose();
                CardOwnertmp.Dispose();
                dlistAYtmp.Dispose();
                dlistYILtmp.Dispose();
                txtCVC2.Dispose();
                lblKontrolKargo.Dispose();
                lblKontrolGenelToplam.Dispose();
                p.Dispose();
                Response.Redirect("/default.aspx");
            }
        }

        protected void lblKontrol2_Init(object sender, EventArgs e)
        {
            if(lblKontrolGenelToplam==null)
            {
                lblKontrolGenelToplam = sender as Label;
            }
            
        }




    }
}