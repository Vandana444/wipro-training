using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockExample
{
    [TestFixture]
    class CalculationTest
    {
        [Test]
        public void TestSum()
        {
            Mock<Calculation> mockObject = new Mock<Calculation>();
            mockObject.Setup(x => x.Sum(12, 5)).Returns(17);
            Assert.That(mockObject.Object.Sum(12, 5), Is.EqualTo(17));
        }

        [Test]
        public void TestSub()
        {
            Mock<Calculation> mockObject = new Mock<Calculation>();
            mockObject.Setup(x => x.Sub(12, 5)).Returns(7);
            Assert.That(mockObject.Object.Sub(12, 5), Is.EqualTo(7));
        }

        [Test]
        public void TestMult()
        {
            Mock<Calculation> mockObject = new Mock<Calculation>();
            mockObject.Setup(x => x.Mult(12, 5)).Returns(60);
            Assert.That(mockObject.Object.Mult(12, 5), Is.EqualTo(60));
        }


    }
}
