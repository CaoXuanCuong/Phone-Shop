using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace BTL_Web
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public int SoLuong(string user)
        {
            DataProvider data = new DataProvider();
            SqlCommand cmd = new SqlCommand("Select tbl_SanPham.*, tbl_CTGioHang.* FROM tbl_SanPham INNER JOIN tbl_CTGioHang ON tbl_SanPham.sID_SanPham = tbl_CTGioHang.sID_SanPham WHERE tbl_CTGioHang.sUserName = @user AND tbl_CTGioHang.sCheck IS NULL", data.conn);
            cmd.Parameters.AddWithValue("@user", user);
            data.connDB();
            cmd.ExecuteNonQuery();
            DataSet dt = new DataSet();
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
                if (dt.Tables[0]. Rows.Count > 0)
                {
                    //var result = JsonConvert.SerializeObject(dt);
                    return dt.Tables[0].Rows.Count;
                }
                else
                {
                    return 0;
                }
                data.closeDB();
            }
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World pavan";
        }
        [WebMethod]
        public string AddResults(string a, string b)
        {
            int addResult = Convert.ToInt32(a) + Convert.ToInt32(b);
            return addResult.ToString();
        }
    }
}
