<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication7.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <style>
         @keyframes SozlesmeAc{
             0%{width:0%;height:0px;}
             100%{width:80%;height:600px;}
         }
         @keyframes SozlesmeKapat{
             0%{width:80%;height:600px;}
             100%{width:0%;height:0px;display:none;}
         }
       .login-box{width:500px;height:300px;display:block}
        .login-box-row{width:500px;height:40px;display:block;position:absolute}
        .login-box-row-left{width:150px;height:40px;padding-top:8px; position:relative;font:bold 14px arial;  float:left;display:inline}
        .login-box-row-right{ width: 350px;height: 40px;position: relative;float:left; display: inline}
        .login-box-row-right-box{width:275px;height:32px;border-radius:10px;background-color:#efefef}
        .float-left{float:left;position:relative}
        .float-right {float:right;position:relative}
        input:focus:invalid {border-color:red;background-color:#ff5e7e}
        input:focus:valid {border-color: green;background-color:#89ff89}
        input{z-index:900}
        .sozlesme-ac{display:inline; animation-name:SozlesmeAc;animation-duration:0.6s;}
        .sozlesme-kapat{animation-name:SozlesmeKapat;animation-duration:0.6s;}
    </style>
     <script>
            function display_item(x) { document.getElementById(x).style.display = "inline" };
            function hide_item(x) { var s = x.toString(); s = s[s.length - 1]; if (menu_opened[s - 1] != true) document.getElementById(x).style.display = "none" };
            function login_display(x) { document.getElementById(x).style.display = 'block' }
            function login_hide(x) { document.getElementById(x).style.display = 'none' }
            function change_css(x, css) { document.getElementById(x).className = css };
            $(document).ready(function () {
                $("#sozlesme").click(function () {
                    $("#sozlesme").slideUp("600");
                });
            });


    </script>
     <div class="row">
        <div class="col-md-6">
            <form>
            <div id="login_table1" class="login-box">
                <div class="login-box-row">
                        <div class="login-box-row-left">Ad</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ad" Display="None" ErrorMessage="Bu alanı boş geçemezsiniz (Ad)"></asp:RequiredFieldValidator>
                        <div class="login-box-row-right"><asp:TextBox id="ad" class="login-box-row-right-box" type="text" pattern="([a-zA-Z]{3,15}|[a-zA-Z\s]{3,20})" onkeypress="if (event.keyCode == 32 && document.getElementById('ad').value.indexOf(' ')>-1) {return false }" placeholder="Adınızı yazınız..." required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left">Soyad</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="soyad" Display="None" ErrorMessage="Bu alanı boş geçemezsiniz (Soyad)"></asp:RequiredFieldValidator>
                        <div class="login-box-row-right"><asp:TextBox id="soyad" class="login-box-row-right-box" type="text" pattern="([a-zA-Z]{3,20})" placeholder="Soyadınızı yazınız..." required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left">E-Posta</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email1" Display="None" ErrorMessage="Bu alanı boş geçemezsiniz (E-mail)"></asp:RequiredFieldValidator>
                        <div class="login-box-row-right"><asp:TextBox id="email1" class="login-box-row-right-box" type="email" placeholder="E-mail adresinizi yazınız..." required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left">E-Posta (tekrar)</div>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="email1" ControlToCompare="email2" Display="None" ErrorMessage="Eşleşmiyor (E-mail)"></asp:CompareValidator>
                        <div class="login-box-row-right"><asp:TextBox id="email2" class="login-box-row-right-box" type="email" placeholder="E-mail adresi (tekrar)" onblur="if(document.getElementById('email1').value!=document.getElementById('email2').value){document.getElementById('email2').value=''}" required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left">Telefon(GSM)</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="GSM" Display="None" ErrorMessage="Bu alanı boş geçemezsiniz (GSM No)"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="GSM" Display="None" ValidationExpression="(^5)([0-9]{9})" ErrorMessage="Uygun tipte değil (GSM No)"></asp:RegularExpressionValidator>
                        <div class="login-box-row-right"><asp:TextBox id="GSM" class="login-box-row-right-box" type="tel" title="Cep telefonunuz" pattern="(^5)([0-9]{9})" placeholder="(5xx)(xxx-xx-xx)" required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left">Doğum Tarihi</div>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DTar" Type="Date" Display="None" MinimumValue="1930-01-01" MaximumValue="2005-12-31" ErrorMessage="Uygun aralıkta değil (Doğum tarihi)"></asp:RangeValidator>
                        <div class="login-box-row-right"><asp:TextBox id="DTar" class="login-box-row-right-box" type="date" min="1930-01-01" max="2005-12-31" required="required" runat="server"></asp:TextBox></div>
                        <div class="login-box-row-left"></div>
                        <div class="login-box-row-right"><asp:Button id="forward" CausesValidation="false" class="login-box-row-right-box" style="font:16px arial bolder" Text="İleri"  OnClientClick="login_hide('login_table1'); login_display('login_table2')" OnInit="forward_Init"  runat="server"></asp:Button></div>
                </div>
            </div>
            <div id="login_table2" class="login-box" style="display:none">
                <div class="login-box-row">
                        <div class="login-box-row-left">Ülke</div>
                        <div class="login-box-row-right">
                            <select class="login-box-row-right-box" required="required">
                                <option value="1">Türkiye</option>
                            </select>
                        </div>
                        <div class="login-box-row-left">Şehir</div>
                        <div class="login-box-row-right"> 
                                <asp:ListBox ID="Sehir" AutoPostBack="true" CausesValidation="false" EnableViewState="true"  OnSelectedIndexChanged="Sehir_SelectedIndexChanged" CssClass="login-box-row-right-box" Rows="1" OnInit="Sehir_Init" required="required" runat="server" ></asp:ListBox>
                             </div>
                        <div class="login-box-row-left">İlçe</div>
                        <div class="login-box-row-right">
                            <asp:ScriptManager ID="ScriptManager1"  runat="server"></asp:ScriptManager> 
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:ListBox ID="Ilce" CssClass="login-box-row-right-box" Rows="1" OnInit="Ilce_Init" required="required" runat="server" ></asp:ListBox>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Sehir"  EventName="SelectedIndexChanged"/>
                                </Triggers>
                            </asp:UpdatePanel>
                           </div>
                        <div class="login-box-row-left">Şifre</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pass1" Display="None" ErrorMessage="Bu alanı boş geçemezsiniz (Şifre)"></asp:RequiredFieldValidator>
                        <div class="login-box-row-right"><asp:TextBox id="pass1" class="login-box-row-right-box" type="password" pattern=".{5,10}" title="Şifreniz" placeholder="5-10 arası karakter..." runat="server" required="required"></asp:TextBox></div>
                        <div class="login-box-row-left">Şifre(Tekrar)</div>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="pass2" Operator="Equal" ControlToCompare="pass1" Display="None" ErrorMessage="Eşleşmiyor (Şifre)"></asp:CompareValidator>
                        <div class="login-box-row-right"><asp:TextBox id="pass2" class="login-box-row-right-box" type="password" pattern=".{5,10}" title="Şifreniz" placeholder="5-10 arası karakter..." onblur="if(document.getElementById('pass1').value!=document.getElementById('pass2').value){document.getElementById('pass2').value=''}" runat="server" required="required" ></asp:TextBox></div>
                        <div class="login-box-row-left">Cinsiyet</div>
                        <div class="login-box-row-right">
                            <div style="width:144px;height:40px;margin-left:0px;margin-top:3px; position:relative;float:left;display:inline">
                               
                                <asp:RadioButtonList ID="Cinsiyet" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem>Kadın</asp:ListItem>
                                    <asp:ListItem Selected="True">Erkek</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="login-box-row-left" style="padding-top:0px"><input class="login-box-row-right-box" type="button" value="Geri" style="width:100px;padding-top:0px; font:16px arial bolder" onclick="login_hide('login_table2'); login_display('login_table1')" /> </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="login-box-row-right"><asp:Button id="Submit" class="login-box-row-right-box" style="padding-top:0px; font:16px arial bolder" Text="Onayla" OnClick="Submit_Click" runat="server"/></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Sozlesme" EventName="CheckedChanged" />
                        </Triggers>
                    </asp:UpdatePanel>    
                     </div>
            </div>
                <div style="color:red; font-style:italic;"><asp:ValidationSummary ID="ValidationSummary1" runat="server" /></div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="color:red; font-style:italic"><asp:Label ID="OnayBilgi" Text="" Visible="false" runat="server"   ></asp:Label></div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Submit" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                </form>
                <div class="login-box-row" style="position:relative;height:24px">
                    <asp:CheckBox ID="DuyuruCep" Text="Duyurularının cep telefonuma gönderilmesini istiyorum." runat="server" />
                </div>
                <div class="login-box-row" style="position:relative;height:24px">
                    <asp:CheckBox ID="DuyuruEmail" Text="Duyurularından haberdar olmak istiyorum." runat="server"/> 
                </div>
                <div class="login-box-row" style="position:relative;height:24px">
                    <asp:CheckBox ID="Sozlesme" Checked="true" AutoPostBack="true" OnCheckedChanged="Sozlesme_CheckedChanged" runat="server" /><a href="#" onclick="display_item('sozlesme');change_css('sozlesme','sozlesme-ac');">Sözleşmesini okudum ve kabul ediyorum.</a>
                </div>
        </div>
        
        <div class="col-md-6">
            <img src="\images\uyelikbanner.jpg"/></div>
    </div>
    <div id="sozlesme" style="position: fixed; width: 80%;top:10px;left:10px; height: 600px; margin-left: auto; margin-right: auto; display: inline;overflow:scroll;display:none">
        <pre>
            ÜYELİK SÖZLEŞMESİ
1. Taraflar
a) www.hepsiburada.com  internet sitesinin faaliyetlerini yürüten Kuştepe Mah. Mecidiyeköy Yolu Cad. Trump Towers Kule 2 Kat:2 No:12 34387 Şişli/İstanbul adresinde mukim D-Market Elektronik Hizmetler ve Ticaret A.Ş. (Bundan böyle “Hepsiburada” olarak anılacaktır).
b) www.hepsiburada.com  internet sitesine üye olan internet kullanıcısı ("Üye")
2. Sözleşmenin Konusu
İşbu Sözleşme’nin konusu Hepsiburada’nın sahip olduğu internet sitesi www.hepsiburada.com ‘dan üyenin faydalanma şartlarının belirlenmesidir.
3. Tarafların Hak ve Yükümlülükleri
3.1. Üye, www.hepsiburada.com  internet sitesine üye olurken verdiği kişisel ve diğer sair bilgilerin kanunlar önünde doğru olduğunu, Hepsiburada'nın bu bilgilerin gerçeğe aykırılığı nedeniyle uğrayacağı tüm zararları aynen ve derhal tazmin edeceğini beyan ve taahhüt eder.
3.2. Üye, Hepsiburada tarafından kendisine verilmiş olan şifreyi başka kişi ya da kuruluşlara veremez, üyenin sözkonusu şifreyi kullanma hakkı bizzat kendisine aittir. Bu sebeple doğabilecek tüm sorumluluk ile üçüncü kişiler veya yetkili merciler tarafından Hepsiburada'ya karşı ileri sürülebilecek tüm iddia ve taleplere karşı, Hepsiburada'nın sözkonusu izinsiz kullanımdan kaynaklanan her türlü tazminat ve sair talep hakkı saklıdır.
3.3. Üye www.hepsiburada.com  internet sitesini kullanırken yasal mevzuat hükümlerine riayet etmeyi ve bunları ihlal etmemeyi baştan kabul ve taahhüt eder. Aksi takdirde, doğacak tüm hukuki ve cezai yükümlülükler tamamen ve münhasıran üyeyi bağlayacaktır.
3.4. Üye, www.hepsiburada.com  internet sitesini hiçbir şekilde kamu düzenini bozucu, genel ahlaka aykırı, başkalarını rahatsız ve taciz edici şekilde, yasalara aykırı bir amaç için, başkalarının fikri ve telif haklarına tecavüz edecek şekilde kullanamaz. Ayrıca, üye başkalarının hizmetleri kullanmasını önleyici veya zorlaştırıcı faaliyet (spam, virus, truva atı, vb.) ve işlemlerde bulunamaz.
3.5. www.hepsiburada.com  internet sitesinde üyeler tarafından beyan edilen, yazılan, kullanılan fikir ve düşünceler, tamamen üyelerin kendi kişisel görüşleridir ve görüş sahibini bağlar. Bu görüş ve düşüncelerin Hepsiburada'yla hiçbir ilgi ve bağlantısı yoktur. Hepsiburada'nın üyenin beyan edeceği fikir ve görüşler nedeniyle üçüncü kişilerin uğrayabileceği zararlardan ve üçüncü kişilerin beyan edeceği fikir ve görüşler nedeniyle üyenin uğrayabileceği zararlardan dolayı herhangi bir sorumluluğu bulunmamaktadır.
3.6. Hepsiburada, üye verilerinin yetkisiz kişilerce okunmasından ve üye yazılım ve verilerine gelebilecek zararlardan dolayı sorumlu olmayacaktır. Üye, www.hepsiburada.com  internet sitesinin kullanılmasından dolayı uğrayabileceği herhangi bir zarar yüzünden Hepsiburada'dan tazminat talep etmemeyi peşinen kabul etmiştir.
3.7. Üye, diğer internet kullanıcılarının yazılımlarına ve verilerine izinsiz olarak ulaşmamayı veya bunları kullanmamayı kabul etmiştir. Aksi takdirde, bundan doğacak hukuki ve cezai sorumluluklar tamamen üyeye aittir.
3.8. İşbu üyelik sözleşmesi içerisinde sayılan maddelerden bir ya da birkaçını ihlal eden üye işbu ihlal nedeniyle cezai ve hukuki olarak şahsen sorumlu olup, Hepsiburada’yı bu ihlallerin hukuki ve cezai sonuçlarından ari tutacaktır. Ayrıca; işbu ihlal nedeniyle, olayın hukuk alanına intikal ettirilmesi halinde, Hepsiburada'nın üyeye karşı üyelik sözleşmesinee uyulmamasından dolayı tazminat talebinde bulunma hakkı saklıdır.
3.9. Hepsiburada'nın her zaman tek taraflı olarak gerektiğinde üyenin üyeliğini silme, müşteriye ait dosya, belge ve bilgileri silme hakkı vardır. Üye işbu tasarrufu önceden kabul eder. Bu durumda, Hepsiburada'nın hiçbir sorumluluğu yoktur.
3.10. www.hepsiburada.com  internet sitesi yazılım ve tasarımı Hepsiburada mülkiyetinde olup, bunlara ilişkin telif hakkı ve/veya diğer fikri mülkiyet hakları ilgili kanunlarca korunmakta olup, bunlar  üye tarafından izinsiz kullanılamaz, iktisap edilemez ve değiştirilemez. Bu web sitesinde adı geçen başkaca şirketler ve ürünleri sahiplerinin ticari markalarıdır ve ayrıca fikri mülkiyet hakları kapsamında korunmaktadır.
3.11. Hepsiburada tarafından www.hepsiburada.com  internet sitesinin iyileştirilmesi, geliştirilmesine yönelik olarak ve/veya yasal mevzuat çerçevesinde siteye erişmek için kullanılan İnternet servis sağlayıcısının adı ve Internet Protokol (IP) adresi, Siteye erişilen tarih ve saat, sitede bulunulan sırada erişilen sayfalar ve siteye doğrudan bağlanılmasını sağlayan Web sitesinin Internet adresi gibi birtakım bilgiler toplanabilir.
3.12. Hepsiburada kullanıcılarına daha iyi hizmet sunmak, ürünlerini ve hizmetlerini iyileştirmek, sitenin kullanımını kolaylaştırmak için kullanımını kullanıcılarının özel tercihlerine ve ilgi alanlarına yönelik çalışmalarda üyelerin kişisel bilgilerini kullanabilir. Hepsiburada, üyenin www.hepsiburada.com  internet sitesi üzerinde yaptığı hareketlerin kaydını bulundurma hakkını saklı tutar.
3.13. Hepsiburada’ya üye olan kişi, yürürlükte bulunan ve/veya yürürlüğe alınacak uygulamalar kapsamında Hepsiburada ve Doğan Online (DOL) iştiraki olan tüm şirketler tarafından  kendisine ürün ve hizmet tanıtımları, reklamlar, kampanyalar, avantajlar, anketler  ve diğer müşteri memnuniyeti uygulamaları sunulmasına izin verdiğini beyan ve kabul eder.  Üye, Hepsiburada’ya üye olurken ve/veya başka yollarla geçmişte vermiş olduğu ve/veya gelecekte vereceği kişisel ve alışveriş bilgilerinin ve alışveriş ve/veya tüketici davranış bilgilerinin  yukarıdaki amaçlarla toplanmasına, DOL  iştiraki olan tüm şirketler ile paylaşılmasına, Hepsiburada ve DOL iştiraki olan tüm şirketler tarafından kullanılmasına ve arşivlenmesine izin verdiğini beyan ve kabul eder. Üye aksini bildirmediği sürece  üyeliği sona erdiğinde de  verilerin toplanmasına, DOL iştiraki olan tüm şirketler ile paylaşılmasına, Hepsiburada ve DOL iştiraki olan tüm şirketler tarafından kullanılmasına ve arşivlenmesine izin verdiğini beyan ve kabul eder. Üye aksini bildirmediği  sürece Hepsiburada ve  DOL iştiraki olan tüm şirketlerin  kendisi ile  internet, telefon, SMS,  vb iletişim kanalları kullanarak irtibata geçmesine izin verdiğini beyan ve kabul eder. Üye yukarıda bahsi geçen bilgilerin toplanması,  paylaşılması, kullanılması, arşivlenmesi ve kendisine erişilmesi nedeniyle doğrudan ve/veya dolaylı maddi ve/veya manevi menfi ve/veya müsbet, velhasıl herhangi bir zarara uğradığı konusunda talepte bulunmayacağını ve Hepsiburada ve DOL iştiraki olan şirketleri sorumlu tutmayacağını beyan ve kabul eder. Üye veri paylaşım tercihlerini değiştirmek isterse, bu talebini Hepsiburada’nın müşteri hizmetleri çağrı merkezlerine  iletebilir.
3.14. Hepsiburada, üyenin kişisel bilgilerini yasal bir zorunluluk olarak istendiğinde veya (a) yasal gereklere uygun hareket etmek veya Hepsiburada’ya tebliğ edilen yasal işlemlere uymak; (b) Hepsiburada ve Hepsiburada web sitesi ailesinin haklarını ve mülkiyetini korumak ve savunmak için gerekli olduğuna iyi niyetle kanaat getirdiği hallerde açıklayabilir.
3.15. Hepsiburada web sitesinin virus ve benzeri amaçlı yazılımlardan arındırılmış olması için mevcut imkanlar dahilinde tedbir alınmıştır. Bunun yanında nihai güvenliğin sağlanması için kullanıcının, kendi virus koruma sistemini tedarik etmesi ve gerekli korunmayı sağlaması gerekmektedir. Bu bağlamda üye Hepsiburada web sitesi'ne girmesiyle, kendi yazılım ve işletim sistemlerinde oluşabilecek tüm hata ve bunların doğrudan ya da dolaylı sonuçlarından kendisinin sorumlu olduğunu kabul etmiş sayılır.
3.16. Hepsiburada, sitenin içeriğini dilediği zaman değiştirme, kullanıcılara sağlanan herhangi bir hizmeti değiştirme ya da sona erdirme veya Hepsiburada web sitesi'nde kayıtlı kullanıcı bilgi ve verilerini silme hakkını saklı tutar.
3.17. Hepsiburada, üyelik sözleşmesinin koşullarını hiçbir şekil ve surette ön ihbara ve/veya ihtara gerek kalmaksızın her zaman değiştirebilir, güncelleyebilir veya iptal edebilir. Değiştirilen, güncellenen ya da yürürlükten kaldırılan her hüküm , yayın tarihinde tüm üyeler bakımından hüküm ifade edecektir.
3.18. Taraflar, Hepsiburada'ya ait tüm bilgisayar kayıtlarının tek ve gerçek münhasır delil olarak, HUMK madde 287'ye uygun şekilde esas alınacağını ve söz konusu kayıtların bir delil sözleşmesi teşkil ettiği hususunu kabul ve beyan eder.
3.19. Hepsiburada, iş bu üyelik sözleşmesi uyarınca, üyelerinin kendisinde kayıtlı elektronik posta adreslerine bilgilendirme mailleri ve cep telefonlarına bilgilendirme SMS’leri gönderme yetkisine sahip olmakla beraber, üye işbu üyelik sözleşmesini onaylamasıyla beraber bilgilendirme maillerinin elektronik posta adresine ve bilgilendirme SMS’lerinin cep telefonuna gönderilmesini kabul etmiş sayılacaktır. Üye mail ve/veya SMS almaktan vazgeçmek istemesi durumunda “Benim Sayfam” bölümündeki “Tercihlerim” kısmından mail ve/veya SMS gönderim iptal işlemini gerçekleştirebilecektir.
4. Sözleşmenin Feshi
İşbu sözleşme üyenin üyeliğini iptal etmesi veya Hepsiburada tarafından üyeliğinin iptal edilmesine kadar yürürlükte kalacaktır. Hepsiburada üyenin üyelik sözleşmesinin herhangi bir hükmünü ihlal etmesi durumunda üyenin üyeliğini iptal ederek sözleşmeyi tek taraflı olarak feshedebilecektir.
5. İhtilaflerin Halli
İşbu sözleşmeye ilişkin ihtilaflerde İstanbul Mahkemeleri ve İcra Daireleri yetkilidir.
6. Yürürlük
Üyenin, üyelik kaydı yapması üyenin üyelik sözleşmesinde yer alan tüm maddeleri okuduğu ve üyelik sözleşmesinde yer alan maddeleri kabul ettiği anlamına gelir. İşbu Sözleşme üyenin üye olması anında akdedilmiş ve karşılıklı olarak yürürlülüğe girmiştir.
        </pre>
    </div>
</asp:Content>

