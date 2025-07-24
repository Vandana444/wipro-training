using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CalculationLibrary;

namespace CalculationClient
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Calculation calculation = new Calculation();
            int a, b;
            Console.WriteLine("enter 2 numbers");
            a = Convert.ToInt32(Console.ReadLine());
            b=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("sum is" + calculation.Sum(a, b));
            Console.WriteLine("sub is" + calculation.Sub(a, b));
            Console.WriteLine("sum is" + calculation.Mul(a, b));






        }
    }
}
