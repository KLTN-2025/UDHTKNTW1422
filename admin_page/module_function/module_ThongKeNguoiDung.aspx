<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" Runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <style>
        .stat-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 6px;
            padding: 12px;
            color: white;
            margin-bottom: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .stat-box h4 {
            margin: 0 0 5px 0;
            font-size: 12px;
            opacity: 0.9;
        }
        .stat-box .number {
            font-size: 24px;
            font-weight: bold;
        }
        .stat-box.blue { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .stat-box.green { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
        .stat-box.orange { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
        .stat-box.purple { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
        .chart-wrapper {
            background: white;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .chart-title {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        .card {
            padding: 10px;
        }
        h3 {
            font-size: 20px !important;
            margin-bottom: 15px !important;
        }
        canvas {
            max-height: 200px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="hihead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="himenu" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" Runat="Server">
    <div class="card">
        <div class="container-fluid pt-3">
            <h3 style="text-align: center; font-size: 20px; font-weight: bold; color: #333; margin-bottom: 15px;">
                <i class="fa fa-bar-chart"></i> THỐNG KÊ NGƯỜI DÙNG ỨNG DỤNG
            </h3>

            <!-- Thống kê tổng quan -->
            <div class="row">
                <div class="col-md-3">
                    <div class="stat-box blue">
                        <h4><i class="fa fa-users"></i> Tổng người dùng</h4>
                        <div class="number">1,234</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-box green">
                        <h4><i class="fa fa-user-plus"></i> Người dùng mới (tháng này)</h4>
                        <div class="number">156</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-box orange">
                        <h4><i class="fa fa-book"></i> Tổng lượt xem bài học</h4>
                        <div class="number">8,567</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-box purple">
                        <h4><i class="fa fa-check-circle"></i> Tổng lượt làm bài tập</h4>
                        <div class="number">5,432</div>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ 1: Thống kê người dùng theo thời gian -->
            <div class="row">
                <div class="col-md-12">
                    <div class="chart-wrapper">
                        <div class="chart-title">📊 Biểu đồ tăng trưởng người dùng theo thời gian</div>
                        <canvas id="userGrowthChart" height="60"></canvas>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ 2: So sánh hoạt động -->
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-wrapper">
                        <div class="chart-title">📈 So sánh hoạt động người dùng</div>
                        <canvas id="activityChart" height="200"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-wrapper">
                        <div class="chart-title">📉 Lược đồ chênh lệch người dùng</div>
                        <canvas id="differenceChart" height="200"></canvas>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ 3: Lượt xem và làm bài theo thời gian -->
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-wrapper">
                        <div class="chart-title">📚 Lượt xem bài học theo thời gian</div>
                        <canvas id="lessonChart" height="200"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-wrapper">
                        <div class="chart-title">✏️ Lượt làm bài tập theo thời gian</div>
                        <canvas id="exerciseChart" height="200"></canvas>
                    </div>
                </div>
            </div>

            <!-- Bảng chi tiết -->
            <div class="chart-wrapper">
                <div class="chart-title">📋 Chi tiết người dùng</div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Số điện thoại</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Số bài đã xem</th>
                                <th>Số bài đã làm</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>0901234567</td>
                                <td>Nguyễn Văn A</td>
                                <td>nguyenvana@email.com</td>
                                <td>45</td>
                                <td>32</td>
                                <td>Hoạt động</td>
                            </tr>
                            <tr>
                                <td>0902345678</td>
                                <td>Trần Thị B</td>
                                <td>tranthib@email.com</td>
                                <td>38</td>
                                <td>28</td>
                                <td>Hoạt động</td>
                            </tr>
                            <tr>
                                <td>0903456789</td>
                                <td>Lê Văn C</td>
                                <td>levanc@email.com</td>
                                <td>52</td>
                                <td>41</td>
                                <td>Hoạt động</td>
                            </tr>
                            <tr>
                                <td>0904567890</td>
                                <td>Phạm Thị D</td>
                                <td>phamthid@email.com</td>
                                <td>29</td>
                                <td>19</td>
                                <td>Hoạt động</td>
                            </tr>
                            <tr>
                                <td>0905678901</td>
                                <td>Hoàng Văn E</td>
                                <td>hoangvane@email.com</td>
                                <td>67</td>
                                <td>54</td>
                                <td>Hoạt động</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // Dữ liệu cứng (hardcoded)
        var userGrowthData = {
            labels: ["13/12", "14/12", "15/12", "16/12", "17/12", "18/12", "19/12"],
            data: [1200, 1210, 1225, 1230, 1234, 1234, 1234]
        };
        var activityData = {
            labels: ["Tổng người dùng", "Người dùng hoạt động", "Bài học đã xem", "Bài tập đã làm"],
            data: [1234, 856, 8567, 5432]
        };
        var differenceData = {
            labels: ["13/12", "14/12", "15/12", "16/12", "17/12", "18/12", "19/12"],
            newUsers: [20, 15, 25, 10, 4, 0, 0],
            activeUsers: [120, 135, 142, 128, 145, 138, 156]
        };
        var lessonData = {
            labels: ["13/12", "14/12", "15/12", "16/12", "17/12", "18/12", "19/12"],
            data: [1200, 1350, 1420, 1280, 1450, 1380, 1560]
        };
        var exerciseData = {
            labels: ["13/12", "14/12", "15/12", "16/12", "17/12", "18/12", "19/12"],
            data: [850, 920, 980, 870, 1020, 950, 1100]
        };

        // Biểu đồ 1: Tăng trưởng người dùng
        var ctxUserGrowth = document.getElementById('userGrowthChart').getContext('2d');
        var userGrowthChart = new Chart(ctxUserGrowth, {
            type: 'line',
            data: {
                labels: userGrowthData.labels,
                datasets: [{
                    label: 'Người dùng mới',
                    data: userGrowthData.data,
                    borderColor: 'rgb(75, 192, 192)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ 2: So sánh hoạt động
        var ctxActivity = document.getElementById('activityChart').getContext('2d');
        var activityChart = new Chart(ctxActivity, {
            type: 'bar',
            data: {
                labels: activityData.labels,
                datasets: [{
                    label: 'Số lượng',
                    data: activityData.data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ 3: Lược đồ chênh lệch
        var ctxDifference = document.getElementById('differenceChart').getContext('2d');
        var differenceChart = new Chart(ctxDifference, {
            type: 'line',
            data: {
                labels: differenceData.labels,
                datasets: [
                    {
                        label: 'Người dùng mới',
                        data: differenceData.newUsers,
                        borderColor: 'rgb(75, 192, 192)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        tension: 0.4,
                        fill: true
                    },
                    {
                        label: 'Người dùng hoạt động',
                        data: differenceData.activeUsers,
                        borderColor: 'rgb(255, 99, 132)',
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        tension: 0.4,
                        fill: true
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ 4: Lượt xem bài học
        var ctxLesson = document.getElementById('lessonChart').getContext('2d');
        var lessonChart = new Chart(ctxLesson, {
            type: 'line',
            data: {
                labels: lessonData.labels,
                datasets: [{
                    label: 'Lượt xem',
                    data: lessonData.data,
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ 5: Lượt làm bài tập
        var ctxExercise = document.getElementById('exerciseChart').getContext('2d');
        var exerciseChart = new Chart(ctxExercise, {
            type: 'line',
            data: {
                labels: exerciseData.labels,
                datasets: [{
                    label: 'Lượt làm bài',
                    data: exerciseData.data,
                    borderColor: 'rgb(153, 102, 255)',
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" Runat="Server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" Runat="Server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" Runat="Server">
</asp:Content>

