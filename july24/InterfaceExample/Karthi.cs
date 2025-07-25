using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    internal class Karthi:ITraining
    {
        public void Email()
        {
            Console.WriteLine("Email is karthi@gmail.com");
        }

        public void Name()
        {
            Console.WriteLine("Name is karthi...");
        }
    }
}
