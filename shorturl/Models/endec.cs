using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace shorturl.Models
{
    public class endec
    {
        public string convertStringToHex(string str, int key)
        {
            StringBuilder hex = new StringBuilder();
            // hex.ToString().ap = ""
            if (str != null)
            {
                char[] chars = str.ToCharArray();
                int i;
                for (i = 0; i <= chars.Length - 1; i++)
                {
                    int value;
                    value = (int)chars[i];
                    int newvalue;
                    newvalue = value + key;
                    hex.Append(newvalue.ToString("x"));
                }
                return hex.ToString();
            }

            return hex.ToString();
        }

        public string convertHexToString(string hex, int key)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i <= hex.Length - 2; i += 2)
            {
                string output = hex.Substring(i, (2));
                int @decimal = Convert.ToInt32(output, 16);
                @decimal = @decimal - key;
                sb.Append((char)@decimal);
            }
            return sb.ToString();
        }

        public string createasciivalue(string str)
        {
            // str = CType(str, String)
            if (str != "")
            {
                if (str.Length == 1)
                {
                    string s;
                    s = str;
                    return s;
                }
            }
            return "";
        }
    }
}