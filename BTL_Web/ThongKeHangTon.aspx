<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="BTL_Web.ThongKe" %>

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
                            <li><a href="ThongKeHangTon.aspx"><span>Thông kê hàng tồn</span></a></li>

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
                     <div id="MyLineChart" >
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
       
        Highcharts.chart('MyLineChart', {
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Historic World Population by Region'
            },
            subtitle: {
                text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
            },
            xAxis: {
                categories:  <%=lineData2%>,
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Số lượng',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' millions'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 80,
                floating: true,
                borderWidth: 1,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
                shadow: true
            },
            credits: {
                enabled: false
            },
            series:  <%=lineData%>
        });
            
    </script>
</asp:Content>
