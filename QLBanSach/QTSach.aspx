<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTSach.aspx.cs" Inherits="QLBanSach.QTSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
     <h2>TRANG QUẢN TRỊ SÁCH</h2>
     <hr />   
     <div class="row mb-2">
         <div class="col-md-6">
              <div class="form-inline">
                   Tựa sách <asp:TextBox ID="txtTenSachTim" runat="server" placeholder="Nhập tựa sách cần tìm" CssClass="form-control ml-2" Width="300"></asp:TextBox>
                  <asp:Button ID="btTraCuu" runat="server" Text="Tra cứu" CssClass="btn btn-info ml-2" />                 
              </div>
         </div>
        <div class="col-md-6 text-right">
             <a href="ThemSach.aspx" class="btn btn-success">Thêm sách mới</a>
        </div>
    </div>
<asp:GridView ID="GridView1" runat="server" DataSourceID="odsSachTheoTen"
    AutoGenerateColumns="False" CssClass="table table-bordered"
    DataKeyNames="masach" AllowPaging="true"
    PageSize="4"
    >
    <Columns>
        <asp:BoundField DataField="TenSach" HeaderText="Tựa Sách" SortExpression="TenSach" />
        <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="~/Bia_sach/{0}" ControlStyle-Width="100px" HeaderText="Ảnh Bìa" ReadOnly="true"></asp:ImageField>
        <asp:BoundField DataField="Dongia" HeaderText="Dongia" SortExpression="Dongia" DataFormatString="{0:#,##0} đồng" />
        <asp:CheckBoxField DataField="KhuyenMai" HeaderText="KhuyenMai" SortExpression="KhuyenMai" />
        <asp:CommandField ShowEditButton="true" EditText="Sửa" ButtonType="Button" UpdateText="Ghi" CancelText="Không" HeaderText="Chọn thao tác"/>
        <asp:TemplateField HeaderText="Chọn thao tác">
            <ItemTemplate>
                         <asp:Button ID="btXoa" runat="server" Text="Xoá" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xoá?')" /> 
                     </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerStyle HorizontalAlign="Center"/>
     </asp:GridView>
    
<asp:ObjectDataSource ID="odsSachTheoTen" runat="server" DataObjectTypeName="QLBanSach.Models.Sach" DeleteMethod="Delete" SelectMethod="laySachTheoTen" TypeName="QLBanSach.Models.SachDAO" UpdateMethod="Update">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtTenSachTim" Name="tensach" PropertyName="Text" Type="String" />
    </SelectParameters>
     </asp:ObjectDataSource>
    
</asp:Content>
