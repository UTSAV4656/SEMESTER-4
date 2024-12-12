using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_4
{
    internal class Shape
    {
        public float Area(float x)
        {
            return x * x;
        }
        public double Area(double x, double y)
        {
            return x * y;
        }
        public double Area(double r)
        {
            return Math.PI * r * r;
        }
    }
}
