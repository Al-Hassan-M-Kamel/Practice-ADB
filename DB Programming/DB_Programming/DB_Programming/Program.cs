using MySql.Data;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Esf;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;

namespace DB_Programming
{
    public class Employee
    {
        public int emp_id { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public float hourly_pay { get; set; }
        public string job { get; set; }
        public string hire_date { get; set; }
        public int? super_id { get; set; }
    }

    internal class Program
    {
        static MySqlConnection Establish_Connection()
        {
            string connStr = "server=localhost;user=root;database=For_Triggers;port=3306;password=11h2838*56K17";
            MySqlConnection conn = new MySqlConnection(connStr);

            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                return conn;
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("The DB connection can't be established....");
            }

        }

        static void Raw_Insert(string fname, string lname, double hourly_pay, string job, DateTime date, int super_id, MySqlConnection conn)
        {
            Console.WriteLine("Start Insert");
            string sql = $"INSERT INTO Employees (fname, lname, hourly_pay, job, hire_date, super_id) VALUES (@fname, @lname, @hourly_pay, @job, @date, @super_id);";
            
            try
            {


                MySqlCommand cmd = new MySqlCommand(sql, conn);
                string formattedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                cmd.Parameters.AddWithValue("@date", formattedDate);
                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@hourly_pay", hourly_pay);
                cmd.Parameters.AddWithValue("@job", job);
                cmd.Parameters.AddWithValue("@super_id", super_id);
                cmd.ExecuteNonQuery();

                Console.WriteLine("End Insert");

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }
        static void Stored_Procedure_Insert(string fname, string lname, double hourly_pay, string job, DateTime date, int super_id, MySqlConnection conn)
        {
            Console.WriteLine("Start Insert");
            string sql = "INSERT_Emp";
            try
            {


                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string formattedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                cmd.Parameters.AddWithValue("@hire_date", formattedDate);
                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@hourly_pay", hourly_pay);
                cmd.Parameters.AddWithValue("@job", job);
                cmd.Parameters.AddWithValue("@super_id", super_id);
                cmd.ExecuteNonQuery();
                Console.WriteLine("End Insert");

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }


        static void No_Threading(List<Employee> employees, bool procedure_or_not)
        {
            MySqlConnection conn = Establish_Connection();
            if (procedure_or_not)
            {
                foreach (var emp in employees)
                {

                  Stored_Procedure_Insert(emp.fname, emp.lname, emp.hourly_pay, emp.job, DateTime.Parse(emp.hire_date), emp.super_id ?? 0, conn);

                }
            }
            else
            {
                foreach (var emp in employees)
                {

                    Raw_Insert(emp.fname, emp.lname, emp.hourly_pay, emp.job, DateTime.Parse(emp.hire_date), emp.super_id ?? 0, conn);

                }
            }

            conn.Close();
            
        }

        static void With_Threding(List<Employee> employees, bool procedure_or_not)
        {
            List<Thread> threads = new List<Thread>();

            if (procedure_or_not)
            {
                foreach (var emp in employees)
                {

                    Thread thread = new Thread(() =>
                    {
                        MySqlConnection conn = Establish_Connection();
    
                        Stored_Procedure_Insert(emp.fname, emp.lname, emp.hourly_pay, emp.job, DateTime.Parse(emp.hire_date), emp.super_id ?? 0, conn);

                        conn.Close();
                    });
                    threads.Add(thread);
                    thread.Start();
                }

                foreach (var thread in threads)
                {
                    thread.Join();
                }
            }
            else
            {
                foreach (var emp in employees)
                {

                    Thread thread = new Thread(() =>
                    {
                        MySqlConnection conn = Establish_Connection();

                        Raw_Insert(emp.fname, emp.lname, emp.hourly_pay, emp.job, DateTime.Parse(emp.hire_date), emp.super_id ?? 0, conn);

                        conn.Close();
                    });
                    threads.Add(thread);
                    thread.Start();
                }

                foreach (var thread in threads)
                {
                    thread.Join();
                }
            }
        }

        static void Main(string[] args)
        {
            Stopwatch sp = new Stopwatch();
            
            Console.WriteLine("Reading Data...");
            sp.Start();

            string filePath = "I:\\My Study\\Data Science\\DataBase\\Advanced Db\\Practice\\DB Programming\\employees_1000.json";
            string jsonString = File.ReadAllText(filePath);

            List<Employee> employees = JsonSerializer.Deserialize<List<Employee>>(jsonString);

            sp.Stop();

            Console.WriteLine($"Reading fininshed in {sp.Elapsed.TotalSeconds} second(s)...");

            sp.Reset();
            sp.Start();

            
            With_Threding(employees, false);
            


            sp.Stop();

            Console.WriteLine($"The function main ends in {sp.Elapsed.TotalSeconds} second(s)");
            

        }
    }
}
