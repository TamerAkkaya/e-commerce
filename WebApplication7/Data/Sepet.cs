using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Data
{
    public class Sepet
    {
        public string KullaniciAdi { get; set; }
        public string SessionID { get; set; }
        public Guid UrunID{get;set;}
        public string UrunAdi { get; set; }
        public int UrunSiparisAdet{get;set;}
        public decimal? UrunFiyat{get;set;}
        public decimal? ToplamFiyat { get; set; }
        public string UrunResmi{ get; set; }
        public DateTime GuncellemeTarihi { get; set; }
        
    }
}