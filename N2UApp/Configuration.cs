using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace N2UApp
{
    public class Configuration
    {
        // Get connection to bill checking database.
        public string GetN2UCS()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["New2UkDB_CS"].ConnectionString;
            return connStr;
        }
    }
}