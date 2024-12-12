using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_4
{
    internal class Hospital
    {
        public virtual void HospitalDetails(string name, int phone_no)
        {
            Console.WriteLine("\nHospital Name : " + name + "\nHospital phone_no : " + phone_no);
        }
    }
    internal class Apollo : Hospital
    {
        public override void HospitalDetails(string name, int phone_no)
        {
            base.HospitalDetails(name, phone_no);
        }
    }
    internal class Wockhardt : Hospital
    {
        public override void HospitalDetails(string name, int phone_no)
        {
            base.HospitalDetails(name, phone_no);
        }
    }
    internal class Gokul_Superspeciality : Hospital
    {
        public override void HospitalDetails(string name, int phone_no)
        {
            base.HospitalDetails(name, phone_no);
        }
    }
}
