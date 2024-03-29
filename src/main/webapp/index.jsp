<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15.12.2021
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String userId = (String) request.getSession().getAttribute("userId");
    String userName = (String) request.getSession().getAttribute("userName");
    Integer userRole = (Integer) request.getSession().getAttribute("userRole");
    String userRoleName = (String) request.getSession().getAttribute("userRoleName");
    String userLocation = (String) request.getSession().getAttribute("userLocation");
    String userLocationName = (String) request.getSession().getAttribute("userLocationName");
    String userPost = (String) request.getSession().getAttribute("userPost");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Божхона тўлови| Божхона қиймати</title>
    <link href="<%=request.getContextPath()%>/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/build/css/custom.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
</head>
<body class="nav-md menu_fixed">
<div class="container body">
    <div class="container body">
        <div class="col-md-3 left_col position-fixed" style="height: 110vh">
            <div class="left_col scroll-view ">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><img src="<%=request.getContextPath()%>/resources/images/gtk.jpg" width="50" height="50"> <span style="font-size: 18px!important;">Божхона қиймати </span></a>
                </div>
                <style>
                    .animate-charcter {
                        text-transform: uppercase;
                        background-image: linear-gradient(
                                -225deg,
                                #231557 0%,
                                #44107a 29%,
                                #ff1361 67%,
                                #fff800 100%
                        );
                        background-size: auto auto;
                        background-clip: border-box;
                        background-size: 200% auto;
                        color: #fff;
                        background-clip: text;
                        text-fill-color: transparent;
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        animation: textclip 2s linear infinite;
                        display: inline-block;
                        font-size: 20px;
                    }
                </style>
                <div class="clearfix"></div>
                <br/>
                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu menu_fixed">
                            <li><a href="javascript:ListClassProduct(0)"><i class="fa fa-bar-chart-o"></i>Товарларни тоифалаш</a></li>
                            <%if (userRole == 1 || userRole == 7 || userRole == 8 || userRole == 6){%> <%--todo (ҲББ Тўловлар бошлиғи ҳамда ҲББ Тўловлар ходими менюси)--%>
                            <li><a href="javascript:InitialDecisionRasp(0)"><i class="fa fa-edit"></i>Дастлабки қарор</a></li>
                            <%}%>
                            <li><a href="javascript:ErrorMessage(0)"><i class="fa fa-desktop"></i>Қиймат мониторинги</a></li>
                            <li><a href="javascript:ErrorMessage(0)"><i class="fa fa-sitemap"></i>Мантиқий назорат</a></li>
                            <li><a href="javascript:ErrorMessage(0)"><i class="fa fa-laptop"></i>Халқаро сўровнома</a></li>
                            <li><a href="javascript:ErrorMessage(0)"><i class="fa fa-clone"></i>Кўрсатма хатлар</a></li>
                            <li><a href="javascript:Digests(0)"><i class="fa fa-windows"></i>Справочник</a></li>
                        </ul>
                    </div>

                </div>
                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>
        <div class="top_nav fixed-top" style="background-color: #0d82ff !important;">
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <nav class="nav navbar-nav" style="color: #FFFFFF!important;">
                <ul class=" navbar-right">
                    <li class="nav-item dropdown open" style="padding-left: 15px;">
                        <a href="" class="user-profile dropdown-toggle" aria-haspopup="true"
                           id="navbarDropdown" data-toggle="dropdown" aria-expanded="false" style="color: #FFFFFF!important;">
                            <img src="<%=request.getContextPath()%>/resources/images/img.jpg" alt="">
                            <%=userName%>
                        </a>
                        <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href=""><%=userRoleName%>
                            </a>
                            <a class="dropdown-item" href="">
                                <span>Созлаш</span>
                            </a>
                            <a class="dropdown-item" href="">Ёрдам</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/login"><i class="fa fa-sign-out pull-right"></i>Чиқиш</a>
                        </div>
                    </li>
                    <li role="presentation" class="nav-item dropdown open">
                        <a href="" class="dropdown-toggle info-number text-white" id="navbarDropdown1"
                           data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-envelope-o"></i>
<%--                            <span class="badge bg-green">6</span>--%>
                        </a>
                        <ul class="dropdown-menu list-unstyled msg_list" role="menu"
                            aria-labelledby="navbarDropdown1">
                            <li class="nav-item">
                                <a class="dropdown-item">
                                        <span class="image"><img
                                                src="<%=request.getContextPath()%>/resources/images/img.jpg"
                                                alt="Profile Image"/></span>
                                    <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                    <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="dropdown-item">
                                        <span class="image"><img
                                                src="<%=request.getContextPath()%>/resources/images/img.jpg"
                                                alt="Profile Image"/></span>
                                    <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                    <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="dropdown-item">
                                        <span class="image"><img
                                                src="<%=request.getContextPath()%>/resources/images/img.jpg"
                                                alt="Profile Image"/></span>
                                    <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                    <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="dropdown-item">
                                        <span class="image"><img
                                                src="<%=request.getContextPath()%>/resources/images/img.jpg"
                                                alt="Profile Image"/></span>
                                    <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                    <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <div class="text-center">
                                    <a class="dropdown-item">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <%--todo Асосий----------------------------------------------------қисми------------------------дан--%>
    <div class="right_col" id="MainContent" role="main" style="min-height: 850px!important;">
        <%--todo страницаларни чақириш жойи--%>
    </div>
    <%--todo Асосий----------------------------------------------------қисми------------------------гача--%>
</div>
<script src="<%=request.getContextPath()%>/resources/vendors/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/src/js/chartjs.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendors/iCheck/icheck.min.js"></script>

<style>
    body {
        margin: 0;
    }

    .preloader {
        position: fixed;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        overflow: hidden;
        background-color: #21D4FD;
        background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%);
        z-index: 1001;
        color: #eee;
    }

    .preloader__image {
        position: relative;
        top: 50%;
        left: 50%;
        width: 70px;
        height: 70px;
        margin-top: -35px;
        margin-left: -35px;
        text-align: center;
        animation: preloader-rotate 2s infinite linear;
    }

    @keyframes preloader-rotate {
        100% {
            transform: rotate(360deg);
        }
    }

    .loaded_hiding .preloader {
        transition: 0.3s opacity;
        opacity: 0;
    }

    .loaded .preloader {
        display: none;
    }
</style>
<div class="preloader">
    <svg class="preloader__image" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path fill="currentColor"
              d="M304 48c0 26.51-21.49 48-48 48s-48-21.49-48-48 21.49-48 48-48 48 21.49 48 48zm-48 368c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zm208-208c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zM96 256c0-26.51-21.49-48-48-48S0 229.49 0 256s21.49 48 48 48 48-21.49 48-48zm12.922 99.078c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.491-48-48-48zm294.156 0c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.49-48-48-48zM108.922 60.922c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.491-48-48-48z">
        </path>
    </svg>
</div>
<script>
    window.onload = function () {
        document.body.classList.add('loaded_hiding');
        window.setTimeout(function () {
            document.body.classList.add('loaded');
            document.body.classList.remove('loaded_hiding');
        }, 500);
    }
</script>
<script>
    $(document).ready(function () {
        var dataS = {
            "x": '0',
        };
        var tipform = "<%=request.getContextPath()%>/resources/pages/ClassProduct/ListClassProduct.jsp";
        $.post({
            async: false,
            url: tipform,
            data: dataS,
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);
                document.body.style.cursor = 'default';
            },
            error: function (res) {
                if (res.status == 401) {
                    $(".logOutForm").submit();
                }
            }
        });
    });

    /*Tovarlarni toifalash */
    function ListClassProduct(x) {
        var dataS = {
            "id": x
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/main/resources/pages/ClassProduct/ListClassProduct",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);
            },
            error: function (res) {
            }
        });
    }


    /* Маълумотларни твқсимлаш */
    function InitialDecisionRasp(x) {
        var dataS = {
            "id": x
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/apps/resources/pages/InitialDecision/InitialDecisionRasp",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            beforeSend: function(){
                $("#loading").show();
            },
            complete: function(){
                $("#loading").hide();
            },
            success: function (res) {
                $('div#MainContent').html(res);
            },
            error: function (res) {
            }
        });
    }

    /* Маълумотларнинг инспектор қисми */
    function InitialDecision(x) {
        var dataS = {
            "id": x
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/apps/resources/pages/InitialDecision/InitialDecision1",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);
            },
            error: function (res) {
            }
        });
    }

    /* Ариза тафсилоти */
    function InitialDecisionView(app_id) {
        var dataS = {
            "app_id": app_id
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/apps/resources/pages/InitialDecision/InitialDecisionView",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);
            },
            error: function (res) {
            }
        });
    }

    /* Справочник */
    function Digests(x) {
        var dataS = {
            "x": x
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/digests/resources/pages/Digests/DigestsPage",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);

            },
            error: function (res) {
            }
        });
    }

    /* Справочник рад этиш modal */
    function QiymatRejects(tov_id) {
        var dataS = {
            "tov_id": tov_id
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/digests/resources/pages/Digests/QiymatRejectModal",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                console.log('clicked');
                $('#ModalSentMess').html(res);
                $modal = $('#ModalSentMess');
                $modal.modal('show');
            },
            error: function () {
                console.log("error");
            }
        });
    }

    /* Справочник консалт modal */
    function QiymatConsult(tov_id) {
        var dataS = {
            "tov_id": tov_id
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/digests/resources/pages/Digests/QiymatConsultModal",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                console.log('clicked');
                $('#ModalSentMess').html(res);
                $modal = $('#ModalSentMess');
                $modal.modal('show');
            },
            error: function () {
                console.log("error");
            }
        });
    }

    /* Справочник shartli modal */
    function QiymatShartli(tov_id) {
        var dataS = {
            "tov_id": tov_id
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/digests/resources/pages/Digests/QiymatShartliModal",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                console.log('clicked');
                $('#ModalSentMess').html(res);
                $modal = $('#ModalSentMess');
                $modal.modal('show');
            },
            error: function () {
                console.log("error");
            }
        });
    }

    /* Error message */
    function ErrorMessage(x) {
        var dataS = {
            "x": x
        }
        $.ajax({
            type: "POST",
            data: dataS,
            url: "<%=request.getContextPath()%>/resources/pages/ErrorPage/ErrorMessage.jsp",
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);

            },
            error: function (res) {
            }
        });
    }

</script>
<script src="<%=request.getContextPath()%>/resources/build/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
</body>
</html>