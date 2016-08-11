﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog_Entity.Model
{
    public class UserCredentials
    {
        [Key]
        public int UserID { get; set; }

        public string Login { get; set; }

        public string Password { get; set; }
        
        public User User { get; set; }
    }
}