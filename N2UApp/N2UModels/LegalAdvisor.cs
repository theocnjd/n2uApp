using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace N2UApp.N2UModels
{
    public class LegalAdvisor
    {
        [Key]
        public int RegisteredBusinessName { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
    }
}