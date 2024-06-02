using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;
using PagedList;

namespace Team_13st.Areas.Admin.Controllers
{
    public class SanPhamsController : Controller
    {
        private RUOUEntities1 db = new RUOUEntities1();
        // GET: Admin/SanPhams
        public ActionResult Index(string searchString, int? page)
        {
            if(checkQuyen() == true)
            {
                IQueryable<SanPham> sanPhams = db.SanPhams.Include(s => s.LoaiSanPham).Include(s => s.NhaSanXuat);
                sanPhams = sanPhams.OrderBy(p => p.ProductID);
                //
                if (!string.IsNullOrEmpty(searchString))
                {
                    sanPhams = FilterProducts(sanPhams, searchString);
                    ViewBag.SearchString = searchString;
                }
                else
                {
                    ViewBag.SearchString = "";
                }
                //
                if (sanPhams.Count() <= 0)
                {
                    ViewBag.notify = "Không có sản phẩm nào phù hợp";
                }
                else
                {
                    ViewBag.notify = "";
                }
                int pageSize = 10;
                int pageNumber = (page ?? 1);
                return View(sanPhams.ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("Index", "Check");
        }
        private IQueryable<SanPham> FilterProducts(IQueryable<SanPham> products, string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.ProductName.Contains(searchString));
            }
            ViewBag.searchString = searchString ?? "";
            return products;
        }
        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(int? id)
        {

            if(checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                SanPham sanPham = db.SanPhams.Find(id);
                if (sanPham == null)
                {
                    return HttpNotFound();
                }
                return View(sanPham);
            }
            else
            {
                return RedirectToAction("Index", "Check");
            }
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            if (checkQuyen() == true)
            {
                ViewBag.CatalogyID = new SelectList(db.LoaiSanPhams, "CatalogyID", "CatalogyName");
                ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat");
                return View();
            }
            return RedirectToAction("Index", "Check");

        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,Description,PurchasePrice,Price,Quantity,Vintage,CatalogyID,Image,Region,MaNhaSanXuat")] SanPham sanPham)
        {
            if (checkQuyen() == true)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        var imageFile = Request.Files["Image"];
                        if (imageFile != null && imageFile.ContentLength > 0)
                        {
                            string fileName = Path.GetFileName(imageFile.FileName);
                            string path = Path.Combine(Server.MapPath("~/Images/Ruou/"), fileName);
                            imageFile.SaveAs(path);
                            sanPham.Image = fileName;
                        }
                        db.SanPhams.Add(sanPham);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }

                    ViewBag.CatalogyID = new SelectList(db.LoaiSanPhams, "CatalogyID", "CatalogyName", sanPham.CatalogyID);
                    ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
                    return View(sanPham);
                }
                catch
                {
                    ModelState.AddModelError(string.Empty, "Đã xảy ra lỗi khi tạo sản phẩm. Vui lòng thử lại sau.");
                    return View(sanPham);
                }
            }
            return RedirectToAction("Index", "Check");
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                SanPham sanPham = db.SanPhams.Find(id);
                if (sanPham == null)
                {
                    return HttpNotFound();
                }
                ViewBag.CatalogyID = new SelectList(db.LoaiSanPhams, "CatalogyID", "CatalogyName", sanPham.CatalogyID);
                ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
                return View(sanPham);
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,Description,PurchasePrice,Price,Quantity,Vintage,CatalogyID,Image,Region,MaNhaSanXuat")] SanPham sanPham)
        {
            if (checkQuyen() == true)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        var f = Request.Files["imgEdit"];
                        if (f != null && f.ContentLength > 0)
                        {
                            string fileName = System.IO.Path.GetFileName(f.FileName);
                            string path = Server.MapPath("~/images/Ruou/" + fileName);
                            f.SaveAs(path);
                            sanPham.Image = fileName;
                        }
                        db.Entry(sanPham).State = EntityState.Modified;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.CatalogyID = new SelectList(db.LoaiSanPhams, "CatalogyID", "CatalogyName", sanPham.CatalogyID);
                        ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
                        return View(sanPham);
                    }
                }
                catch
                {
                    ModelState.AddModelError(string.Empty, "Đã xảy ra lỗi khi sửa sản phẩm. Vui lòng thử lại sau.");
                    return View(sanPham);
                }
            }
            return RedirectToAction("Index", "Check");
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (checkQuyen() == true)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                SanPham sanPham = db.SanPhams.Find(id);
                if (sanPham == null)
                {
                    return HttpNotFound();
                }
                return View(sanPham);
            }
            return RedirectToAction("Index", "Check");
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (checkQuyen() == true)
            {
                SanPham sanPham = db.SanPhams.Find(id);
                db.SanPhams.Remove(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index", "Check");
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
