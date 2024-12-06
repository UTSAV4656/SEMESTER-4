using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Candidate C1 = new Candidate();
            //C1.GetCandidateDetails();
            //C1.DisplayCandidateDetails();

            Staff[] s = new Staff[5];
            for (int i = 0; i < s.Length; i++)
            {
                Console.WriteLine("---------------------------Deatails of " + (i+1) + " Staff---------------------------");
                s[i] = new Staff();
                s[i].GetStaffDetails();
            }
            for (int i = 0; i < s.Length; i++)
            {
                s[i].DisplayStaffDetails();
            }
        }
    }
}
