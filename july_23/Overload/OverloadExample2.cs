﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Overload
{
    internal class OverloadExample2
    {
        public int Sum()
        {
            return 5;
        }

        public int Sum(int x)
        {
            return x + 5;
        }

        public int Sum(int x, int y)
        {
            return x + y;
        }
        static void Main()
        {
            OverloadExample2 obj = new OverloadExample2();
            Console.WriteLine("Sum w.r.t. Zero Args  " + obj.Sum());
            Console.WriteLine("Sum w.r.t. One Arg   " + obj.Sum(52));
            Console.WriteLine("Sum w.r.t. Two Args  " + obj.Sum(88, 55));
        }
    }
}
