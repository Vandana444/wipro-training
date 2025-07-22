using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _21julycodes
{
    internal class Unary
    {
        static void Main()
        {
            int x = 12;
            Console.WriteLine(x++);  //post increment 12
            Console.WriteLine(++x);  //pre increment  14
            int y = x++ + ++x;    // actual 14 + 16 =30
            Console.WriteLine(y);  //memory 15

        }
    }
}
