



<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>CONTRACT MANAGEMENT</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
        <!-- Thêm thư viện jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Thêm thư viện Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Thêm thư viện Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <!-- Add the Slick Slider CSS file -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>

        <!-- Add the Slick Slider JS file -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
        <!-- Thư viện jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Thư viện Slick Slider -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="MainController?action=Find2contracts" class="logo d-flex align-items-center">
                    <img src="assets/img/logo.png" alt="">
                    <span class="d-none d-lg-block">ContractM</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item dropdown pe-3">

                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                            <img src="images/${sessionScope.user.getAvatar()}" alt="Profile" class="rounded-circle">
                            <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.user.getFullName()}</span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>${sessionScope.user.getFullName()}</h6>

                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="MainController?action=View+Profile">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>


                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <form action="MainController" method="post">
                                    <a class="dropdown-item d-flex align-items-center" href="MainController?action=Logout" >
                                        <i class="bi bi-box-arrow-right"></i>
                                        <span>Sign Out</span>
                                    </a>
                                </form>  
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link " href="MainController?action=Find2contracts">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </a>
                </li><!-- End Dashboard Nav -->









                <li class="nav-heading">Pages</li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="MainController?action=View+Profile">
                        <i class="bi bi-person-badge"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <c:if test="${sessionScope.userType == 'U' || sessionScope.userType == 'O' }">
                    <li class="nav-item">
                        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                            <i class="bi bi-layout-text-window-reverse"></i><span>Contract</span><i class="bi bi-chevron-down ms-auto"></i>
                        </a>
                        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                            <li>
                                <a href="MainController?action=View+Contract">
                                    <i class="bi bi-circle"></i><span>View all contract</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.userType == 'A' || sessionScope.userType == 'B' }">
                            <li class="nav-item">
                                <a class="nav-link collapsed" href="ViewAllUser.jsp">
                                    <i class="bi bi-person-lines-fill"></i><span>All user on sever</span>
                                </a>

                            </li>
                            <c:if test="${sessionScope.userType == 'B' }">
                                <li class="nav-item">
                                    <a class="nav-link collapsed" href="AddNewAdmin.jsp">
                                        <i class="bi bi-person-add"></i>
                                        <span>Add new admin</span>
                                    </a>
                                </li>
                            </c:if>

                            <li class="nav-item">
                                <a class="nav-link collapsed" href="ViewAllContract.jsp">
                                    <i class="bi bi-layout-text-window-reverse"></i>
                                    <span>All contract on server</span>
                                </a>
                            </li>
                            <c:if test="${sessionScope.userType == 'B' }">
                                <li class="nav-item">
                                    <a class="nav-link collapsed" href="AddRoom.jsp">
                                        <i class="bi bi-house-add"></i>
                                        <span>Add room</span>
                                    </a>
                                </li>
                            </c:if>




                        </c:if>


                        <c:if test="${sessionScope.userType == 'U'}">
                            <li>
                                <a href="GetPendingContractServlet">
                                    <i class="bi bi-circle"></i><span>Pending contract</span>
                                </a>
                            </li>  
                        </c:if>

                        <c:if test="${sessionScope.userType == 'O'}">
                            <li>
                                <a href="CreateContract.jsp">
                                    <i class="bi bi-circle"></i><span>Create Contract</span>
                                </a>
                            </li>
                            <li>
                            <a href="CreditDetail.jsp">
                                <i class="bi bi-circle"></i><span>Add Credit</span>
                            </a>
                        </li>
                        </c:if>

                    </ul>
                </li>
                <c:if test="${sessionScope.userType == 'O'}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="MainController?action=ViewAllRoom">
                            <i class="bi bi-house-add"></i>
                            <span>Room</span>
                        </a>
                    </li>
                </c:if>
                <!-- End Profile Page Nav -->


            </ul>

        </aside><!-- End Sidebar-->

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>CONTRACT DETAIL</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="MainController?action=Find2contracts">Home</a></li>
                        <li class="breadcrumb-item active">View Contract Detail</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->
            <!------------------------------------------------------ Start Main ---------------------------------------------------->
            <c:set var="imgList" value="${requestScope.imgList}"/>
            <c:set var="contract" value="${requestScope.contract}"></c:set>
                <section class="section dashboard">

                    <div class="row">
                        <div class="col-lg-5">
                            <div class="card">
                                <div class="carousel">
                                <c:forEach var="img" items="${imgList}">
                                    <img src="room_images/${img}" class="card-img-top" alt="..." style="width: 100%; height: 300px;">
                                </c:forEach>
                                
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">${contract.getName()}</h5>
                                <p class="card-text"><b>BETWEEN:</b> ${contract.getUName()} and ${contract.getOName()} </p>
                                <p class="card-text"><b>START DATE:</b> ${contract.getCreateDate()}       <b>END DATE:</b> ${contract.getEndDate()}  </p>
                                <p class="card-text"><b>Rental fee:</b> <span class="badge text-bg-success">$${contract.getRentalFee()}</span></p>




                                <c:if test="${contract.status == 0}" >
                                    <p class="card-text"><b>Contract Status </b><span class="badge text-bg-warning">Pending</span> </p>
                                </c:if>
                                <c:if test="${contract.status == 1}" >
                                    <p class="card-text"><b>Contract Status </b><span class="badge text-bg-success">Live</span> </p>

                                </c:if>
                                <c:if test="${contract.status == 0 && sessionScope.userType == 'U'}" >
                                    <form action="MainController" method="post">

                                        <p class="card-text"><input class="btn btn-sm btn-success" type="submit" value="Sign this Contract"/> </p>
                                        <input type="hidden" value="Submit Contract" name="action">
                                        <input type="hidden" name="url" value="MainController?action=ViewContract&id=${contract.getCoID()}"> 
                                        <input type="hidden" name="CoID" value="${contract.getCoID()}"/>
                                    </form>
                                </c:if>
                                <div style="color:green;">${requestScope.noti}</div>

                            </div>
                        </div>
                    </div>
                    <c:set var="OID" value="${contract.getOID()}"></c:set>
                    <c:set var="owner" value="${requestScope.owner}"></c:set>
                    <c:set var="UID" value="${contract.getUID()}"></c:set>
                    <c:set var="user" value="${requestScope.user}"></c:set>



                        <div class="col-lg-7" >
                            <div class="card-list">
                                <div class="card active">
                                    <div class="card-body">
                                        <h5 class="card-title">LESSOR & LESEE DETAIL</h5>

                                        <h5><b>THE LESSOR (Hereinafter referred to as A)</b></h5>
                                        <h5><i class="bi bi-person-check-fill"></i>  ${contract.getOName()}</h5>
                                    <h5><i class="bi bi-info-circle-fill"></i> ${owner.getCID()}</h5>
                                    <h5><i class="bi bi-pin-map-fill"></i> ${owner.getAddress()}</h5>
                                    <h5><i class="bi bi-telephone-fill"></i> ${owner.getPhoneNumber()}</h5><br>
                                    <h5><b>THE LESSEE (Hereinafter referred to as B)</b></h5>
                                    <h5><i class="bi bi-person-check-fill"></i> ${contract.getUName()}</h5>
                                    <h5><i class="bi bi-info-circle-fill"></i> ${user.getCID()}</h5>
                                    <h5><i class="bi bi-pin-map-fill"></i> ${user.getAddress()}</h5>
                                    <h5><i class="bi bi-telephone-fill"></i> ${user.getPhoneNumber()}</h5>

                                    <h4><span class="badge text-bg-warning"><i class="bi bi-house-door-fill"></i> Room ${contract.getRoID()}</span></h4>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">FEE ARGEEMENT</h5>

                                    <h5><b><span style="color:red;">After discussion, the two parties have mutually agreed to enter into the house lease contract with the following agreement</span></b></h5><br>
                                    <h5><b>ARTICLE 1: THE HOUSE FOR LEASE, PURPOSES OF USE</b></h5>
                                    <h5>Party A agrees to lease Party B the whole house at <span class="badge text-bg-warning"><i class="bi bi-house-door-fill"></i> Room ${contract.getRoID()}</span> according to the Certificate of land use rights, ownership of house and other properties associated with the Department of Natural Resources and Environment of Ho Chi Minh City.<br><br></h5>
                                    <h5><b>ARTICLE 2: DURATION OF THE LEASE</b></h5>
                                    <h5><i class="bi bi-calendar2-check-fill"></i> Start ${contract.getCreateDate()}</h5>
                                    <h5><i class="bi bi-calendar-x-fill"></i> End ${contract.getEndDate()}</h5>
                                    <h5><b>Rental fee </b> <span class="badge text-bg-success">$${contract.getRentalFee()} /month</span></h5>
                                    <c:if test="${sessionScope.userType == 'O'}">
                                        <h5><b>System fee </b> $${contract.getSystemFee()} </h5>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">MUTUAL AGREEMENT</h5>

                                    <h5><b>ARTICLE 3: RESPONSIBILITIES OF PARTY A</b></h5>
                                    <h5>- Ensuring and undertaking that the house is owned by Party A, Party A has full rights to lease it.</h5>
                                    <h5>- Supporting and creating favorable conditions for Party B to register temporary residence when Party B has a need to register.</h5>
                                    <h5>- Receiving the rent in full and on time as agreed</h5><br>
                                    <h5><b>ARTICLE 4: RESPONSIBILITIES OF PARTY B</b></h5>
                                    <h5>- Using the house for the right purpose as agreed.</h5>
                                    <h5>- Being responsible under the law for all activities during the residential period.</h5>
                                    <h5>- Paying the rent on time according to the agreed method.</h5><br>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">MUTUAL AGREEMENT</h5>

                                    <h5><b>ARTICLE 5: UNILATERAL TERMINATION OF THE CONTRACT</b></h5><br>
                                    <h5><b>Party A has the right to unilaterally terminate the contract performance when Party B commits any of the following acts:</b></h5>
                                    <h5>- Not paying the rent as agreed.<br></h5>
                                    <h5>- Deliberately damaging the house.<br></h5>
                                    <h5>- Seriously affecting environmental sanitation, fire protection safety, security and order.<br></h5>
                                    <h5><b>Party B has the right to unilaterally terminate the lease contract performance when the lessor commits any of the following acts:</b><br></h5>
                                    <h5>- Increasing the rent at variance with the agreement.<br></h5>
                                    <h5>- Causing difficulties or hindering Party B's business activities during the lease period.<br></h5>
                                    <h5>- Issues related to ownership and disputes of the house.</h5><br>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">MUTUAL AGREEMENT</h5>


                                    <h5><b>ARTICLE 6: CONTRACT TERMINATION</b></h5><br>
                                    <h5><b>The contract will be terminated in the following cases:</b></h5>
                                    <h5>- The lease term has expired</h5>
                                    <h5>- The leased house must be demolished due to serious damage that may make the house collapse or due to the implementation of the State's construction planning.</h5><br>
                                    <h5><b>Additional note </b></h5>
                                    <h4 style="color:red">${contract.getDescription()}></h4>
                                </div>
                            </div>
                        </div>
                        <button id="next-button" class="btn btn-primary">Next</button>
                    </div>  

                    <script>
                        $(document).ready(function () {
                            $('.carousel').slick({
                                dots: true, // Hiển thị nút điều hướng
                                infinite: true, // Cho phép cuộn vô hạn
                                speed: 300, // Tốc độ chuyển ảnh
                                slidesToShow: 1, // Số lượng ảnh hiển thị cùng lúc
                                adaptiveHeight: true // Tự động thay đổi chiều cao của carousel
                            });
                        });
                    </script>
                    <script>
                        $(document).ready(function () {
                            // Đặt thẻ card -1 làm thẻ card hiển thị mặc định đầu tiên
                            var cards = $(".card-list .card");
                            var currentCard = 0;
                            cards.eq(currentCard).addClass("active");

                            // Ẩn tất cả các thẻ card trừ thẻ card hiển thị mặc định đầu tiên
                            cards.hide();
                            cards.eq(currentCard).show();

                            var nextButton = $("#next-button");

                            // Xử lý sự kiện khi nút "Next" được nhấn
                            nextButton.click(function () {
                                // Nếu đang ở thẻ card cuối cùng, quay lại thẻ card đầu tiên (-1)
                                if (currentCard >= cards.length - 1) {
                                    currentCard = -1;
                                }

                                // Ẩn thẻ card hiện tại
                                cards.eq(currentCard).hide();

                                // Chuyển sang thẻ card tiếp theo
                                currentCard++;

                                // Hiển thị thẻ card tiếp theo
                                cards.eq(currentCard).show();

                                // Thêm lớp "active" cho thẻ card đang hiển thị
                                cards.removeClass("active");
                                cards.eq(currentCard).addClass("active");
                            });
                        });

                    </script>


                    <!-- End Card with an image on top -->

                    </main>
                    <!-- End #main --------------------------------------------------------------------------------------------------------------->

                    <!-- ======= Footer ======= -->
                    <footer id="footer" class="footer">
                        <div class="copyright">
                            &copy; Copyright <strong><span>Contract Management</span></strong>. All Rights Reserved
                        </div>
                        <div class="credits">

                            Designed by <a href="https://youtube.com">Contract Management team</a>
                        </div>
                    </footer><!-- End Footer -->

                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

                    <!-- Vendor JS Files -->
                    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
                    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets/vendor/chart.js/chart.umd.js"></script>
                    <script src="assets/vendor/echarts/echarts.min.js"></script>
                    <script src="assets/vendor/quill/quill.min.js"></script>
                    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
                    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
                    <script src="assets/vendor/php-email-form/validate.js"></script>

                    <!-- Template Main JS File -->
                    <script src="assets/js/main.js"></script>

                    </body>
                    </html>
