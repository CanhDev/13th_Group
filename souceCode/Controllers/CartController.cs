using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;

namespace Team_13st.Controllers
{
    public class CartController : Controller
    {
        private static RUOUEntities1 db = new RUOUEntities1();
        public ActionResult Index()
        {
            KhachHang kh = (KhachHang)(Session["User"]);
            if(kh != null)
            {
                GioHang UserCart = db.GioHangs.Where(g => g.idKhachHang == kh.MaKhachHang).FirstOrDefault();
                if(UserCart == null)
                {
                    UserCart = new GioHang { idKhachHang =  kh.MaKhachHang, NgayThem = DateTime.Now };
                    db.GioHangs.Add(UserCart);
                    db.SaveChanges();
                }
                //
                return View(UserCart);
            }
            return RedirectToAction("Login", "Account");
        }
        public ActionResult addItem(int productId, int soluong = 1)
        {
            KhachHang kh = (KhachHang)(Session["User"]);
            if(kh != null)
            {
                GioHang UserCart = db.GioHangs.Where(g => g.idKhachHang == kh.MaKhachHang).FirstOrDefault();
                if (UserCart == null)
                {
                    UserCart = new GioHang { idKhachHang = kh.MaKhachHang, NgayThem = DateTime.Now };
                    db.GioHangs.Add(UserCart);
                    db.SaveChanges();
                }
                //
                var product = db.SanPhams.Find(productId);
                if (product == null || product.Quantity < soluong)
                {
                    return Json(new { status = false, error = "Lỗi sản phẩm" });
                }
                var cartItem = db.ItemCarts.FirstOrDefault(ci => ci.idGioHang == UserCart.MaGioHang && ci.idSanPham == productId);
                if (cartItem == null)
                {
                    cartItem = new ItemCart
                    {
                        idGioHang = UserCart.MaGioHang,
                        idSanPham = productId,
                        SoLuong = soluong,
                        Gia = product.Price
                    };
                    db.ItemCarts.Add(cartItem);
                }
                else
                {
                    cartItem.SoLuong += soluong;
                }
                product.Quantity -= soluong;
                db.SaveChanges();
                return Json(new { status = true, JsonRequestBehavior.AllowGet });
            }
            else
            {
                return Json(new { status = false, error = "Bạn chưa đăng nhập" });
            }
        }
        public ActionResult removeItem(int? id)
        {
            var item = db.ItemCarts.Find(id);
            if(item != null)
            {
                db.ItemCarts.Remove(item);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return HttpNotFound();
            }
        }
        public ActionResult RemoveAllItem(int? idCart)
        {
            GioHang cart = db.GioHangs.Find(idCart);
            if (cart.ItemCarts.Any())
            {
                db.ItemCarts.RemoveRange(cart.ItemCarts);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return HttpNotFound();
        }
    }
}