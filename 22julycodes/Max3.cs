using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Max3
    {
        public void show(int a, int b, int c)
        {
            if (a >= b && a >= c)
            {
                Console.WriteLine("max is " + a);

            }
            else if (b >= c)
            {
                Console.WriteLine("max is" + b);
            }
            else
            {
                Console.WriteLine("max is" + c);
            }
        }
        static void Main()
        {
            int a, b, c;
            Console.WriteLine("enter 3 values");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            c = Convert.ToInt32(Console.ReadLine());
            Max3 max = new Max3();
            max.show(a, b, c);
        }
    }
}
