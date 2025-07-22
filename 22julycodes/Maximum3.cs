using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Maximum3
    {
        public void Show(int a, int b, int c)
        {
            //if (a > b && a > c)
            //{
            //    Console.WriteLine("Max is " +a);
            //}
            //else if (b >= c)
            //{
            //    Console.WriteLine("Max is " +b);
            //} else
            //{
            //    Console.WriteLine("Max is " +c);
            //}
            int m = a;
            if (m < b)
            {
                m = b;
            }
            if (m < c)
            {
                m = c;
            }
            Console.WriteLine("Max Value  " + m);
        }
        static void Main()
        {
            int a, b, c;
            Console.WriteLine("Enter 3 Numbers  ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            c = Convert.ToInt32(Console.ReadLine());
            Maximum3 maximum3 = new Maximum3();
            maximum3.Show(a, b, c);
        }
    }
}
