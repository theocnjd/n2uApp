using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace N2UApp.N2UModels
{
    public class AlertInfo
    {
        public string Email { get; set; }
        public int TotalAction { get; set; }
        public int UserTypeid { get; set; }

        IEnumerable<AlertInfo> alertInfos;

    }
}