using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ITraining[] arr = new ITraining[]
            {
                new Vandu(), new Karthi()
            };

            foreach (ITraining i in arr)
            {
                i.Name();
                i.Email();
                Console.WriteLine("---------------------------");
            }
        }
    }
}
