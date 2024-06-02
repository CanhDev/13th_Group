﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Team_13st.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;

    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.DonHangs = new HashSet<DonHang>();
            this.ItemCarts = new HashSet<ItemCart>();
        }
    
        public int ProductID { get; set; }
        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }
        [DisplayName("Loại sản phẩm")]
        public string Description { get; set; }
        [DisplayName("Giá mua")]
        public decimal PurchasePrice { get; set; }
        [DisplayName("Giá bán")]
        public decimal Price { get; set; }
        [DisplayName("Số lượng")]
        public int Quantity { get; set; }
        [DisplayName("Xuất xứ")]
        public string Vintage { get; set; }
        [DisplayName("Loại sản phẩm")]
        public string CatalogyID { get; set; }
        [DisplayName("Hình ảnh")]
        public string Image { get; set; }
        [DisplayName("Vùng")]
        public string Region { get; set; }
        public Nullable<int> MaNhaSanXuat { get; set; }
    
        public virtual LoaiSanPham LoaiSanPham { get; set; }
        public virtual NhaSanXuat NhaSanXuat { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ItemCart> ItemCarts { get; set; }
    }
}
