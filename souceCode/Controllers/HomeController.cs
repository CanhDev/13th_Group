using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Team_13st.Models;

namespace Team_13st.Controllers
{
    public class HomeController : Controller
    {
        private RUOUEntities1 db = new RUOUEntities1();
        // GET: Home
        public ActionResult Index()
        {
            // những sản phẩm gần đây in view
            List<SanPham> query_8sp = db.SanPhams.Take(8).ToList();
            
            // được mua nhiều nhất in view
            var query_bestSeller = (from sp in db.SanPhams
                         orderby sp.Price descending
                         select sp).Take(8).ToList();
            ViewBag.BestSeller = query_bestSeller;

            return View(query_8sp);
        }
    }
}