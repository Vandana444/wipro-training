﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClsReflectionExample1
{
    internal class Student
    {
        public string name;
        public string basic;
        public int empno;

        public void ReadEmploy()
        {
            Console.WriteLine("From ReadEmploy Method...");
        }

        public void WriteEmploy()
        {
            Console.WriteLine("From WriteEmploy Method...");
        }
    }
}
