using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLBanSach.Models;
namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                SachDAO sachDAO = new SachDAO();
                string tensach = txtTen.Text;
                int dongia = int.Parse(txtDonGia.Text);
                int macd = int.Parse(ddlChuDe.SelectedValue);

                string hinh = FHinh.FileName;
                string path = Server.MapPath("~/Bia_sach") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);

                Boolean km = chkKhuyenMai.Checked;
                Sach sachNew = new Sach { TenSach = tensach, Dongia = dongia, MaCD = macd, Hinh = hinh, KhuyenMai = km, NgayCapNhat = DateTime.Today };
                sachDAO.Insert(sachNew);

                lbThongBao.Text = "Thao tác thêm sách thành công";

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thao tác thêm sách thất bại";

            }
        }
    }
}