using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AHR_School_And_College.StringEncoding
{
    public class Bs64Encode
    {

        public string encode_bs64(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public string decode_bs64(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}