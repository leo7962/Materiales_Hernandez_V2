//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Materiales_Hernandez_V2.Services.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Factura : Comprobante
    {
        public int NroFactura { get; set; }
        public double Subtotal { get; set; }
        public System.DateTime Fecha_Cancelacion { get; set; }
    }
}
