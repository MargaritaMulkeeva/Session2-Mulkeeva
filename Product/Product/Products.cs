//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Product
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.ProductMaterial = new HashSet<ProductMaterial>();
        }
    
        public long ID { get; set; }
        public string NameOfProduct { get; set; }
        public Nullable<int> Article { get; set; }
        public Nullable<decimal> MinPrice { get; set; }
        public string Logo { get; set; }
        public Nullable<long> IDtypeOfProduct { get; set; }
        public Nullable<int> CountPeople { get; set; }
        public Nullable<int> NumberCex { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMaterial> ProductMaterial { get; set; }
        public virtual TypeOfProduct TypeOfProduct { get; set; }
    }
}