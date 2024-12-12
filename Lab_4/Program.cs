using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program-1

            //AdditionOfTwoNumber add = new AdditionOfTwoNumber();
            //Console.WriteLine("Int : " + add.Addition(2, 3));
            //Console.WriteLine("Float : " + add.Addition(2.3f, 3.6f));

            //Program-2

            //Area ar = new Area();
            //Console.WriteLine("Square : " + ar.CalculateArea(5.5));
            //Console.WriteLine("Reactangle : " + ar.CalculateArea(5.5, 3.2));

            //Program-3

            //RBI r = new RBI();
            //Console.WriteLine("RBI : " + r.calculateInterest(12500, 2.5));

            //HDFC h = new HDFC();
            //Console.WriteLine("HDFC : " + h.calculateInterest(12500, 2.5));

            //SBI s = new SBI();
            //Console.WriteLine("SBI : " + s.calculateInterest(12500, 2.5));

            //ICICI i = new ICICI();
            //Console.WriteLine("ICICI : " + i.calculateInterest(12500, 2.5));

            //Program-4

            //Apollo a = new Apollo();
            //a.HospitalDetails("Apollo", 123456);

            //Wockhardt w = new Wockhardt();
            //w.HospitalDetails("Wockhardt", 678910);

            //Gokul_Superspeciality g = new Gokul_Superspeciality();
            //g.HospitalDetails("Gokul_Superspeciality", 123789);

            //Program-5

            //Shape s = new Shape();
            //Console.WriteLine("Square : " + s.Area(3.2f));
            //Console.WriteLine("Rectangle : " + s.Area(3.2, 4.8));
            //Console.WriteLine("Circle : " + s.Area(5d));

            //Program-6

            BankAccount b1 = new BankAccount("Nikunj Rathod", 33474);

            b1.Deposit(5000);
            b1.Withdraw(6000);
            b1.Deposit(12345, 600);
            b1.Withdraw(78965, 8000);

        }
    }
}
