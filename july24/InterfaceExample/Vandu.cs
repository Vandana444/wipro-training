using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    internal class Vandu: ITraining
    {
        public void Email()
        {
            Console.WriteLine("Email is vandu@gmail.com");
        }

        public void Name()
        {
            Console.WriteLine("Hi Name is vandu...");
        }
    }
}
