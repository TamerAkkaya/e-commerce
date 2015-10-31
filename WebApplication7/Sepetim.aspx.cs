using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Entity.Validation;

namespace WebApplication7
{
    public partial class Sepetim : System.Web.UI.Page
    {
        protected List <string> ControlID=new List<string>();
        decimal? ToplamFiyat = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
          
            /*Kullanıcı girişsiz Sepet Listelenir */
            if (Request.QueryString["SepetItemID"]==null)
            goto End;

            /*SepeteEkle çalışır */
            Models.PoliklinikEntities5 pContext = new Models.PoliklinikEntities5();
            Data.DataKatmani dk = new Data.DataKatmani();
            string err=string.Empty;
            List<Data.Sepet> _sepet = new List<Data.Sepet>();
            Data.Sepet _sepetTemp = new Data.Sepet();
            Models.Sepet _s = new Models.Sepet();
            Guid SepetGuid = Guid.Parse(Request.QueryString["SepetItemID"].ToString());
            Models.Kullanicilar kul=new Models.Kullanicilar();
            #region !IsPostBack
            if (!IsPostBack)
            {
                try
                {
                    
                    var res = (from c in pContext.Urunler
                               where c.UrunID==SepetGuid
                               select new { SessionID=Session.SessionID, UrunID=c.UrunID, UrunAdi = c.UrunAdi, UrunSiparisAdet = 1, UrunFiyat = c.IndirimliFiyat, ToplamFiyat=c.IndirimliFiyat*1, UrunResmi = c.Resim1, GuncellemeTarihi=DateTime.Now });

                    foreach (var item in res)
                    {
                        if (Session["s1"] != null)
                        { 
                            kul = (Models.Kullanicilar)Session["s1"];
                            _sepetTemp.KullaniciAdi=kul.KullaniciAdi;
                        }
                        _sepetTemp.SessionID = item.SessionID;
                        _sepetTemp.UrunID = item.UrunID;
                        _sepetTemp.UrunAdi = item.UrunAdi;
                        _sepetTemp.UrunSiparisAdet = item.UrunSiparisAdet;
                        _sepetTemp.UrunFiyat = item.UrunFiyat;
                        _sepetTemp.ToplamFiyat = item.ToplamFiyat;
                        _sepetTemp.UrunResmi = item.UrunResmi;
                        _sepetTemp.GuncellemeTarihi = item.GuncellemeTarihi;
                    }
                    dk.SepeteEkle(_sepetTemp,ref err);
                    _sepet = dk.SepetIcerik;
                    using (Models.PoliklinikEntities5 p=new Models.PoliklinikEntities5())
                    {
                        try 
	                    {
                            var varmi1 = from c in p.Sepet
                                  where c.KullaniciAdi == null && c.UrunID == SepetGuid
                                  select c;
                            var varmi2 = from c in p.Sepet
                                         where c.KullaniciAdi!=null && c.KullaniciAdi==_sepetTemp.KullaniciAdi && c.UrunID == SepetGuid
                                         select c;
                            if (Session["s1"] == null && varmi1.Count()<1)
                            { 
                            _s.KullaniciAdi = _sepetTemp.KullaniciAdi;
                            _s.SessionID = _sepetTemp.SessionID;
                            _s.UrunID = _sepetTemp.UrunID;
                            _s.UrunAdi = _sepetTemp.UrunAdi;
                            _s.UrunSiparisAdet = _sepetTemp.UrunSiparisAdet;
                            _s.UrunFiyat = _sepetTemp.UrunFiyat;
                            //ToplamFiyat otomatik hesaplaniyor
                            _s.UrunResmi = _sepetTemp.UrunResmi;
                            _s.GuncellemeTarihi = DateTime.Now;
		                    p.Sepet.Add(_s);
                            p.SaveChanges();
                            SepetList.DataSource = p.Sepet.Where(x => x.KullaniciAdi == null).ToList();
                            SepetList.DataBind();
                            }
                            else if (Session["s1"] != null && varmi2.Count() < 1)
                            {
                                _s.KullaniciAdi = _sepetTemp.KullaniciAdi;
                                _s.SessionID = _sepetTemp.SessionID;
                                _s.UrunID = _sepetTemp.UrunID;
                                _s.UrunAdi = _sepetTemp.UrunAdi;
                                _s.UrunSiparisAdet = _sepetTemp.UrunSiparisAdet;
                                _s.UrunFiyat = _sepetTemp.UrunFiyat;
                                //ToplamFiyat otomatik hesaplaniyor
                                _s.UrunResmi = _sepetTemp.UrunResmi;
                                _s.GuncellemeTarihi = DateTime.Now;
                                p.Sepet.Add(_s);
                                p.SaveChanges();
                                SepetList.DataSource = p.Sepet.Where(x=>x.KullaniciAdi== kul.KullaniciAdi).ToList();
                                SepetList.DataBind();
                            }
                            if (Session["s1"] == null && varmi1.Count() >0)
                            {
                                SepetList.DataSource = p.Sepet.Where(x => x.KullaniciAdi == null).ToList();
                                SepetList.DataBind();
                            }
                            else if (Session["s1"] != null && varmi2.Count() >0)
                            {
                                SepetList.DataSource = p.Sepet.Where(x => x.KullaniciAdi == kul.KullaniciAdi).ToList();
                                SepetList.DataBind();
                            }
                            
	                    }
                        catch (DbEntityValidationException ex)
                        {
                            foreach (var eve in ex.EntityValidationErrors)
                            {
                                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                                foreach (var ve in eve.ValidationErrors)
                                {
                                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                        ve.PropertyName, ve.ErrorMessage);
                                }
                            }
                            throw;
                        }

                    }

                }
                catch (Exception)
                {
                    
                    throw;
                }

            }
            #endregion
        goto End1;

        End:
            /*Kullanıcı girişsiz Sepet Listelenir */
            using (Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5())
            {
                var k = (Models.Kullanicilar)Session["s1"];
                SepetList.DataSource = Session["s1"] == null ? p.Sepet.Where(x => x.KullaniciAdi == null).ToList() : p.Sepet.Where(x => x.KullaniciAdi == k.KullaniciAdi).ToList();
                SepetList.DataBind();
            }
        End1:;
        }

        protected void LinkButton_Update_Click(object sender, EventArgs e)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            LinkButton btn = sender as LinkButton;
            var kul = (Models.Kullanicilar)Session["s1"];
            string err = string.Empty;
            if (ControlID.Count > 0) 
            {
                try
                {
                   
                    for (int i=0;i<ControlID.Count;i++){
                        if (int.Parse(Request.Form[ControlID[i]])>0&&int.Parse(Request.Form[ControlID[i]])<100)
                        {
                            Models.Sepet s = new Models.Sepet();
                            s.UrunSiparisAdet = int.Parse(Request.Form[ControlID[i]]);
                            var res = kul == null ? p.Sepet.First(x => x.UrunID.ToString() == btn.CommandArgument && x.KullaniciAdi == null) : p.Sepet.First(x => x.UrunID.ToString() == btn.CommandArgument && x.KullaniciAdi == kul.KullaniciAdi);
                            res.UrunSiparisAdet = s.UrunSiparisAdet;
                            int last=btn.UniqueID.LastIndexOf("ctl0");
                            string find = btn.UniqueID.Substring(last, 5);
                            if (ControlID[i].Contains(find))
                            p.SaveChanges(); }
                    }
                }
                catch (OverflowException ex)
                {
                    err = ex.Message;
                    
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                    throw;
                }
                finally
                {
                    Models.PoliklinikEntities5 _p = new Models.PoliklinikEntities5();
                    if (Session["s1"]!=null)
                    {
                        var k = (Models.Kullanicilar)Session["s1"];
                        SepetList.DataSource = _p.Sepet.Where(x=>x.KullaniciAdi==k.KullaniciAdi).ToList();
                    }
                    else
                    SepetList.DataSource = _p.Sepet.Where(x=>x.KullaniciAdi==null).ToList();
                    SepetList.DataBind();  
                }
            }

          

        }

        protected void SiparisAdet_TextChanged(object sender, EventArgs e)
        {
            TextBox txtbox = sender as TextBox;
            ControlID.Add(txtbox.UniqueID);
            
        }

        protected void LinkButton_Delete_Click(object sender, EventArgs e)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            LinkButton btn = sender as LinkButton;
            string err = string.Empty;
            try
            {
                var res = p.Sepet.First(x => x.UrunID.ToString() == btn.CommandArgument);
                p.Sepet.Remove((Models.Sepet)res);
                p.SaveChanges();
            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }
            finally 
            {
                Models.PoliklinikEntities5 _p = new Models.PoliklinikEntities5();
                if (Session["s1"] != null)
                {
                    var k = (Models.Kullanicilar)Session["s1"];
                    SepetList.DataSource = _p.Sepet.Where(x => x.KullaniciAdi == k.KullaniciAdi).ToList();
                }
                else
                    SepetList.DataSource = _p.Sepet.Where(x => x.KullaniciAdi == null).ToList();
                
                SepetList.DataBind();
                Response.Redirect("/Sepetim.aspx");
            } 
                  
        }

        protected void SepetList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
        }

        protected void toplam_Init(object sender, EventArgs e)
        {
            ToplamFiyat = 0;
            string err=string.Empty;
            try
            {
                var res=(List<Models.Sepet>)SepetList.DataSource;
                foreach (var item in res)
	            {
	    	        ToplamFiyat+=item.ToplamFiyat;
	            }
                Label l = sender as Label;
                l.Text = ToplamFiyat.ToString()+"  TL";
                
            }
            catch (Exception ex)
            {
                err = ex.Message; 

            }

        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            var kul = (Models.Kullanicilar)Session["s1"];
            if (kul != null)
            {
                Response.Redirect("/Buy.aspx");
            }
            else
            {
                string script = "alert(\"Önce üye girişi yapmalısınız.\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            };
            
        }

        protected void btnBuy_Init(object sender, EventArgs e)
        {
            Button b = sender as Button;
            b.Visible = ToplamFiyat > 0 ? true : false;
        }


    }
}