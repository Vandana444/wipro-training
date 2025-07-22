using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _21julycodes
{
    internal class StrMethods
    {
        static void Main()
        {
            string str = "welcome to dotnet programming.. from wipro";
            Console.WriteLine("length of string is"+str.Length);
            Console.WriteLine("lower case string " + str.ToLower());
            Console.WriteLine("upper case string " + str.ToUpper());
            Console.WriteLine("first occurance of chat'o'"+ str.IndexOf("o"));
            Console.WriteLine("replaced string" + str.Replace("dotnet","dotnet core"));
            string s1 = "sunil", s2 = "sreeja", s3 = "sunil";
            Console.WriteLine(s1.Equals(s2));
            Console.WriteLine(s1.Equals(s3));
            Console.WriteLine(s1.CompareTo(s2));
            Console.WriteLine(s2.CompareTo(s1));
        }
    }
}
