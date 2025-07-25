using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _22julycodes
{
    internal class practice
    {
        static void Main()
        {
            Console.WriteLine("Enter a sentence:");
            string input = Console.ReadLine();

            string[] words = input.Split(' ');

            for (int i = 0; i < words.Length; i++)
            {
                // Reverse alternate words starting from index 1 (odd indices)
                if (i % 2 == 1 && words[i].ToLower() != "dotnet")
                {
                    words[i] = Reverse(words[i]);
                }
            }

            string result = string.Join(" ", words);
            Console.WriteLine("Output: " + result);
        }

        static string Reverse(string word)
        {
            char[] arr = word.ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }
    }
}
