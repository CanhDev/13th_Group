//------------------------------------------------------------------------------
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
    
    public partial class ItemCart
    {
        public int itemCartID { get; set; }
        public Nullable<int> idSanPham { get; set; }
        public Nullable<int> idGioHang { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<decimal> Gia { get; set; }
        public Nullable<int> idDonHang { get; set; }
    
        public virtual SanPham SanPham { get; set; }
        public virtual GioHang GioHang { get; set; }
        public virtual DonHang DonHang { get; set; }
    }
}