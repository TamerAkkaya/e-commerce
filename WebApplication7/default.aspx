<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication7._default" %>
<%@ MasterType virtualpath="~/Site1.Master" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <script>
        function display_item(x) { document.getElementById(x).style.display = "inline" };
        function hide_item(x) { document.getElementById(x).style.display = "none" };
      
    </script>
    <div id="LeftMenu1" style="width:250px;position:relative; float:left">
        <asp:Menu ID="Menu1" runat="server" DynamicMenuItemStyle-CssClass="leftAna" StaticMenuItemStyle-CssClass="leftAna">   
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            
        </asp:Menu>
        
    </div>
    <div style="width:100%; margin-top:20px">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" HorizontalAlign="Center">
        <HeaderTemplate>
            <div class="band"></div>
            <div class="anasayfa_urunler_baslik" style="margin-top:20px"><span>Vitrindekiler</span></div>
        </HeaderTemplate>
        <ItemTemplate>
            <ul class="site_urunler" style="width:auto;">
                <li style="width:auto;margin:2px; border:1px solid #dedede">
                    <div class="imaj">
                        <a href="#" title="<%#Eval("UrunAdi")%>">
                            <img src="<%#Eval("Resim1")%>" alt="<%#Eval("UrunAdi")%>" width="180" height="157">
                        </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
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
                        <a href='/Sepetim.aspx?SepetItemID=<%#Eval("UrunID")%>'>Sepete Ekle</a>
                    </div>
                </li>
            </ul>
        </ItemTemplate>

    </asp:DataList>
        
    </div>
    
</asp:Content>

