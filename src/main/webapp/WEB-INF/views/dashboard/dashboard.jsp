<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style>
        .chart-overflow {
                    margin: 0!important;
                    padding: 0!important;
                    overflow: hidden;
                    height: 100%;
                    width: 100%;
                }
        .card {
            border-radius: 10px; /* Rounded corners */
            overflow: hidden; /* Ensures child elements don't overflow the card's boundaries */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effects */
        }

        .card:hover {
            transform: translateY(-5px); /* Lift effect */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
        }

        .card-header {
            background-color: #f8f9fa; /* Light background color for the header */
            border-bottom: 1px solid #e9ecef; /* Border below the header */
            padding: 1rem; /* Padding inside the header */
        }

        .card-body {
            padding: 1.5rem; /* Padding inside the card body */
        }

        .card-title {
            font-size: 1.25rem; /* Font size for the card title */
            font-weight: bold; /* Bold title */
        }

        .card-content {
            color: #495057; /* Dark color for the card content text */
        }

        .card-footer {
            background-color: #f8f9fa; /* Light background color for the footer */
            border-top: 1px solid #e9ecef; /* Border above the footer */
            padding: 1rem; /* Padding inside the footer */
        }

        .card-img-top {
            border-bottom: 1px solid #e9ecef; /* Border below the image */
        }
 .navbar {
            background-color: #343a40; /* Dark background for the navbar */
        }

        .card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-header {
            background-color: #343a40; /* Dark background for card header */
            color: #ffffff; /* White text color for better contrast */
        }

        .card-body {
            padding: 1.5rem;
            background-color: #f8f9fa; /* Light background color for card body */
        }

        .chart-overflow {
            background-color: #ffffff; /* Light background color for chart area */
            padding: 1rem; /* Padding around the chart */
            border-radius: 8px; /* Rounded corners for the chart block */
        }

        .navbar-brand {
            color: #ffffff; /* White text color for navbar brand */
        }

        .navbar-brand:hover {
            color: #f8f9fa; /* Slightly lighter color on hover */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">BlackCoffer</a>
    </nav>
    <div class="ml-5 mt-5 mr-4 mb-3">
        <div class="row">
            <div class="col-xxl-6 col-xl-6 col-md-6 col-sm-6 box-col-6">
                <div class="card">
                    <div class="card-header bg-dark text-light">
                        <h5>Region Wise Data</h5><br>
                        <label for="region">Select Region</label>
                        <select class="custom-select" id="region" style="font-size:1rem!important; font-weight:bolder;">
                            <c:forEach items="${regionList}" var="region">
                                <option value="${region}">${region}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="card-body p-0 chart-block">
                        <div class="chart-overflow" id="pie-chart2"></div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-6 col-xl-6 col-md-6 col-sm-6 box-col-6">
                <div class="card">
                    <div class="card-header bg-dark text-light">
                        <h5>Sector Wise Data</h5><br>
                        <label for="sector">Select Sector</label>
                        <select class="custom-select" id="sector" style="font-size:1rem!important; font-weight:bolder;">
                            <c:forEach items="${sectors}" var="sector">
                                <option value="${sector}">${sector}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="card-body p-0 chart-block">
                        <div class="chart-overflow" id="pie-chart1"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-xxl-12 col-xl-12 col-md-12 col-sm-12 box-col-12">
                <div class="card">
                    <div class="card-header bg-dark text-light">
                        <h5>End Year Wise Data</h5><br>
                    </div>
                    <div class="card-body p-0 chart-block">
                        <div class="chart-overflow" id="bar-chart1" style="height:50rem;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
                    <div class="col-xxl-6 col-xl-6 col-md-6 col-sm-6 box-col-6">
                                    <div class="card">
                                        <div class="card-header bg-dark text-light">
                                            <h5>Topic Wise Data</h5><br>
                                            <label for="region">Select Topic</label>
                                            <select class="custom-select" id="topic" style="font-size:1rem!important; font-weight:bolder;">
                                                <c:forEach items="${topicList}" var="topic">
                                                    <option value="${topic}">${topic}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="card-body p-0 chart-block">
                                            <div class="chart-overflow" id="pie-chart3"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-6 col-xl-6 col-md-6 col-sm-6 box-col-6">
                                    <div class="card">
                                        <div class="card-header bg-dark text-light">
                                            <h5>Pestle Wise Data</h5><br>
                                            <label for="sector">Select PEST</label>
                                            <select class="custom-select" id="pestle" style="font-size:1rem!important; font-weight:bolder;">
                                                <c:forEach items="${pestList}" var="pest">
                                                    <option value="${pest}">${pest}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="card-body p-0 chart-block">
                                            <div class="chart-overflow" id="pie-chart4"></div>
                                        </div>
                                    </div>
                                </div>
                                </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>


            $(document).ready(function () {
              google.charts.load("current", { packages: ["corechart"] });
              google.charts.setOnLoadCallback(initializeDashboard);
              $("#sector").on('change', function(){
                loadSectorData($(this).val());
              });
              $("#region").on('change', function(){
                loadRegionData($(this).val());
              });
              $("#topic").on('change', function(){
                              loadTopicData($(this).val());
                            });
                            $("#pestle").on('change', function(){
                                                          loadPESTData($(this).val());
                                                        });
            });


            function initializeDashboard() {
                loadSectorData($("#sector").val());
                loadRegionData($("#region").val());
                loadTopicData($("#topic").val());
                loadPESTData($("#pestle").val());
                loadEnYearData();
            }

            function loadSectorData(sct) {
              $.ajax({
                url: "/get-sector-wise-data", // Endpoint to fetch data within date range
                method: 'GET',
                //timeout: 5000,
                data: {sector: sct},
                success: function (response) {

                  console.log("data response: ", response.responseObject);
                  drawSectorDataPieChart(response.responseObject);
                },
                error: function (error) {
                  console.error("Error fetching tickets data: ", error);
                  // Handle error
                }
              });
            }

            function loadRegionData(reg) {
                          $.ajax({
                            url: "/get-region-wise-data", // Endpoint to fetch data within date range
                            method: 'GET',
                            //timeout: 5000,
                            data: {region: reg},
                            success: function (response) {

                              console.log("data response: ", response.responseObject);
                              drawRegionPieChart(response.responseObject);
                            },
                            error: function (error) {
                              console.error("Error fetching tickets data: ", error);
                              // Handle error
                            }
                          });
                        }
            function loadEnYearData() {
                                      $.ajax({
                                        url: "/get-end-year-wise-data", // Endpoint to fetch data within date range
                                        method: 'GET',
                                        //timeout: 5000,
                                        success: function (response) {
                                          console.log("data response: ", response.responseObject);
                                          drawEndYearWiseChart(response.responseObject);
                                        },
                                        error: function (error) {
                                          console.error("Error fetching tickets data: ", error);
                                          // Handle error
                                        }
                                      });
                                    }

            function loadTopicData(top) {
                          $.ajax({
                            url: "/get-topic-wise-data", // Endpoint to fetch data within date range
                            method: 'GET',
                            //timeout: 5000,
                            data: {topic: top},
                            success: function (response) {

                              console.log("data response: ", response.responseObject);
                              drawTopicDataPieChart(response.responseObject);
                            },
                            error: function (error) {
                              console.error("Error fetching tickets data: ", error);
                              // Handle error
                            }
                          });
                        }
            function loadPESTData(pest) {
                                      $.ajax({
                                        url: "/get-pestle-wise-data", // Endpoint to fetch data within date range
                                        method: 'GET',
                                        //timeout: 5000,
                                        data: {pestle: pest},
                                        success: function (response) {

                                          console.log("data response: ", response.responseObject);
                                          drawPESTDataPieChart(response.responseObject);
                                        },
                                        error: function (error) {
                                          console.error("Error fetching tickets data: ", error);
                                          // Handle error
                                        }
                                      });
                                    }

            function drawSectorDataPieChart(response) {
              var dataArray = Object.entries(response);
              var data = google.visualization.arrayToDataTable([
                ["Sectors", "Frequency"],
                ...dataArray
              ]);
              var options = {
                width: "100%",
                height: 400,
                is3D: true,
                title: 'Sector Wise Data',
                pieSliceText: 'none',
                chartArea: { left: 1, top: 8, width: "100%", height: "200px" },
                legend: {
                  textStyle: {
                    fontSize: 16,
                  }
                }
              };
              var chart = new google.visualization.PieChart(
                document.getElementById("pie-chart1")
              );


              chart.draw(data, options);
              var legendLabels = document.querySelectorAll('#pie-chart1 g text');
              legendLabels.forEach(function (label) {
                label.textContent = label.textContent.toUpperCase();
              });
            }


            function drawRegionPieChart(response) {
                          var dataArray = Object.entries(response);
                          var data = google.visualization.arrayToDataTable([
                            ["Sectors", "Frequency"],
                            ...dataArray
                          ]);
                          var options = {
                            width: "100%",
                            height: 400,
                            is3D: true,
                            title: 'Sector Wise Data',
                            pieSliceText: 'none',
                            chartArea: { left: 1, top: 8, width: "100%", height: "200px" },
                            legend: {
                              textStyle: {
                                fontSize: 16,
                              }
                            }
                          };
                          var chart = new google.visualization.PieChart(
                            document.getElementById("pie-chart2")
                          );


                          chart.draw(data, options);
                          var legendLabels = document.querySelectorAll('#pie-chart2 g text');
                          legendLabels.forEach(function (label) {
                            label.textContent = label.textContent.toUpperCase();
                          });
                        }


            function drawEndYearWiseChart(data){
                console.log("data in super Group chart: ", data);
                if (data.length === 0) {
                  // If data is empty, display "No Data Found" message
                  var placeholderData = [['No Data Found']];
                  var dataTable = google.visualization.arrayToDataTable(placeholderData);

                  var options = {

                    hAxis: {
                      title: 'End Year'
                    },
                    vAxis: {
                      title: 'Total Intensity'
                    }
                  };

                  var chart = new google.visualization.ColumnChart(document.getElementById('bar-chart1'));

                    chart.draw(dataTable, options);
                  } else {
                    console.log(typeof data);
                    // Convert the received data to the format expected by Google Charts
                    var dataArray = [['End Year', 'Intensity']];

                    console.log(typeof dataObj);
                    data.forEach(function (item) {
                      dataArray.push([String(item.endYear), item.totalIntensity]);
                    });

                    console.log(dataArray);

                    // Create the data table
                    var dataTable = google.visualization.arrayToDataTable(dataArray);

                    // Set chart options
                    var options = {
                      hAxis: {
                        title: 'End Year',
                        slantedText: true, // To make year labels more readable
                        slantedTextAngle: 45 // Adjust the angle for better visibility
                      },
                      vAxis: {
                        title: 'Total Intensity'
                      }

                    };

                    // Instantiate and draw the chart
                    var chart = new google.visualization.ColumnChart(document.getElementById('bar-chart1'));

                      chart.draw(dataTable, options);
                    }
            }
            function drawTopicDataPieChart(response) {
                          var dataArray = Object.entries(response);
                          var data = google.visualization.arrayToDataTable([
                            ["Sectors", "Frequency"],
                            ...dataArray
                          ]);
                          var options = {
                            width: "100%",
                            height: 400,
                            is3D: true,
                            title: 'Sector Wise Data',
                            pieSliceText: 'none',
                            chartArea: { left: 1, top: 8, width: "100%", height: "200px" },
                            legend: {
                              textStyle: {
                                fontSize: 16,
                              }
                            }
                          };
                          var chart = new google.visualization.PieChart(
                            document.getElementById("pie-chart3")
                          );


                          chart.draw(data, options);
                          var legendLabels = document.querySelectorAll('#pie-chart3 g text');
                          legendLabels.forEach(function (label) {
                            label.textContent = label.textContent.toUpperCase();
                          });
                        }

            function drawPESTDataPieChart(response) {
                                      var dataArray = Object.entries(response);
                                      var data = google.visualization.arrayToDataTable([
                                        ["PEST", "Frequency"],
                                        ...dataArray
                                      ]);
                                      var options = {
                                        width: "100%",
                                        height: 400,
                                        is3D: true,
                                        title: 'PEST Wise Data',
                                        pieSliceText: 'none',
                                        chartArea: { left: 1, top: 8, width: "100%", height: "200px" },
                                        legend: {
                                          textStyle: {
                                            fontSize: 16,
                                          }
                                        }
                                      };
                                      var chart = new google.visualization.PieChart(
                                        document.getElementById("pie-chart4")
                                      );


                                      chart.draw(data, options);
                                      var legendLabels = document.querySelectorAll('#pie-chart4 g text');
                                      legendLabels.forEach(function (label) {
                                        label.textContent = label.textContent.toUpperCase();
                                      });
                                    }
</script>
</html>