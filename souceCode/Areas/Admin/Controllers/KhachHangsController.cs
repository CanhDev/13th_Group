using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;

namespace Team_13st.Areas.Admin.Controllers
{
    public class KhachHangsController : Controller
    {
        private RUOUEntities1 db = new RUOUEntities1();
        private DesEncryptionHelper desHelper = new DesEncryptionHelper("0123456789abcdef");
        // GET: Admin/KhachHangs
        public ActionResult Index(string searchString, int? page)
        {
            if (checkQuyen() == true)
            {
                IQueryable<KhachHang> khachHangs = db.KhachHangs;
                khachHangs = khachHangs.OrderBy(p => p.MaKhachHang);
                //
                if (!string.IsNullOrEmpty(searchString))
                {
                    khachHangs = FilterProducts(khachHangs, searchString);
                    ViewBag.SearchString = searchString;
                }
                else
                {
                    ViewBag.SearchString = "";
                }
                //
                if (khachHangs.Count() <= 0)
                {
                    ViewBag.notify = "Không có tài khoản nào phù hợp";
                }
                else
                {
                    ViewBag.notify = "";
                }
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(khachHangs.ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("Index", "Check");
        }
        private IQueryable<KhachHang> FilterProducts(IQueryable<KhachHang> khachHangs, string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                khachHangs = khachHangs.Where(s => s.TenKhachHang.Contains(searchString));
            }
            ViewBag.searchString = searchString ?? "";
            return khachHangs;
        }

        // GET: Admin/KhachHangs/Details/5
        public ActionResult Details(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                KhachHang khachHang = db.KhachHangs.Find(id);
                if (khachHang == null)
                {
                    return HttpNotFound();
                }
                return View(khachHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // GET: Admin/KhachHangs/Create
        public ActionResult Create()
        {
            if (checkQuyen() == true)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Check");
            }
        }

        // POST: Admin/KhachHangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TenKhachHang,MaKhachHang,DiaChi,TenDangNhap,MatKhau,SoDienThoai")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                khachHang.MatKhau = desHelper.Encrypt(khachHang.MatKhau);
                db.KhachHangs.Add(khachHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khachHang);
        }

        // GET: Admin/KhachHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                KhachHang khachHang = db.KhachHangs.Find(id);
                if (khachHang == null)
                {
                    return HttpNotFound();
                }
                if (khachHang != null)
                {
                    ViewBag.password = desHelper.Decrypt(khachHang.MatKhau);
                }
                return View(khachHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/KhachHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TenKhachHang,MaKhachHang,DiaChi,TenDangNhap,MatKhau,SoDienThoai")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                khachHang.MatKhau = desHelper.Encrypt(khachHang.MatKhau);
                db.Entry(khachHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        // GET: Admin/KhachHangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                KhachHang khachHang = db.KhachHangs.Find(id);
                if (khachHang == null)
                {
                    return HttpNotFound();
                }
                return View(khachHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/KhachHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KhachHang khachHang = db.KhachHangs.Find(id);
            db.KhachHangs.Remove(khachHang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public bool checkQuyen()
        {
            KhachHang kh = (KhachHang)Session["User"];
            if (kh != null && kh.TenDangNhap.Contains("Admin"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
