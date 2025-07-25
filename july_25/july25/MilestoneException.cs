using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace july24
{
    internal class MilestoneException: ApplicationException
    {
        public MilestoneException (string error) : base(error) { }
    }
    
    
}
