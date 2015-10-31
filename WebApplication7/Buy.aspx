<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Buy.aspx.cs" Inherits="WebApplication7.Buy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:1024px;height:auto;margin:auto">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <ajaxToolkit:TabContainer ID="tabBuy" runat="server" ActiveTabIndex="4" Height="568px" Width="1016px" style="margin-right: 20px">
            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2"><HeaderTemplate>
Ürünler
</HeaderTemplate>
                <ContentTemplate>
                    <section style="height:570px; overflow-x:auto; overflow-y:auto">
                     <asp:DataList ID="dlistUrunlerTab" runat="server" HorizontalAlign="Center">
                                   <HeaderTemplate>
               <div style="width:982px"> 
               <h2 style="width:976px;margin-left:10px">Alışveriş Listem</h2> 
                   <table border="1" style="width:976px;margin-left:6px">
                   <tr >
                       <td style="width:100px"></td>
                       <td style="width:400px"><b>Ürün Adı</b></td>
                       <td style="width:150px;text-align:right"><b>Adet&nbsp;&nbsp</b></td>
                       <td style="width:150px;text-align:right"><b>Fiyat&nbsp;&nbsp</b></td>
                       <td style="width:150px;text-align:right"><b>Toplam Fiyat&nbsp;&nbsp</b></td>
                   </tr>

                   </table>
               </div>

           </HeaderTemplate>
                                   <ItemTemplate>
               <style>
                   .linkbtn{
                       margin:4px;
                       padding:4px;
                       text-align:center;
                       background-color:white;
                       border:1px solid lightgray;
                   }
                   .linkbtn:hover{
                       background-color:lightgray;
                       border:1px solid gray;
                   }

               </style>              
               <div style="width:982px">
                   <table border="1" style="width:976px;margin-left:6px">                     
                   <tr>
                       <td style="width:100px;text-align:right">
                       <img src='<%#Eval("UrunResmi") %>' width="75" height="75" />&nbsp;&nbsp</td>
                       <td style="width:400px"><%#Eval("UrunAdi") %></td>
                       <td style="width:150px;text-align:right">
                           <asp:Label runat="server" ID="SiparisAdet" Width="50" Text='<%#Eval("UrunSiparisAdet")%>'></asp:Label>
                       </td>
                       <td style="width:150px;text-align:right"><%#Eval("UrunFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                       <td style="width:150px;text-align:right"><%#Eval("ToplamFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                   </tr>
                   </table>
               </div>
           </ItemTemplate>
                                   <FooterTemplate>
               <div style="width:982px">  
                   <table style="width:976px;margin-left:6px">
                       <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td  colspan="4" style="text-align:right;font-weight:bold">Genel Toplam&nbsp&nbsp</td>
                           <td style="width:150px; text-align:right;font-weight:bold">
                               <asp:Label ID="toplam" runat="server" Text="YTL" OnInit="toplam_Init"></asp:Label>&nbsp&nbsp
                           </td>
                       </tr>
                       <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                   </table>
                   <hr />
                   <div style="width:976px;text-align:center">
                        <asp:Button ID="btnUrunlerIleri" CausesValidation="false" Text="İleri" runat="server" Width="80" OnClick="btnUrunlerIleri_Click" UseSubmitBehavior="False" />
                   </div>
               </div>
           </FooterTemplate>
                    </asp:DataList>                          
                    </section>
                    
                </ContentTemplate>
</ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3"><HeaderTemplate>
Kargo
</HeaderTemplate>
                <ContentTemplate>
                    
                    <div style="width:990px; margin:0px;padding:2px; border:1px solid gray">
                        <p>&nbsp Lütfen tercih ettiğiniz kargoyu seçiniz</p>
                        <asp:UpdatePanel ID="panelKargo" runat="server">
                            <ContentTemplate>
                                <asp:RadioButtonList ID="radiolistKargo" runat="server" OnInit="radiolistKargo_Init" OnSelectedIndexChanged="radiolistKargo_SelectedIndexChanged"></asp:RadioButtonList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="radiolistKargo" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        
                    </div>
                    
                    <hr />
                    <div style="width:990px;text-align:center;margin-left:auto;margin-right:auto">
                        <asp:Button ID="btnKargoGeri" CausesValidation="False" Text="Geri" OnClick="btnKargoGeri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                        <asp:Button ID="btnKargoIleri" CausesValidation="False" Text="İleri" OnClick="btnKargoIleri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                    </div>
                    
                </ContentTemplate>
</ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4"><HeaderTemplate>
Adres
</HeaderTemplate>
                <ContentTemplate>
                    <div style="width:990px">
                        <asp:DataList ID="dlistAdres" runat="server">
                            <HeaderTemplate>
                                <h2>Adreslerim</h2>
                            </HeaderTemplate>
                            <ItemTemplate>
                                Ülke:<span style="width:120px;"></span><%#Eval("Ulke") %><br />İl:<span style="width:120px;"></span><%#Eval("Il") %><br />İlçe:<span style="width:120px;"><%#Eval("Ilce") %><br />Telefon:<span style="width:120px;"><%#Eval("Telefon") %><br /><br /><br />Adres:<span style="width:120px;"><asp:TextBox ID="txtAdres" TextMode="MultiLine" MaxLength="499" placeholder="Adresinizi yazınız(en az 5 harf)" CausesValidation="false" AutoPostBack="false" Width="210" Height="70" OnInit="txtAdres_Init" runat ="server" ></asp:TextBox><br />
                            </ItemTemplate>
                            <FooterTemplate>
                                <br />
                                <asp:Button ID="btnAdresGuncelle" CausesValidation="false" UseSubmitBehavior="false" Text="Kaydet" runat="server" OnInit="btnAdresGuncelle_Init" OnClick="btnAdresGuncelle_Click" Visible="false" />
                            </FooterTemplate>
                        </asp:DataList>
                    </div>

                                        <hr />
                    <div style="width:990px;text-align:center;margin-left:auto;margin-right:auto">
                        <asp:Button ID="btnAdresGeri" CausesValidation="False" Text="Geri" OnClick="btnAdresGeri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                        <asp:Button ID="btnAdresIleri" CausesValidation="False" Text="İleri" OnClick="btnAdresIleri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                    </div>
                </ContentTemplate>
</ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>
Ödeme
</HeaderTemplate>
                <ContentTemplate>
                    <article id="Taksitler" style="width:200px;height:500px;padding:4px; top:0px;left:0px; position:relative;float:left;border:1px solid gray">
                        <p style="padding:10px">Taksit Seçenekleri</p>
                        <table>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="panelOdeme" runat="server">
                                                    <ContentTemplate>
                                                        <asp:RadioButtonList ID="radiolistTaksit" RepeatLayout="Table" RepeatDirection="Vertical"  OnSelectedIndexChanged="radiolistTaksit_SelectedIndexChanged" runat="server"></asp:RadioButtonList>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="radiolistTaksit" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                
                                            </td>
                                        </tr>
                          </table>
                    </article>
                    <article id="KrediKarti" style="width:770px;left:20px;padding:4px; position:relative;float:left;border:1px solid gray; top: 0px; height: auto;">
                        <strong>Kredi kartı bilgilerini giriniz</strong><br /> <br /><br />
                        Kart Numarası:<br />
                        <asp:TextBox ID="CreditCardNumber" MaxLength="16" placeholder="0000-0000-0000-0000" OnTextChanged="CreditCardNumber_TextChanged" CausesValidation="True" runat="server" Height="20px" Width="176px"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="CreditCardNumber" Mask="9999-9999-9999-9999" runat="server" BehaviorID="_content_MaskedEditExtender1" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CreditCardNumber" ValidationExpression="(5[1-5]{1}[0-9]{14})" ForeColor="Red" ErrorMessage="Geçersiz Kart Numarası"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CreditCardNumber" SetFocusOnError="True" ForeColor="Red" ErrorMessage="Bu alan boş bırakılamaz"></asp:RequiredFieldValidator>
                        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator1" InvalidValueMessage="Geçersiz kart numarası" SetFocusOnError="True" ControlToValidate="CreditCardNumber" ControlExtender="MaskedEditExtender1" runat="server" ErrorMessage="Hata oluştu"></ajaxToolkit:MaskedEditValidator>
                        <br />
                        <br />
                        Kart Üzerindeki Ad Soyad<br />
                        <asp:TextBox ID="CardOwner" CausesValidation="True" runat="server" Height="20px" MaxLength="50" Width="176px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CardOwner" Display="Dynamic" ForeColor="Red" ErrorMessage="Bu alan boş bırakılamaz"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        Son Kullanma Tarihi:<br />
                        <asp:DropDownList ID="dlistAy" runat="server" Width="45px" OnInit="dlistAy_Init">
                            <asp:ListItem Selected="True">01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="dlistYil" runat="server" OnInit="dlistYil_Init">
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem Selected="True">2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        Güvenlik Kodu (CVC2):<br />
                        <asp:TextBox ID="CVC2" runat="server" placeholder="000" CausesValidation="True" Height="20px" Width="75px" OnTextChanged="CVC2_TextChanged" MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="True" ForeColor="Red" ControlToValidate="CVC2" Display="Dynamic" runat="server" ErrorMessage="Bu alan boş bırakılamaz"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" ControlToValidate="CVC2" ForeColor="Red" Display="Dynamic" Type="Integer" MinimumValue="100" MaximumValue="999" SetFocusOnError="True" runat="server" ErrorMessage="Geçersiz CVC2"></asp:RangeValidator>
                        <br />
                        <hr />
                    </article>
                                        <hr />
                    <div style="width:990px;text-align:center;position:relative;float:left; margin-left:auto;margin-right:auto; top: 0px; left: 0px;">
                        <asp:Button ID="btnOdemeGeri" CausesValidation="False" Text="Geri" OnClick="btnOdemeGeri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                        <asp:Button ID="btnOdemeIleri" CausesValidation="False" Text="İleri" OnClick="btnOdemeIleri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                    </div>
                </ContentTemplate>
</ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5"><HeaderTemplate>
Kontrol
</HeaderTemplate>
                <ContentTemplate>
                    <section style="height:570px; overflow-x:auto; overflow-y:auto">
                        <asp:DataList ID="DataList2" runat="server" HorizontalAlign="Center">
                        <HeaderTemplate>
                        <h3 style="width:976px;margin-left:10px">Ürünler</h3> 
                        <article style="width:982px"> 
                        <table border="1" style="width:976px;margin-left:6px">
                        <tr >
                        <td style="width:100px"></td>
                        <td style="width:400px"><b>Ürün Adı</b></td>
                        <td style="width:150px;text-align:right"><b>Adet&nbsp;&nbsp</b></td>
                        <td style="width:150px;text-align:right"><b>Fiyat&nbsp;&nbsp</b></td>
                        <td style="width:150px;text-align:right"><b>Toplam Fiyat&nbsp;&nbsp</b></td>
                        </tr>
                        </table>
                        </article> 
                        </HeaderTemplate>
                        <ItemTemplate>
                            <style>
                   .linkbtn{
                       margin:4px;
                       padding:4px;
                       text-align:center;
                       background-color:white;
                       border:1px solid lightgray;
                   }
                   .linkbtn:hover{
                       background-color:lightgray;
                       border:1px solid gray;
                   }

               </style> 
                                      
                            <article style="width:982px">
                   <table border="1" style="width:976px;margin-left:6px">                     
                   <tr>
                       <td style="width:100px;text-align:right">
                       <img src='<%#Eval("UrunResmi") %>' width="75" height="75" />&nbsp;&nbsp</td>
                       <td style="width:400px"><%#Eval("UrunAdi") %></td>
                       <td style="width:150px;text-align:right">
                           <asp:Label runat="server" ID="SiparisAdet" Width="50" Text='<%#Eval("UrunSiparisAdet")%>'></asp:Label>
                       </td>
                       <td style="width:150px;text-align:right"><%#Eval("UrunFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                       <td style="width:150px;text-align:right"><%#Eval("ToplamFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                   </tr>
                   </table>
               </article>
                   
                         </ItemTemplate>
                         <FooterTemplate>
                            <article style="width:982px">
                            <table style="width:976px;margin-left:6px">
                            <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td  colspan="4" style="text-align:right;font-weight:bold">Ürünler Tutarı:&nbsp&nbsp</td>
                            <td style="width:150px; text-align:right;font-weight:bold">
                               <asp:Label ID="toplam" runat="server" Text="TL" OnInit="toplam_Init"></asp:Label>&nbsp&nbsp
                            </td>
                            </tr>
                            <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td  colspan="4" style="text-align:right;font-weight:bold">Kargo Ücreti:&nbsp&nbsp</td>
                            <td style="width:150px; text-align:right;font-weight:bold">
                                <asp:Label ID="lblKontrol1"  OnInit="lblKontrol1_Init" runat="server" Text="TL"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td  colspan="4" style="text-align:right;font-weight:bold">Genel Toplam:&nbsp&nbsp</td>
                            <td style="width:150px; text-align:right;font-weight:bold">
                                <asp:Label ID="lblKontrol2" OnInit="lblKontrol2_Init" runat="server" Text="TL"></asp:Label>
                            </td>
                            </tr>
                   </table>
                            </article>
                         </FooterTemplate>
                    </asp:DataList>  
                        <article style="width:982px">
                         <h3>Kargo Bilgileri</h3>
                         Kargo Adı:&nbsp <asp:Label ID="KontrolKargo" runat="server" Text="Label"></asp:Label>
                     </article>   
                        <hr />
                        <article style="width:990px;text-align:center;margin-left:auto;margin-right:auto">
                        <asp:Button ID="btnKontrolGeri" CausesValidation="False" Text="Geri" OnClick="btnKontrolGeri_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                        <asp:Button ID="btnTamamla" CausesValidation="False" Text="Tamamla" OnClick="btnTamamla_Click" runat="server" Width="80px" UseSubmitBehavior="False" />
                        </article>
                    </section>
                    
                

                                        
                    
                </ContentTemplate>
</ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    
    </div>
    </form>
</body>
</html>
