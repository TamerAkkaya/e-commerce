<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="WebApplication7.Sepetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
       <asp:DataList ID="SepetList" runat="server" OnItemDataBound="SepetList_ItemDataBound">
           <HeaderTemplate>
               <div style="width:100%"> 
               <h2 style="width:1002px;margin-left:10px">Sepetim</h2> 
                   <table border="1" style="width:1002px;margin-left:10px">
                   <tr >
                       <td style="width:150px"></td>
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
               <div style="width:100%">
                   <table border="1" style="width:1002px;margin-left:10px">                     
                   <tr>
                       <td style="width:150px;text-align:right">
                           <asp:LinkButton ID="LinkButton_Delete" runat="server" CssClass="linkbtn" CommandArgument='<%#Eval("UrunID")%>' OnClick="LinkButton_Delete_Click">Sil</asp:LinkButton>&nbsp;&nbsp;&nbsp<img src='<%#Eval("UrunResmi") %>' width="75" height="75" />&nbsp;&nbsp</td>
                       <td style="width:400px"><%#Eval("UrunAdi") %></td>
                       <td style="width:150px;text-align:right">
                           <asp:TextBox runat="server" ID="SiparisAdet" TextMode="Number" min="1" max="99" Width="50" Text='<%#Eval("UrunSiparisAdet") %>' OnTextChanged="SiparisAdet_TextChanged" OnDataBinding="SiparisAdet_TextChanged"/>
                           <asp:LinkButton ID="LinkButton_Update" runat="server" CssClass="linkbtn"  CommandArgument='<%#Eval("UrunID")%>' OnClick="LinkButton_Update_Click">Güncelle</asp:LinkButton>&nbsp;&nbsp
                           
                       </td>
                       <td style="width:150px;text-align:right"><%#Eval("UrunFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                       <td style="width:150px;text-align:right"><%#Eval("ToplamFiyat") %>&nbsp TL&nbsp;&nbsp</td>
                   </tr>
                   </table>
                   <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="SiparisAdet" MinimumValue="1" MaximumValue="99" SetFocusOnError="true"/>
               </div>
           </ItemTemplate>
           <FooterTemplate>
               <div style="width:100%">  
                   <table style="width:1002px;margin-left:10px">
                       <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td  colspan="4" style="text-align:right;font-weight:bold">Genel Toplam&nbsp&nbsp</td>
                           <td style="width:150px; text-align:right;font-weight:bold">
                               <asp:Label ID="toplam" runat="server" Text="TL" OnInit="toplam_Init"></asp:Label>&nbsp&nbsp
                           </td>
                       </tr>
                       <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td colspan="5" style="text-align:right;font-weight:bold">
                               <asp:Button ID="btnBuy" runat="server" Text="Satın Al" Visible="false" CausesValidation="false" OnClick="btnBuy_Click" OnInit="btnBuy_Init" />
                           </td>
                       </tr>
                   </table>
               </div>
           </FooterTemplate>
       </asp:DataList>
    </div>
  
        
 
</asp:Content>


