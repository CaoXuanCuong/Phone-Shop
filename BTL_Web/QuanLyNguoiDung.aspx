<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="BTL_Web.QuanLyNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .page-inner{
            padding-bottom:700px;
        }
        table tr th{
            text-align:center;
        }
    </style>
    <div class="page-inner">
        <div class="page-title">
            <h3 class="breadcrumb-header">Quản Lý Người Dùng</h3>
        </div>
        <div id="main-wrapper">
           <div style="width: 1230px; padding-top: 20px; overflow-x: auto;">
        <asp:GridView Style="width: 1230px;" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="Tên đăng nhập" DataField="sUserName" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Mật khẩu" DataField="sPassWord">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Họ và tên" DataField="sHoTen">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Type" DataField="iType">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Mô tả" DataField="sMoTa">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField CancelText="Bỏ qua" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Xóa" OnClientClick="return confirm('Bạn có chắc muốn xóa không!');">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <div>
            <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
        </div>
        <!-- Main Wrapper -->
        <div class="page-footer">
            <p>Made with <i class="fa fa-heart"></i>by skcats</p>
        </div>
    </div>
</asp:Content>
