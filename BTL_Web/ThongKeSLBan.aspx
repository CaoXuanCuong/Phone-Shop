<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThongKeSLBan.aspx.cs" Inherits="BTL_Web.ThongKeSLBan" %>

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
                <div id="MyLineChart" class="col-md-10">
                </div>
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
    <script>
        Highcharts.chart('MyLineChart', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Top 10 Sản phẩm bán chạy nhất'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.y}</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.y}'
            }
        }
    },
    series: [{
        name: 'Bán chạy',
        colorByPoint: true,
        data:  <%=lineData1%>,
    }]
});
    </script>
</asp:Content>
