using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace NUnitDemo.Tests
{
    [TestFixture]
    public class DemoTest
    {
        [Test]
        public void TestSum()
        {
            Demo demo = new Demo();
            Assert.That(demo.Sum(2, 3), Is.EqualTo(5));
            
        }
        [Test]
        public void TestSayHello()
        {
            Demo demo = new Demo();
            Assert.That(demo.SayHello(), Is.EqualTo("Welcome to C# FSD Programming..."));

        }

        [Test]
        public void TestEvenOdd()
        {
            Demo demo = new Demo();
            Assert.True(demo.EvenOdd(4));
            Assert.False(demo.EvenOdd(5));
        }

        [Test]
        public void TestNullCheck()
        {
            Demo demo = new Demo();
            Assert.IsNotNull(demo);
            Demo demo1 = null;
            Assert.IsNull(demo1);
        }
        [Test]
        public void TestMax3()
        {
            Demo demo = new Demo();
            Assert.That(demo.Max3(7, 3, 2), Is.EqualTo(7));
            Assert.That(demo.Max3(3, 7, 2), Is.EqualTo(7));
            Assert.That(demo.Max3(2, 3, 7), Is.EqualTo(7));

        }
    }
}
