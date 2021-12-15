using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Product
{
    public partial class user15Entities
    {
        private static user15Entities _context;

        public static user15Entities GetContext()
        {
            if (_context == null)
                _context = new user15Entities();
            return _context;
        }
    }
}
