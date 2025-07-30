using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace NUnitDemo.Tests
{
    [TestFixture]
    internal class EmployTest
    {
        [Test]
        public void TestSearchEmploy()
        {
            EmployDao employDao = new EmployDao();
            Employ employFound = employDao.SearchEmploy(1);
            Assert.That(employFound, Is.Not.Null);

            employFound = employDao.SearchEmploy(-1);
            Assert.That(employFound, Is.Null);
        }

        [Test]
        public void TestShowEmploy()
        {
            List<Employ> employList = new EmployDao().ShowEmploy();
            Assert.That(employList.Count, Is.EqualTo(4));
        }

        [Test]
        public void TestToString()
        {
            Employ employ = new Employ
            {
                Empno = 1,
                Name = "Girish",
                Basic = 99422
            };

            string expected = "Empno 1 Name Girish Basic 99422";
            Assert.That(employ.ToString(), Is.EqualTo(expected));
        }

        [Test]
        public void TestGettersAndSetters()
        {
            Employ employ = new Employ
            {
                Empno = 10,
                Name = "Rajesh",
                Basic = 88321
            };

            Assert.That(employ.Empno, Is.EqualTo(10));
            Assert.That(employ.Name, Is.EqualTo("Rajesh"));
            Assert.That(employ.Basic, Is.EqualTo(88321));
        }

        [Test]
        public void TestConstructor()
        {
            Employ employ = new Employ();
            Assert.That(employ, Is.Not.Null);

            Employ employ1 = new Employ(88, "Venkata", 99923);
            Assert.That(employ1.Empno, Is.EqualTo(88));
            Assert.That(employ1.Name, Is.EqualTo("Venkata"));
            Assert.That(employ1.Basic, Is.EqualTo(99923));
        }
    }
}
