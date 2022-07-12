using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_Web
{
    public partial class ThongKeSLBan : System.Web.UI.Page
    {
        DataProvider data = new DataProvider();
        public string lineData1;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThongKe();
        }
        void LoadThongKe()
        {
            DataTable dt = new DataTable();
            try
            {


               
                using (SqlConnection conn = new SqlConnection(data.strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = System.Data.CommandType.Text;
                        cmd.CommandText = "SELECT TOP 10 SUM(iSoluongmua) AS Soluongmua, tbl_SanPham.sTenSanPham AS Tensanpham FROM tbl_CTHoaDon INNER JOIN tbl_SanPham ON tbl_CTHoaDon.sID_SanPham = tbl_SanPham.sID_SanPham GROUP BY tbl_SanPham.sTenSanPham ORDER BY Soluongmua DESC";
                        using (SqlDataAdapter daThongke = new SqlDataAdapter(cmd))
                        {

                            daThongke.Fill(dt);
                            conn.Close();
                        }
                    }
                }
            }
            catch(Exception ex)
            {

            }
            lineData1 = "[";
            foreach (DataRow dr in dt.Rows)
            {
                lineData1 += "{name: '" + dr["Tensanpham"] + "',y: " + dr["Soluongmua"].ToString() + "},";

            }
            lineData1 = lineData1.Remove(lineData1.Length - 1) + ']';
        }
    }
}