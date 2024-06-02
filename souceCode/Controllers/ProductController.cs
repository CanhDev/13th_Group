using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Web.UI.WebControls.Expressions;
using System.Web.Routing;
using System.IO;
using Team_13st.Models;
using Microsoft.Ajax.Utilities;
using System.Data.SqlClient;
using System.Net;

namespace Team_13st.Controllers
{
    public class ProductController : Controller
    {
        private static RUOUEntities1 db = new RUOUEntities1();
        public ActionResult Index(int? page, string sortOrder)
        {
            IQueryable<SanPham> products = db.SanPhams;
            // Sắp xếp sản phẩm
            products = SortProducts(products, sortOrder);

            // Hiển thị trang chính
            int pageSize = 9;
            int pageNumber = (page ?? 1);

            if (string.IsNullOrEmpty(ViewBag.page))
            {
                ViewBag.page = "getProducts";
            }
            return View(products.ToPagedList(pageNumber, pageSize));

        }
        [Route("shop/Category/{id?}")]
        public ActionResult getProductsById(string id, int? page, string sortOrder, string searchString)
        {
            IQueryable<SanPham> products = db.SanPhams;

            // lọc theo loại sản phẩm
            products = products.Where(c => c.CatalogyID == id).OrderBy(c => c.Price);

            // Lọc sản phẩm
            products = FilterProducts(products, searchString);

            // Sắp xếp sản phẩm
            products = SortProducts(products, sortOrder);

            // Hiển thị trang chính
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (products.Count() <= 0)
            {
                ViewBag.notify = "Không có sản phẩm nào phù hợp";
            }
            else
            {
                ViewBag.notify = "";
            }
            ViewBag.sub = db.LoaiSanPhams.Where(c => c.CatalogyID == id).SingleOrDefault().CatalogyName;

            ViewBag.id = id;
            ViewBag.page = "getProductsById";
            return View(products.ToPagedList(pageNumber, pageSize));
        }
        public PartialViewResult getProducts(int? page, string sortOrder, string searchString, string id)
        {
            IQueryable<SanPham> products = db.SanPhams;
            // lọc theo loại sản phẩm

            if (!string.IsNullOrEmpty(id))
            {
                // lọc theo loại sản phẩm
                products = products.Where(c => c.CatalogyID == id).OrderBy(c => c.Price);
                ViewBag.id = id;
            }
            // Lọc sản phẩm
            products = FilterProducts(products, searchString);

            // Sắp xếp sản phẩm
            products = SortProducts(products, sortOrder);

            // Hiển thị trang chính
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            if (products.Count() <= 0)
            {
                ViewBag.notify = "Không có sản phẩm nào phù hợp";
            }
            else
            {
                ViewBag.notify = "";
            }
            ViewBag.page = "getProducts";
            return PartialView("ListProducts", products.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult subCategory()
        {
            return PartialView(db.LoaiSanPhams.ToList());
        }
        public ActionResult subCategory2()
        {
            return PartialView(db.LoaiSanPhams.ToList());
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
        private IQueryable<SanPham> SortProducts(IQueryable<SanPham> products, string sortOrder)
        {
            // Thiết lập giá trị mặc định cho sortOrder nếu nó là null hoặc trống
            if (string.IsNullOrEmpty(sortOrder))
            {
                sortOrder = "gia_tang";
            }

            switch (sortOrder)
            {
                case "gia_desc":
                    products = products.OrderByDescending(s => s.Price);
                    break;
                case "gia_tang":
                    products = products.OrderBy(s => s.Price);
                    break;
                default: // Nếu sortOrder không phù hợp với bất kỳ giá trị nào khác, sẽ sắp xếp theo giá tăng dần
                    products = products.OrderBy(s => s.Price);
                    break;
            }

            ViewBag.sortString = sortOrder;
            ViewBag.giaGiam = "gia_desc";
            ViewBag.giaTang = "gia_tang";

            return products;
        }
        public ActionResult Detail(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sp = db.SanPhams.Find(id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        public ActionResult test()
        {
            LoaiSanPham vangdo = db.LoaiSanPhams.FirstOrDefault();
            List<SanPham> sanPhams = new List<SanPham>();
            sanPhams = vangdo.SanPhams.ToList();
            return View(sanPhams);
        }
        
    }
}