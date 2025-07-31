using CoreDemo.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net;
using System.Xml.Linq;

namespace CoreDemo.Pages
{
    public class EmployeeShowModel : PageModel
    {
        public List<Employee>? Employees { get; set; }
        public void OnGet()
        {
            Employees = new List<Employee>
            {
                new Employee{Empno=1,Name="Vandu",Basic=85399 },
                new Employee{Empno=2,Name="Vaishu",Basic=92456 },
                new Employee{Empno=3,Name="Karthi",Basic=76589 }
            };

            
        }
    }
}
