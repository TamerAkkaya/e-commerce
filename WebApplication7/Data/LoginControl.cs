using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Data
{
    public class LoginControl
    {
        Models.PoliklinikEntities5 pContent = new Models.PoliklinikEntities5();
        public bool LoginValidate(string Kullanici,string Sifre,ref Models.Kullanicilar LoggedIn, ref string error)
        {
            bool OK = false;
            try
            {
                var res = from c in pContent.Kullanicilar
                          where ((Kullanici == c.KullaniciAdi) && (Sifre == c.Sifre))
                          select c;
                foreach (var item in res)
                {
                    LoggedIn.ID = item.ID;
                    LoggedIn.KullaniciAdi = item.KullaniciAdi;
                    LoggedIn.Adi = item.Adi;
                    LoggedIn.Soyadi = item.Soyadi;
                    OK = true;
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                OK = false;
            }
            return OK;
        }
    }
}