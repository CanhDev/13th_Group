using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;

namespace Team_13st.Controllers
{
    public class AccountController : Controller
    {
        private DesEncryptionHelper desHelper = new DesEncryptionHelper("0123456789abcdef");
        private static RUOUEntities1 db = new RUOUEntities1();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Banned()
        {
            return View();
        }
        public ActionResult Register() { 
            return View();
        }
        [HttpPost]
        public ActionResult Register(string name ,string username, string password, string sdt, string diachi)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var encryptedPassword = desHelper.Encrypt(password);
                    var newUser = new KhachHang();
                    newUser.TenKhachHang = name;
                    newUser.TenDangNhap = username;
                    newUser.MatKhau = encryptedPassword;
                    newUser.SoDienThoai = sdt;
                    newUser.DiaChi = diachi;
                    //
                    var user = db.KhachHangs.FirstOrDefault(u => u.TenDangNhap == username);
                    if (user == null)
                    {
                        db.KhachHangs.Add(newUser);
                        ViewBag.checkUser = "";
                        db.SaveChanges();

                        return Json(new { status = true, JsonRequestBehavior.AllowGet });
                    }
                    else
                    {
                        return Json(new { status = false, errror = "Đã tồn tại tên đăng nhập này" });
                    }
                }
                return View();
            }catch (Exception ex)
            {
                return Json(new { status = false, errror = "Lỗi không thể đăng ký" });
            }
        }
        public ActionResult Login()
        {
            KhachHang kh = (KhachHang)(Session["User"]);
            if (kh == null)
            {
                return View();
            }
            else
            {
                return  RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var user = db.KhachHangs.FirstOrDefault(u => u.TenDangNhap == username);
            if(user != null)
            {
                var decryptedPassword = desHelper.Decrypt(user.MatKhau);
                if(decryptedPassword == password)
                {
                    Session["User"] = user;
                    ViewBag.checkLogin = "";
                    if (user.TenDangNhap.Contains("Admin"))
                    {
                        return Redirect("/Admin");
                    }
                    return RedirectToAction("Index", "Home");
                }
            }
            ViewBag.checkLogin = "Sai tên đăng nhập hoặc mật khẩu";
            return View();
        }
        public ActionResult Logout()
        {
            Session["User"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}