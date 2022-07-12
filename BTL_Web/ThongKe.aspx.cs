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
    public partial class ThongKe : System.Web.UI.Page
    {
        public string lineData2;
        DataProvider data = new DataProvider();
        public string lineData;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThongKe();
        }

        void LoadThongKe()
        {

            DataTable dt1 = new DataTable();
            using (SqlConnection conn = new SqlConnection(data.strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "select sTensanpham as Thang, iSoluong_kho as tongtien, sNhaSanXuat as Nsx from tbl_SanPham WHERE sNhasanxuat = @nsx";
                    cmd.Parameters.AddWithValue("@nsx", DropDownList1.SelectedValue);
                    using (SqlDataAdapter daThongke = new SqlDataAdapter(cmd))
                    {

                        daThongke.Fill(dt1);
                        conn.Close();
                    }
                }
            }
            lineData = "[";
            foreach (DataRow dr in dt1.Rows)
            {

                    lineData += "{name: '" + dr["Thang"] + "',y: "+dr["tongtien"]+"},";
                

            }
            lineData = lineData.Remove(lineData.Length - 1) + ']';
        }
    }
}