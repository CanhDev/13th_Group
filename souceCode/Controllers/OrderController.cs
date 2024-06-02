using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;

namespace Team_13st.Controllers
{
    public class OrderController : Controller
    {
        private static RUOUEntities1 db = new RUOUEntities1();
        public ActionResult Index()
        {
            KhachHang kh = (KhachHang)Session["User"];
            if(kh != null)
            {
                var Orders = db.DonHangs.Where(d => d.idKhachHang == kh.MaKhachHang).ToList();
                return View(Orders);
            }
            return HttpNotFound();
        }
        public ActionResult HandleOrder(int count, decimal total, int idCart) {
            KhachHang kh = (KhachHang)Session["User"];
            if(kh != null)
            {
                DonHang order = new DonHang
                {
                    idKhachHang = kh.MaKhachHang,
                    PhuongThucThanhToan = "Thanh toán khi nhận hàng",
                    TongSanPham = count,
                    TongTien = total,
                    ngayDat = DateTime.Now,
                    DiaChiNhanHang = kh.DiaChi
                };
                db.DonHangs.Add(order);
                db.SaveChanges();
                List<ItemCart> ds = db.ItemCarts.Where(i => i.idGioHang == idCart).ToList();
                foreach(var item in ds)
                {
                    if(item.SanPham != null)
                    {
                        ItemCart newItem = new ItemCart()
                        {
                            idSanPham = item.idSanPham,
                            SoLuong = item.SoLuong,
                            Gia = item.Gia,
                            idDonHang = order.MaDonHang
                        };
                        db.ItemCarts.Add(newItem);
                        db.SaveChanges();
                    }
                }
                return RedirectToAction("Index");
            }
            return HttpNotFound();
        }
        public ActionResult RemoveOrder(int id)
        {
            KhachHang kh = (KhachHang)Session["User"];
            if(kh != null)
            {
                DonHang order = db.DonHangs.Find(id);
                if(order != null)
                {
                    db.DonHangs.Remove(order);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return HttpNotFound();
        }
        public ActionResult ViewItem(int id)
        {
            KhachHang kh = (KhachHang)Session["User"];
            if(kh != null)
            {
                List<ItemCart> items = db.ItemCarts.Where(i => i.idDonHang == id).ToList();
                return View(items);
            }
            return HttpNotFound();
        }
    }
}