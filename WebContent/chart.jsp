<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>구매분석</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	구매분석
	<br> 필요지표 입력 :
	<input type="text" id="lineNum">
	<button onclick="chartView()">차트 확인하기</button>

	<script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart', 'line'] });
		
        function chartView() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var data = document.getElementById("lineNum").value;
                    var line = JSON.parse(this.responseText);

                    //"line_num":"우이신설선","ride_pasgr_num":2661,"alight_pasgr_num":2498,"work_dt":"20200810","use_dt":"20200807","sub_sta_nm":"4.19민주묘지"},
                    
                    var arr = [["정거장명", "유동인구(승차승객+하차승객)"]];	//유동인구 차트
                    var arr2 = [];	//승차인구 차트
                    for (const li of line.DATA) {
                        if (li.line_num == data) {
                            arr.push([li.sub_sta_nm, li.alight_pasgr_num + li.ride_pasgr_num]);
                            arr2.push([li.sub_sta_nm, li.ride_pasgr_num - li.alight_pasgr_num]);
                        }
                    }
                    
                    //유동인구 차트
                    new google.visualization.PieChart(document.getElementById('piechart'))
                    .draw(google.visualization.arrayToDataTable(arr), { title: `${data} 유동인구` });
                    new google.visualization.BarChart(document.getElementById('barchart'))
                    .draw(google.visualization.arrayToDataTable(arr), { title: `${data} 유동인구` });
					
                    //승차승객 차트
                    var lineData = new google.visualization.DataTable();
                    lineData.addColumn('string', '정거장명');
                    lineData.addColumn('number', '실승차객');
                    lineData.addRows(arr2);
                    new google.charts.Line(document.getElementById('barchart2'))
                    .draw(lineData, { title: `${data} 실승차객` });
                    
                    //display setting
                    document.getElementById("barchart").style.display="none";
                    console.log(document.getElementById("tButton"));
                    document.getElementById("tButton").style.display="block";
                }
            };
            xhttp.open("GET", "dataRes.json", true);
            xhttp.send();
        }
    </script>
    
    <div id="piechart" style="width: 900px; height: 400px;"></div>
    <div id="barchart" style="width: 900px; height: 400px;"></div>
    <div id="tButton" style="display: none;">
        <button onclick="toggle(0)">PieChart 보기</button>
        <button onclick="toggle(1)">BarChart 보기</button>
    </div>
    <div id="barchart2" style="width: 900px; height: 400px;"></div>

    <script>
        function toggle(num){
            if (num=='0'){
                document.getElementById("piechart").style.display="block";
                document.getElementById("barchart").style.display="none";
            } else {
                document.getElementById("piechart").style.display="none";
                document.getElementById("barchart").style.display="block";
            }
        }
    </script>
</body>

</html>