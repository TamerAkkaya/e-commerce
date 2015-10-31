<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApplication7.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
            
    <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <b>Kategoriler</b><br />
                    </HeaderTemplate>
                    <ItemTemplate >
                        <div>
                        <ul style="width:200px;height:40px; vertical-align:middle;list-style:none; background-color:#d3d3d3">
                            <li>
                                <a href="MainPage.aspx?ID=<%# Eval("AnaKategoriID") %>"><%#Eval("Adi")%></a>
                            </li>
                        </ul>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
    <asp:DataList runat="server">
        <HeaderTemplate>
            <div class="anasayfa_urunler_baslik"><span>Vitrindekiler</span></div>
        </HeaderTemplate>
        <ItemTemplate>
            <ul class="site_urunler">
                <li>
                    <div class="imaj">
                        <a href="/lenovo-g5070-59-443349-i5-4258u-24ghz-4gb-500gb-2gb-r5-m230-156-windows-81-notebook/10832673" title="LENOVO G5070 59-443349 i5-4258U 2.4GHz 4GB 500GB 2GB R5 M230 15.6&quot; Windows 8.1 Notebook">
                            <img src="http://cdn2.hizlial.com/Media/123/10832673/461083267305t2.jpg" alt="LENOVO G5070 59-443349 i5-4258U 2.4GHz 4GB 500GB 2GB R5 M230 15.6&quot; Windows 8.1 Notebook" width="180" height="157">
                        </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="urun_adi"><a href="/lenovo-g5070-59-443349-i5-4258u-24ghz-4gb-500gb-2gb-r5-m230-156-windows-81-notebook/10832673" title="LENOVO G5070 59-443349 i5-4258U 2.4GHz 4GB 500GB 2GB R5 M230 15.6&quot; Windows 8.1 Notebook">LENOVO G5070 59-443349 i5-4258U 2.4GHz 4GB 500GB 2GB R5 M230 15.6" Windows 8.1 Notebook</a></div>
                    <div class="urun_adi_stok"></div>
                    <div class="fiyat_alan">
                        <ul>
                            <li class="fiyat_box">
                                
                                    <div class="eski_fiyat">2.284,29&nbsp;TL</div>
                                
                                <div class="fiyat">1.599,00 TL</div>
                            </li>
                            
                                <li class="indirim_alan">
                                    <div class="indirim_oran">30</div>
                                </li>
                            
                        </ul>
                    </div>
                    
                    <div class="icon_alan">
                        <ul>
                            
                                <li class="hizligonderi"></li>
                            
                            
                            
                        </ul>
                    </div>
                </li>

        </ItemTemplate>

    </asp:DataList>
            </asp:Content>











