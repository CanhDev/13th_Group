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
using PagedList;

namespace Team_13st.Areas.Admin.Controllers
{
    public class DonHangsController : Controller
    {
        private RUOUEntities1 db = new RUOUEntities1();

        // GET: Admin/DonHangs
        public ActionResult Index(string searchString, int? page)
        {
            if (checkQuyen() == true)
            {
                IQueryable<DonHang> donHangs = db.DonHangs.Include(d => d.KhachHang);
                donHangs = donHangs.OrderBy(p => p.MaDonHang);
                //
                if (!string.IsNullOrEmpty(searchString))
                {
                    donHangs = FilterProducts(donHangs, searchString);
                    ViewBag.SearchString = searchString;
                }
                else
                {
                    ViewBag.SearchString = "";
                }
                //
                if (donHangs.Count() <= 0)
                {
                    ViewBag.notify = "Không có đơn hàng nào phù hợp";
                }
                else
                {
                    ViewBag.notify = "";
                }
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(donHangs.ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("Index", "Check");
        }
        private IQueryable<DonHang> FilterProducts(IQueryable<DonHang> donHangs, string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                donHangs = donHangs.Where(s => s.KhachHang.TenKhachHang.Contains(searchString));
            }
            ViewBag.searchString = searchString ?? "";
            return donHangs;
        }
        // GET: Admin/DonHangs/Details/5
        public ActionResult Details(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                DonHang donHang = db.DonHangs.Find(id);
                if (donHang == null)
                {
                    return HttpNotFound();
                }
                return View(donHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // GET: Admin/DonHangs/Create
        public ActionResult Create()
        {
            if (checkQuyen() == true)
            {
                ViewBag.idKhachHang = new SelectList(db.KhachHangs, "MaKhachHang", "TenKhachHang");
                return View();
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/DonHangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDonHang,PhuongThucThanhToan,TongSanPham,DiaChiNhanHang,TongTien,idKhachHang,ngayDat")] DonHang donHang)
        {
            if (checkQuyen() == true)
            {
                if (ModelState.IsValid)
                {
                    db.DonHangs.Add(donHang);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.idKhachHang = new SelectList(db.KhachHangs, "MaKhachHang", "TenKhachHang", donHang.idKhachHang);
                return View(donHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // GET: Admin/DonHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if(checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                DonHang donHang = db.DonHangs.Find(id);
                if (donHang == null)
                {
                    return HttpNotFound();
                }
                ViewBag.idKhachHang = new SelectList(db.KhachHangs, "MaKhachHang", "TenKhachHang", donHang.idKhachHang);
                return View(donHang);
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/DonHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDonHang,PhuongThucThanhToan,TongSanPham,DiaChiNhanHang,TongTien,idKhachHang,ngayDat")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idKhachHang = new SelectList(db.KhachHangs, "MaKhachHang", "TenKhachHang", donHang.idKhachHang);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                DonHang donHang = db.DonHangs.Find(id);
                if (donHang == null)
                {
                    return HttpNotFound();
                }
                return View(donHang);
            }
            return RedirectToAction("Index", "Check");

        }

        // POST: Admin/DonHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DonHang donHang = db.DonHangs.Find(id);
            db.DonHangs.Remove(donHang);
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
