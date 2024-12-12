using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;

namespace Lab_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program 1

            //Console.WriteLine("Name : Utsav Boghani");
            //Console.WriteLine("Address : Gokuldham Society");
            //Console.WriteLine("Contact No. : 6786387498");
            //Console.WriteLine("City : Rajkot");

            //Program 2

            //Console.Write("Enter First Number : ");
            //int number1 = Convert.ToInt32(Console.ReadLine());
            //int a = int.Parse(Console.ReadLine());

            //Console.Write("Enter Second Number : ");
            //int number2 = Convert.ToInt32(Console.ReadLine());

            //Console.WriteLine("First Number : " + number1);
            //Console.WriteLine("Second Number : " + number2);

            //Program 3

            //Console.Write("Enter Your Name : ");
            //String name = Console.ReadLine();

            //Console.Write("Enter your Country : ");
            //String country = Console.ReadLine();

            //Console.WriteLine("Hello " + name + " from country " + country);


            //Program 4

            //Console.Write("Enter Length In Feet : ");
            //int length = int.Parse(Console.ReadLine());

            //Console.Write("Enter Width In Feet : ");
            //int width = int.Parse(Console.ReadLine());

            //Console.WriteLine("Area Is : " + ((length*length) + (width*width)) + " sq. feets");


            //Program 5

            //Console.Write("Enter 1 For Square \nEnter 2 For Rectangle \nEnter 3 For Circle : ");
            //int n = int.Parse(Console.ReadLine());

            //switch (n)
            //{
            //    case 1:
            //        Console.Write("Enter Length : ");
            //        int length = int.Parse(Console.ReadLine());
            //        Console.WriteLine("Square Area Is : " + (length * length));
            //        break;

            //    case 2:
            //        Console.Write("Enter Height : ");
            //        int height = int.Parse(Console.ReadLine());
            //        Console.Write("Enter Width : ");
            //        int width = int.Parse(Console.ReadLine());
            //        Console.WriteLine("Rectangle Area Is : " + (height * width));
            //        break;

            //    case 3:
            //        Console.Write("Enter Radius : ");
            //        int radius = int.Parse(Console.ReadLine());
            //        Console.WriteLine("Circle Area Is : " + (3.14 * radius * radius));
            //        break;

            //    default:
            //        Console.WriteLine("\n\nEnter Valid Number\n");
            //        break;
            //}


            //Program 6

            //Console.Write("Enter 1 For Convert Into Fahrenheit \nEnter 2 For Covert Into Celsius : ");
            //int n = int.Parse(Console.ReadLine());

            //switch (n)
            //{
            //    case 1:
            //        Console.Write("Enter Celsius : ");
            //        double celsius = Double.Parse(Console.ReadLine());
            //        Console.WriteLine(Fahrenheit(celsius));
            //        break;

            //    case 2:
            //        Console.Write("Enter Fahrenheit : ");
            //        double fahrenheit = Double.Parse(Console.ReadLine());
            //        Console.WriteLine(Celsuis(fahrenheit));
            //        break;
            //}


            //Program 7

            //Console.Write("Enter Principal : ");
            //float p = float.Parse(Console.ReadLine());

            //Console.Write("Enter Rate : ");
            //float r = float.Parse(Console.ReadLine());

            //Console.Write("Enter Time : ");
            //float t = float.Parse(Console.ReadLine());

            //Console.WriteLine("\nSimple Interest Is : " + ((p * r * t) / 100));


            //Program 8

            //Console.WriteLine("Choose an operation:");
            //Console.WriteLine("1. Addition");
            //Console.WriteLine("2. Subtraction");
            //Console.WriteLine("3. Multiplication");
            //Console.WriteLine("4. Division");

            //Console.Write("Enter your choice : ");
            //int choice = int.Parse(Console.ReadLine());

            //Console.Write("Enter First Number: ");
            //double num1 = double.Parse(Console.ReadLine());

            //Console.Write("Enter Second Number: ");
            //double num2 = double.Parse(Console.ReadLine());

            //// Using if...else
            //if (choice == 1)
            //{
            //    Console.WriteLine($"(Using if...else): {num1} + {num2} = {num1 + num2}");
            //}
            //else if (choice == 2)
            //{
            //    Console.WriteLine($"(Using if...else): {num1} - {num2} = {num1 - num2}");
            //}
            //else if (choice == 3)
            //{
            //    Console.WriteLine($"(Using if...else): {num1} * {num2} = {num1 * num2}");
            //}
            //else if (choice == 4)
            //{
            //    if (num2 != 0)
            //        Console.WriteLine($"(Using if...else): {num1} / {num2} = {num1 / num2}");
            //    else
            //        Console.WriteLine("Error: Division by zero is not allowed!");
            //}
            //else
            //{
            //    Console.WriteLine("Invalid choice! Please choose between 1 and 4.");
            //}

            //// Using switch case
            //switch (choice)
            //{
            //    case 1:
            //        Console.WriteLine($"(Using switch): {num1} + {num2} = {num1 + num2}");
            //        break;
            //    case 2:
            //        Console.WriteLine($"(Using switch): {num1} - {num2} = {num1 - num2}");
            //        break;
            //    case 3:
            //        Console.WriteLine($"(Using switch): {num1} * {num2} = {num1 * num2}");
            //        break;
            //    case 4:
            //        if (num2 != 0)
            //            Console.WriteLine($"(Using switch): {num1} / {num2} = {num1 / num2}");
            //        else
            //            Console.WriteLine("Error: Division by zero is not allowed!");
            //        break;
            //    default:
            //        Console.WriteLine("Invalid choice! Please choose between 1 and 4.");
            //        break;
            //}


            //Program 9

            //Console.Write("Enter First Number : ");
            //int number1 = int.Parse(Console.ReadLine());

            //Console.Write("Enter Second Number : ");
            //int number2 = int.Parse(Console.ReadLine());

            //number1 = number1 + number2;
            //number2 = number1 - number2;
            //number1 = number1 - number2;

            //Console.WriteLine("After Swapping");

            //Console.WriteLine("First Number : " + number1);
            //Console.WriteLine("Second Number : " + number2);



            //Program 10

            //Console.Write("Enter First Number : ");
            //int a = int.Parse(Console.ReadLine());

            //Console.Write("Enter Second Number : ");
            //int b = int.Parse(Console.ReadLine());

            //Console.Write("Enter Third Number : ");
            //int c = int.Parse(Console.ReadLine());

            //int max = (a > b) ? (a > c ? a : c) : (b > c ? b : c);

            //Console.WriteLine("\nMaximum Number Is : " + max);

        }
        static double Fahrenheit(double celsius)
        {
            return (celsius * 9 / 5) + 32;
        }

        static double Celsuis(double fahrenheit)
        {
            return (fahrenheit - 32) * (5 / 9);
        }
    }
}