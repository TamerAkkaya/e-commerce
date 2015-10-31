using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication7.Data
{
    class YeniKayit
    {
        string err = string.Empty;
        public void Kaydet(string Ad,string Soyad,string EPosta, string Telefon, DateTime DogumTarihi, string Ulke, string Il,string Ilce,string Sifre,bool Cinsiyet,bool TelefonListesinde,bool EmailListesinde, ref string err)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            Models.Kullanicilar YeniKullanici = new Models.Kullanicilar();
            try
            {
                if (p.Kullanicilar.Where(x => x.KullaniciAdi == EPosta).Count() < 1)
                {
                    //Kullanıcı bilgileri
                    YeniKullanici.Adi = Ad.Trim();
                    YeniKullanici.Soyadi = Soyad.Trim();
                    YeniKullanici.KullaniciAdi = EPosta.Trim();
                    YeniKullanici.Telefon = Telefon.Trim();
                    YeniKullanici.DogumTarihi = DogumTarihi;
                    YeniKullanici.Ulke = Ulke.Trim();
                    YeniKullanici.Il = Il.Trim();
                    YeniKullanici.Ilce = Ilce.Trim();
                    YeniKullanici.Sifre = Sifre.Trim();
                    YeniKullanici.Cinsiyet = Cinsiyet;
                    YeniKullanici.GüncellemeZamani = DateTime.Now;
                    YeniKullanici.TelefonListesinde = TelefonListesinde;
                    YeniKullanici.EmailListesinde = EmailListesinde;
                    //.............................

                    //Veritabanına kayıt işlemi
                    p.Kullanicilar.Add(YeniKullanici);
                    p.SaveChanges();
                    //.............................

                }
                else
                {
                    err = "Aynı isimle kayıtlı mevcut bir kullanıcı var!";
                }

                
            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }

        }

        public void AdresKaydet(string KullaniciAdi, string Adres, ref string err)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            var res = p.Kullanicilar.Where(x => x.KullaniciAdi == KullaniciAdi).ToList();
            foreach (var item in res)
            {
                item.Adres = Adres;
            }
            p.SaveChanges();

        }
    }
}
