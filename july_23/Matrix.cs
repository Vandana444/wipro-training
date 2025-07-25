
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace july23
{
    internal class Matrix
    {
        static void Main()
        {
            int[,] x = new int[2, 3]
            {
                {1, 2, 3},
                {5,2,8 }
            };

            for (int i = 0; i < x.GetLength(0); i++)
            {
                for (int j = 0; j < x.GetLength(1); j++)
                {
                    Console.Write(x[i, j] + "  ");
                }
                Console.WriteLine();
            }
        }
    }
}