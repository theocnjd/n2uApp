using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace N2UApp.N2UModels
{
    public class Client
    {
        [Key]
        public int Clientid { get; set; }
        public string ClientType { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }

        public IEnumerable<Client> Clients { get; set; }

    }
}