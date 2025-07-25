using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Fact2
    {
        public void show(int f)
        {
            int i = 1;
            while (i <= f){
                if (f % i == 0)
                {
                    Console.WriteLine(i);
                    
                }
                i++;
      
            }
        }
        static void Main()
        {
            int f;
            Console.WriteLine("enter value:");
            f = Convert.ToInt32(Console.ReadLine());
            Fact2 fact = new Fact2();
            fact.show(f);
        }
    }
}
