using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB_2
{
    internal class Candidate
    {
        /*1. Write a program to create a class named Candidate with ID, Name, Age,
        Weight and Height as data members & also create a member functions like
        GetCandidateDetails() and DisplayCandidateDetails().*/

        int ID = 0;
        string Name = string.Empty;
        int Age = 0;
        double Weight = 0.0;
        double Height = 0.0;


        public void GetCandidateDetails()
        {
            Console.WriteLine("Enter Candiate id : ");
            ID = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Candiate name : ");
            Name = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter Candiate Age : ");
            Age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Candiate Weight : ");
            Weight = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Entee Candidate Height : ");
            Height = Convert.ToDouble(Console.ReadLine());
        }

        public void DisplayCandidateDetails()
        {
            Console.WriteLine("ID : "+ID);
            Console.WriteLine("Name : "+Name);
            Console.WriteLine("Age : "+Age);
            Console.WriteLine("Weight : "+Weight);
            Console.WriteLine("Height : "+Height);

        }
    }
}
