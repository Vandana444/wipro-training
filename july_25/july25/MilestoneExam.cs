using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace july24
{
    internal class MilestoneExam
    {
        static void ShowMileStoneInfo(string examCode)
        {
            if (examCode.Equals("M1"))
            {
                throw new MilestoneException("MileStone1 Contains Core Concepts of .NET");
            }
            else if (examCode.Equals("M2"))
            {
                throw new MilestoneException("MileStone2 Contains Asp.net Rajor Core Concepts...");
            }
            else if (examCode.Equals("M3"))
            {
                throw new MilestoneException("MileStone3 Contains Advanced Core Concepts with Db...");
            }
            else if (examCode.Equals("M4"))
            {
                throw new MilestoneException("MileStone4 Contains Advanced React Framework  ");
            }
            else if (examCode.Equals("Project"))
            {
                throw new MilestoneException("Project Capstone to be Done Last...");
            }
            else
            {
                throw new MilestoneException("No Error Occurred...");
            }
        }
        static void Main()
        {
            string examCode;
            Console.WriteLine("Enter Exam Code (M1, M2, M3, M4, Project)  ");
            examCode = Console.ReadLine();
            try
            {
                ShowMileStoneInfo(examCode);
            }
            catch (MilestoneException e) when (e.Message.Contains("MileStone1"))
            {
                Console.WriteLine(e.Message);
            }
            catch (MilestoneException e) when (e.Message.Contains("MileStone2"))
            {
                Console.WriteLine(e.Message);
            }
            catch (MilestoneException e) when (e.Message.Contains("MileStone3"))
            {
                Console.WriteLine(e.Message);
            }
            catch (MilestoneException e) when (e.Message.Contains("MileStone4"))
            {
                Console.WriteLine(e.Message);
            }
            catch (MilestoneException e) when (e.Message.Contains("Project"))
            {
                Console.WriteLine(e.Message);
            }

            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
