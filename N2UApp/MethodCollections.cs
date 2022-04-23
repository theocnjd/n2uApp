using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using Dapper;
using N2UApp.Models;
using N2UApp.N2UModels;

namespace N2UApp
{
    public class MethodCollections
    {
        // Get the connection string to the db.
        readonly string n2u_connStr = new Configuration().GetN2UCS();

        // update db with user type id of the current user 
        public void UpdateUser(int usertype, string email)
        {
            string updatecode = "UPDATE AspNetUsers SET UserType = " + usertype + " WHERE Email = '" + email + "'";
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(updatecode, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        // Retrieve user type id of the current user 
        public Int32 GetUserType(string email)
        {
            Int32 returnValue;
            string sqlcode = "SELECT UserType FROM AspNetUsers WHERE Email = '" + email + "'";         
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = Convert.ToInt32(cmd.ExecuteScalar());
                cn.Close();
            }
            return returnValue;
        }

        // Retrieve user type id of the current user 
        public string GetAdminEmail()
        {
            string returnValue;
            string sqlcode = "SELECT TOP(1) ISNULL(Email, 'testingapp@nikdamconsulting.co.uk') FROM AspNetUsers WHERE UserType = 1";
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public string GetLogonEmail(string name)
        {
            string returnValue;
            string sqlcode = "SELECT Email FROM AspNetUsers WHERE UserName = '" + name + "'";
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public void LinkClientWithAdvisorAddress(Int32 clientid, Int32 addressid, string requiredservice)
        {
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {

                SqlCommand cmd = new SqlCommand("usp_InsertLinkClientWithAdvisorAddress", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Clientid", clientid);
                cmd.Parameters.AddWithValue("@Addressid", addressid);
                cmd.Parameters.AddWithValue("@RequiredService", requiredservice);
                 cmd.CommandTimeout = 60;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
        public void CreateClient(string email)
        {
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {

                SqlCommand cmd = new SqlCommand("usp_InsertClient", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                //cmd.Parameters.AddWithValue("@ClientTypeid", clienttype);
                //cmd.Parameters.AddWithValue("@FirstName", fname);
                //cmd.Parameters.AddWithValue("@LastName", lname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.CommandTimeout = 60;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        public string CreateAdvisor(string RegisteredBusinessName, string email, string website, int regulatoryAuthorityid)
        {
            string rtnValue = string.Empty;
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {

                SqlCommand cmd = new SqlCommand("usp_InsertLegalAdvisor", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@RegisteredBusinessName", RegisteredBusinessName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Website", website);
                cmd.Parameters.AddWithValue("@RegulatoryAuthorityid", regulatoryAuthorityid);
              
                cmd.CommandTimeout = 60;
                cn.Open();
                rtnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return rtnValue;
        }

        public DataTable GetClientByEmail(string email)
        {
            DataTable tblClient = new DataTable();
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand("usp_GetClient", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Email", email);
                cn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    tblClient.Columns.Add("Clientid");
                    tblClient.Columns.Add("ClientTypeid");
                    tblClient.Columns.Add("Title");
                    tblClient.Columns.Add("FirstName");
                    tblClient.Columns.Add("LastName");
                    tblClient.Columns.Add("Gender");
                    tblClient.Columns.Add("Telephone");
                    tblClient.Columns.Add("Email");
                    tblClient.Load(reader);
                };
                
                cn.Close();
            }    
            return tblClient;
        }

        public DataTable GetAddress()
        {
            DataTable dataTable = new DataTable();
            string getadd = "SELECT Addressid, Postcode FROM [tcAddress] WHERE (NULLIF(Latitude,' ') IS NULL OR NULLIF(Longitude, ' ') IS NULL)";
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(getadd, cn);
                cn.Open();
                var returnValue = cmd.ExecuteReader();
                
                dataTable.Load(returnValue);
                cn.Close();
            }
            return dataTable;
        }

        public void UpdateAddressLatAndLon(string addressid, string lat, string log)
        {
            string editadd = "UPDATE [tcAddress] SET Latitude = '" + lat + "', Longitude = '" + log + "' WHERE Addressid = " + addressid;
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand(editadd, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
        
            }
        }

        public string GetGeoCode(string postcode)
        {
            string uri = "https://geocode.maps.co/search?q=" + postcode; // $"https://geocode.maps.co/search?q={postcode}";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);

            using (WebResponse response = (HttpWebResponse)request.GetResponse())

            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))

                {
                    return reader.ReadToEnd();
                }
            }

        }

        //public async Task<IEnumerable<AlertInfo>> GetAlertInfos()
        //{
        //    IEnumerable<AlertInfo> listAlertInfos;
        //    using (SqlConnection cn = new SqlConnection(n2u_connStr))
        //    {

        //        cn.Open();
        //        listAlertInfos = cn.Query<AlertInfo>("usp_GetAlertInfo", commandType: CommandType.StoredProcedure);
        //    }
        //    return listAlertInfos;
        //}

        // get total alert based on supplied email.
        public Int32 GetAlertCount(string email)
        {
            Int32 totalcount;
            using (SqlConnection cn = new SqlConnection(n2u_connStr))
            {
                SqlCommand cmd = new SqlCommand("usp_GetAlertInfo", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.CommandTimeout = 60;
                cn.Open();
                totalcount = Convert.ToInt32(cmd.ExecuteScalar());
            }
            return totalcount;
        }
    }
}