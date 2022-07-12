<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="BTL_Web.ThongKe" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-inner" style="height: 650px;">
        <div id="main-wrapper">
            <!-- Row -->
            <div class="cross-page-line"></div>
            <div class="row">
                <div class="col-md-2">
                    <div class="email-actions">
                        <a href="#" class="btn btn-primary compose">Compose</a>
                    </div>
                    <div class="email-menu">
                        <ul class="list-unstyled">
                            <li><a href="ThongKe.aspx"><span>Thống kê doanh thu</span></a></li>
                            <li><a href="ThongKeSLBan.aspx"><span>Thống kê số lượng bán</span></a></li>

                        </ul>
                    </div>
                </div>
                <%--<div class="col-md-10">
                                <asp:Chart ID="Chart1" runat="server" Width="725px">
                                    <Series>
                                        <asp:Series Name="Series1" ></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>--%>
                <div class="col-md-10">
                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server">
                        <asp:ListItem Value="Apple">Apple</asp:ListItem>
                        <asp:ListItem Value="Samsung">Samsung</asp:ListItem>
                        <asp:ListItem Value="Oppo">Oppo</asp:ListItem>
                        <asp:ListItem Value="Xiaomi">Xiaomi</asp:ListItem>
                        <asp:ListItem Value="Vivo">Vivo</asp:ListItem>
                        <asp:ListItem Value="Huawei">Huawei</asp:ListItem>
                    </asp:DropDownList>
                    <div id="MyLineChart">
                    </div>
                </div>

                <br />

            </div>
            <!-- Row -->
        </div>
        <!-- Main Wrapper -->
        <div class="page-footer">
            <p>Made with <i class="fa fa-heart"></i>by skcats</p>
        </div>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/drilldown.js"></script>
    <script>
        <%--$('#MyLineChart').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Doanh thu trong tháng'
            },
            xAxis: {
                title: {
                    text: 'Tháng'
                }
            },
            yAxis: {
                title: {
                    text: 'Tổng tiền'
                }
            },
            series: [{
                type: 'column',
                name: 'Doanh thu',
                data: <%=lineData%>,
            }]
        });--%>
        Highcharts.chart('MyLineChart', {
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Số lượng hàng tồn'
            },
       
            accessibility: {
                announceNewData: {
                    enabled: true
                }
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Số lượng'
                }

            },
            legend: {
                enabled: false
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.,f}'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.,f}<br/>'
            },

            series: [
                {
                    name: "Sản phẩm",
                    colorByPoint: true,
                    data: <%=lineData%>,
                }
            ],
          
        });
    </script>
</asp:Content>
