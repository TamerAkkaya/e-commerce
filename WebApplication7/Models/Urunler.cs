//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication7.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Urunler
    {
        public System.Guid UrunID { get; set; }
        public string UrunAdi { get; set; }
        public Nullable<long> AltKategori { get; set; }
        public Nullable<int> Adet { get; set; }
        public Nullable<decimal> Fiyat { get; set; }
        public Nullable<decimal> IndirimliFiyat { get; set; }
        public Nullable<byte> IskontoOrani { get; set; }
        public string Resim1 { get; set; }
        public string Resim2 { get; set; }
        public string Resim3 { get; set; }
        public string Resim4 { get; set; }
        public Nullable<System.DateTime> GüncellemeTarihi { get; set; }
    
        public virtual UrunAltKategori UrunAltKategori { get; set; }
    }
}
