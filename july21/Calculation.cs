using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _21julycodes
{
    internal class Calculation
    {
        static void Main()
        {
            int a, b, c;
            Console.WriteLine("enter 2 numbers : ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32((Console.ReadLine()));
            c = a + b;
            Console.WriteLine("sum is" + c);
            c = a - b;
            Console.WriteLine("sub is" + c);
            c = a * b;
            Console.WriteLine( "mult is " +c);

        }
    }
}
