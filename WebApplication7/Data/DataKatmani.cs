using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Data
{
    public class DataKatmani
    {
        Models.PoliklinikEntities5 pContext = new Models.PoliklinikEntities5();
        List<Models.UrunKategori> UrunKat1 = new List<Models.UrunKategori>();
        List<Models.UrunAltKategori> UrunKat2=new List<Models.UrunAltKategori>();
        List<Models.Urunler> Urunler1 = new List<Models.Urunler>();
        public List<Data.Sepet> SepetIcerik = new List<Data.Sepet>();
        
        public List<Models.UrunKategori> UrunKatListe1(ref string error)
        {
            try
            {
                var res = from c in pContext.UrunKategori
                          select c;
                UrunKat1 = res.ToList();
            }
            catch (Exception ex)
            {
                error = ex.Message;
                throw;
            }
            return UrunKat1;
        }

        public List<Models.UrunAltKategori> UrunKatListe2 (int AnaKatID, ref string error)
        {
            try
            {
                var res = from c in pContext.UrunAltKategori
                          where c.AnaKategori==AnaKatID
                          select c;
                UrunKat2 = res.ToList();
            }
            catch (Exception ex)
            {
                error = ex.Message;
                throw;
            }
            return UrunKat2;
        }

        public List<Models.Urunler> UrunListe(int AltKategoriID, ref string error)
        {
            try
            {
                var res = from c in pContext.Urunler
                          where c.AltKategori==AltKategoriID
                          select c;
                Urunler1 = res.ToList();
            }
            catch (Exception ex)
            {
                error = ex.Message;
                throw;
            }
            return Urunler1;
        }

        public void SepeteEkle(Data.Sepet Sepetim, ref string error)
        {
            
            try
            {
                SepetIcerik.Add(Sepetim);
            }
            catch (Exception ex)
            {
                error=ex.Message;
                throw;
            }
           
        }

        public class BulunanMetin
        {
            public string UrunAdi;
            public Guid UrunID;
        }

        
    }
}