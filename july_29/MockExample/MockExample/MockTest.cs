using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockExample
{
    public class MockTest
    {
        [Test]
        public void TestMileStone1()
        {
            Mock<IwiproData> mock = new Mock<IwiproData>();
            mock.Setup(x => x.MilestoneExam1()).Returns("MileStone Exam 1 on Aug 1...");
            Assert.That(mock.Object.MilestoneExam1(), Is.EqualTo("MileStone Exam 1 on Aug 1..."));

        }

        [Test]
        public void TestMileStone2()
        {
            Mock<IwiproData> mock = new Mock<IwiproData>();
            mock.Setup(x => x.MileStoneExam2()).Returns("MileStone Exam 2 On Aug 10...");
            Assert.That(mock.Object.MileStoneExam2(), Is.EqualTo("MileStone Exam 2 On Aug 10..."));
        }
    }
}
