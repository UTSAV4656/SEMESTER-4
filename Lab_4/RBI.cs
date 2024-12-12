using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_4
{
    internal class RBI
    {
        public virtual double calculateInterest(double p,double n)
        {
            return p * 2.2 * n / 100;
        }
    }
    internal class HDFC : RBI
    {
        public override double calculateInterest(double p, double n)
        {
            return p * 5.6 * n / 100 ;
        }
    }
    internal class SBI : RBI
    {
        public override double calculateInterest(double p, double n)
        {
            return p * 8.2 * n / 100;
        }
    }
    internal class ICICI : RBI
    {
        public override double calculateInterest(double p, double n)
        {
            return p * 7.6 * n / 100;
        }
    }
}
