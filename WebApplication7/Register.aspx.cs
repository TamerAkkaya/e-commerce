using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class register : System.Web.UI.Page
    {
        string err = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forward_Init(object sender, EventArgs e)
        {

        }

        protected void Sehir_Init(object sender, EventArgs e)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            if (Sehir.Items.Count < 1)
            {
                try
                {
                var res = p.il_ilce.GroupBy(x => x.il).Select(grp => grp.FirstOrDefault());
                foreach (var item in res.ToList())
                {
                    ListItem l = new ListItem();
                    l.Text = item.il;
                    l.Value = item.plaka.ToString();
                    Sehir.Items.Add(l);
                }
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                    throw;
                }

            }
        }

        protected void Ilce_Init(object sender, EventArgs e)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
            try
            {
                Ilce.Items.Clear();
                var res = p.il_ilce.Where(x => x.plaka==1);
                foreach (var item in res.ToList())
                {
                    ListItem l = new ListItem();
                    l.Text = item.ilce;
                    l.Value = item.plaka.ToString();
                    Ilce.Items.Add(l);
                }
                Ilce.DataBind();
            }
            catch (Exception ex)
            {
                err = ex.Message;
                throw;
            }
        }

        protected void Sehir_SelectedIndexChanged(object sender, EventArgs e)
        {
            Models.PoliklinikEntities5 p = new Models.PoliklinikEntities5();
                try
                {
                    Ilce.Items.Clear();
                    var res = p.il_ilce.Where(x => x.il == Sehir.SelectedItem.Text);
                    foreach (var item in res.ToList())
                    {
                        ListItem l = new ListItem();
                        l.Text = item.ilce;
                        l.Value = item.plaka.ToString();
                        Ilce.Items.Add(l);
                    }
                    Ilce.DataBind();
                }
                catch (Exception ex)
                {
                    err = ex.Message;
                    throw;
                }

            }

        protected void Sozlesme_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox c=sender as CheckBox;
            Submit.Visible = c.Checked == true ? true : false;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            ValidationSummary1.ShowMessageBox = true;
            if(IsValid)
            {
                try 
	                {	
                    Data.YeniKayit y = new Data.YeniKayit();
                    string Ad=ad.Text;
                    string Soyad=soyad.Text;
                    string EPosta=email1.Text;
                    string Telefon=GSM.Text;
                    DateTime DogumTarihi=DateTime.Parse(DTar.Text);
                    string ulke="Türkiye";
                    string il=Sehir.SelectedItem.Text;
                    string ilce=Ilce.SelectedItem!=null?Ilce.SelectedItem.Text:"ALADAĞ";
                    string sifre=pass1.Text;
                    bool cinsiyet=Cinsiyet.Text=="Erkek"?true:false;
                    bool telefonListesinde=DuyuruCep.Checked;
                    bool emailListesinde = DuyuruEmail.Checked;
                    string err=string.Empty;
                    y.Kaydet(Ad, Soyad, EPosta, Telefon, DogumTarihi, ulke, il, ilce, sifre, cinsiyet, telefonListesinde, emailListesinde, ref err);
                    OnayBilgi.Text = err;
                    OnayBilgi.Visible = err == "" ? false : true;
	                }
	                catch (Exception ex)
	                {
		                err=ex.Message;
		                throw;
	                }


            }
            
        }   
        
    }
}