<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UrunListesi.aspx.cs" Inherits="WebApplication7.UrunListesi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div style="width:1024px;height:auto;margin-left:auto;margin-right:auto; position:relative">
        <div style="width:200px;height:600px; background-color:gold;float:left"></div>
        <div style="width:824px;height:auto;float:left">
        <asp:DataList ID="DataList3" runat="server" HorizontalAlign="Justify" RepeatColumns="4" RepeatDirection="Horizontal">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <ul class="site_urunler" style="width:auto;">
                <li style="width:auto;margin:2px; border:1px solid #dedede">
                    <div class="imaj">
                        <a href="#" title="<%#Eval("UrunAdi")%>">
                            <img src="<%#Eval("Resim1")%>" alt="<%#Eval("UrunAdi")%>" width="180" height="157">
                        </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="urun_adi"><a href="#" title="<%#Eval("UrunAdi")%>"><%#Eval("UrunAdi")%></a></div>
                    <div class="urun_adi_stok"></div>
                    <div class="fiyat_alan">
                        <ul>
                            <li class="fiyat_box">
                                
                                    <div class="eski_fiyat"><%#Eval("Fiyat")%>&nbsp;TL</div>
 
                     
                                <div id="IskontoFiyat" class="fiyat"><%#Eval("IndirimliFiyat")%>&nbsp;TL</div>
                            </li>
                            
                                <li class="indirim_alan">
                                    <svg style="width:60px;height:52px;margin-left:8px;">
                                        <circle cx="25" cy="25" r="25" fill="#ff8d00" />
                                    </svg>
                                    <div class="indirim_oran" style="margin-top:-38px;"><%#Eval("IskontoOrani")%></div>
                                    <div class="indirim_oran" style="margin-top:-38px;margin-left:5px;font-size:14px;">%</div>
                                </li>
                        </ul>
                    </div>
                    <div class="icon_alan">
                        <ul>
                                <li class="hizligonderi"></li>
                        </ul>
                    </div>
                    <div>
                        <asp:Button ID="SepeteEkle" Text="Sepete Ekle" runat="server" OnClick="SepeteEkle_Click" />
                    </div>
                </li>
            </ul>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
        </div>
    </div>
</asp:Content>

