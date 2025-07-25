using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class Milestone1
    {
        public void show(string s)
        {
            s = s.ToLower();
            int Count = 0;
            char[] c = s.ToCharArray();
            foreach (char i in c)
            {
                if (i == 'a'||i == 'e'||i == 'i'||i == 'o'||i == 'u')
                {
                    Count = Count + 1;

                }
            }
            Console.WriteLine(Count);
        }
        static void Main()
        {
            string s;
            Console.WriteLine("enter the string");
            s = Console.ReadLine();
            Milestone1 vowel = new Milestone1();
            vowel.show(s);
        }
    }
}
