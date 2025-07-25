using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Milestone2
    {
        public void show(string s)
        {
            string[] d = s.Split(' ');
            foreach(string i in d)
            {
                Console.WriteLine(i);
            }
        }
        static void Main()
        {
            string s;
            Console.WriteLine("enter s");
            s = Console.ReadLine();
            Milestone2 milestone = new Milestone2();
            milestone.show(s);
        }
    }
}
