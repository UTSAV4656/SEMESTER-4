using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB_2
{
    internal class Staff
    {
        /*2. Write a program to create a class Staff having data members as Name,
        Department, Designation, Experience & Salary.Accept this data for 5
        different staffs and display only names & salary of those staff who are
        HOD.*/

        string Name = string.Empty;
        string Department = string.Empty;
        string Designation = string.Empty;
        int Experience = 0;
        int Salary = 0;

        public void GetStaffDetails()
        {
            Console.WriteLine("Enter Staff name : ");
            Name = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter Staff Department : ");
            Department = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter Staff Designation : ");
            Designation = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter Staff Experience in year : ");
            Experience = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Staff Salary : ");
            Salary = Convert.ToInt32(Console.ReadLine());
        }

        public void DisplayStaffDetails()
        {
            if (Designation.ToUpper() == "HOD")
            {
                Console.WriteLine("Name : " + Name);
                Console.WriteLine("Salary : " + Salary);
            }
        }
    }
}
