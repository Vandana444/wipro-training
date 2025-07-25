using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Fctor
    {
        public void show(int f)
        {

            for (int i = 1; i <= f; i++)
            {


                if (f % i == 0)
                {
                    Console.WriteLine("factors are: " + i);
                }

            }
        }
        static void Main()
        {
            int f;
            Console.WriteLine("enter the f value:");
            f = Convert.ToInt32(Console.ReadLine());
            Fctor fct = new Fctor();
            fct.show(f);

        }
    }
}
