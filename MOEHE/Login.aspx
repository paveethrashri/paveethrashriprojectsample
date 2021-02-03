<!DOCTYPE html>


<html ng-app="defaultModule" dir='rtl'>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>
        بوابة خدمات الجمهور
    </title>
    <meta name="description" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Favicon -->
    <script type="text/javascript" src="/ruxitagentjs_ICA2SVfghjqrux_10207210127152629.js" data-dtconfig="rid=RID_-617098541|rpid=-1384791807|domain=edu.gov.qa|reportUrl=/rb_1266574e-15ac-4767-b98e-fa38e26f8839|app=425643666f1a9c16|featureHash=ICA2SVfghjqrux|vcv=2|rdnt=1|uxrgce=1|bp=2|cuc=7l4nnik3|mel=100000|dpvc=1|md=mdcc1=abody ^rb div.header-area.header-sticky.header-area--absolute ^rb div ^rb div.row.bg-3naby ^rb div:nth-child(3) ^rb div ^rb div ^rb a|lastModification=1611810076602|dtVersion=10207210127152629|tp=500,50,0,1|uxdcw=1500|vs=2|agentUri=/ruxitagentjs_ICA2SVfghjqrux_10207210127152629.js"></script>
    <link rel="icon" href="/assets/images/favicon.png" />
    <link rel="stylesheet" href="/assets/css/bootstrap.min.rtl.css" />
    <link rel="stylesheet" href="/assets/css/_style.css?v=3" />
    <link rel="stylesheet" href="/assets/css/_style.rtl.css?v=3" />
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="/assets/css/animate-text.css" />
    <link rel="stylesheet" href="/assets/css/animate.min.css" />
    <link rel="stylesheet" href="/assets/css/owl.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/css/default.css" />

    <script src="/assets/js/jquery-3.3.1.min.js"></script>

    <script src='https://fs-nsis.edu.gov.qa/CDN/html5/angularjs/1.4.3/angular.min.js' type="text/javascript"></script>
    <script src='https://fs-nsis.edu.gov.qa/CDN/html5/angularjs/1.2.16/angular-route.js' type="text/javascript"></script>
    <script src='https://fs-nsis.edu.gov.qa/CDN/html5/angularjs/1.4.3/angular-sanitize.min.js' type="text/javascript"></script>





    <script type="text/javascript">
        var defaultModule = angular.module('defaultModule', ['ngRoute']);

        defaultModule.controller("loginControl", ['$scope', '$http', loginControl]);

        var invalidPassword = 'خطأ في اسم المستخدم أو كلمة مرور';

        function loginControl($scope, $http) {

            if (document.cookie.indexOf('Culture=') == -1) {
                setLanguage('ar-QA');
            }

            var tryCount = 1;
            $scope.errorMessage = null;

            $('.hiddenonload').css({
                display: ""
            });

            $scope.sendLoginRequest = function() {
                $scope.errorMessage = null;

                getAuthCookie($scope, $http);
            }
        }

        function getAuthCookie($scope, $http) {
            $scope.isLoading = true;

            var url = '/Authentication_JSON_AppService.axd/Login';
            $http({
                method: 'POST',
                url: url,
                data: {
                    "userName": $scope.username,
                    "password": $scope.password,
                    "createPersistentCookie": false
                }
            }).success(function(response) {
                if (response.d) {
                    document.cookie = "CacheKey=" + Math.floor(Math.random() * 10000).toString();
                    getCoreCookie($scope, $http);
                } else {
                    $scope.errorMessage = invalidPassword;
                    $scope.isLoading = false;
                }
            }).error(function(response) {
                $scope.errorMessage = response && response.ErrorMessage;
                $scope.isLoading = false;
            });
        }

        function getCoreCookie($scope, $http) {
            $scope.isLoading = true;

            $http({
                method: 'GET',
                url: '/SPCore.Web/api/Account'
            }).success(function(response) {
                if (response == "") {
                    //window.location.href = '/';
                    var retunUrl = getUrlParameter('ReturnUrl');
                    if (retunUrl === '' || retunUrl == null) {
                        window.location.href = '/';
                    } else {
                        window.location.href = retunUrl;
                    }
                } else {
                    $scope.errorMessage = invalidPassword;
                }
            }).error(function(response) {
                if (response && response.ErrorMessage && response.ErrorMessage.indexOf('Object reference') == 0) window.setTimeout(function() {
                    document.getElementById('btnLogin').click()
                }, 2000);
                //$scope.codeStatus = response || "Request failed";
            }).finally(function() {
                $scope.isLoading = false
            });
        }

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };
    </script>


</head>

<body>

    <!--====================  header area ====================-->
    <div class="header-area header-sticky header-area--absolute">
        <div class="container-fluid">
            <div class="row bg-3naby">
                <div class="col-lg-4">
                    <div class="header-right">
                        <div class="text-size">
                            حجم النص
                        </div>
                        <div class="minus-size"><a href="javascript:void(0)" id="desize">-</a></div>
                        <div class="plus-size"><a href="javascript:void(0)" id="insize">+</a></div>
                        <span class="sep">|</span>
                        <div class="monochrome">
                            <a href="javascript:void(0)">
                                <img src="/assets/images/eye.png" /></a>
                        </div>
                        <!--<div class="voice-over">
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#under-construction">
                                <img src="/assets/images/volume.png" /></a>
                        </div>-->
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="header-center">
                        <div class="text-size-title">
                            بوابة خدمات الجمهور
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="header-left">

                        <div class="login-btn">

                            <a href="/Login.aspx">
                                تسجيل الدخول ‎‎<img src="/assets/images/user.png" /></a>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 header-bg ">
                    <div class="header position-relative">
                        <!-- brand logo -->
                        <div class="header__logo">
                            <a href="/">
                                <img src="/assets/images/logo/logo.png" class="img-fluid light-logo" alt="Saas">
                                <img src="/assets/images/logo/logo.png" class="img-fluid dark-logo" alt="Saas">
                            </a>
                        </div>
                        <!-- navigation menu -->
                        <div class="header__navigation d-none d-xl-block">
                            <nav class="navigation-menu navigation-menu--onepage navigation-menu--text_white">
                                <ul>
                                    <li><a href="/"><span class="">
                                        الصفحة الرئيسية</span></a></li>
                                    <li>
                                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            <span>
                                                الخدمات الإلكترونية
                                            </span>
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu multi-level">
                                            <li><a href="/WebParts/DisplayMarks"><span>
                                                نتيجة الثانوية العامة‎
                                            </span></a></li>
                                            <li><a href="/Service.aspx?service=PayFees"><span>1
                                                رسوم الكتب والمواصلات
                                            </span></a></li>
                                            <li><a href="/Service.aspx?service=IssueDocuments">
                                                اصدار الشهادات
                                                <span></span></a></li>
                                            <li><a href="/Service.aspx?service=PayFees"><span>
                                                رسوم تسجيل - تعليم الكبار</span></a></li>
                                            <li><a href="/Service.aspx?service=PreEnrollStudent"><span>
                                                التسجيل الإلكتروني في المدارس الحكومية</span></a></li>
                                            <li><a href="/Service.aspx?service=PreTransferStudent"><span>
                                                النقل الإلكتروني في المدارس الحكومية</span></a></li>
                                            <li><a href="/Service.aspx?service=EnrollParallelStudent"><span>
                                                (التسجيل الإلكتروني لطلبة تعليم الكبار (المسار الموازي</span></a></li>
                                            <li><a href="/Service.aspx?service=EnrollHomeStudent"><span>
                                                التسجيل الإلكتروني لطلبة تعليم الكبار</span></a></li>
                                            <li><a href="https://eduvcertificate.edu.gov.qa" target="_blank"><span>
                                                التحقق من الشهادات</span></a></li>
                                            <li><a href="https://certificate.edu.gov.qa" target="_blank"><span>
                                                معادلة الشهادات 
                                            </span></a></li>
                                            <li><a href="https://tawtheef.edu.gov.qa/" target="_blank"><span>
                                                التوظيف
                                            </span></a></li>

                                            <li><a href="/Service.aspx?service=RequestException"><span>
                                                الخدمات الإضافية لتسجيل ونقل الطلبة في المدارس الحكومية
                                            </span></a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            <span>
                                            الأسئلة الشائعة
                                        </span>
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu multi-level">
                                            <li><a href="/FAQ/hr.aspx"><span>
                                                الموارد البشرية
                                            </span></a></li>
                                            <li><a href="/FAQ/Voucher.aspx">
                                                القسائم التعليمية
                                                <span></span></a></li>
                                            <li><a href="/FAQ/Scholarship.aspx"><span>
                                                البعثات</span></a></li>
                                            <li><a href="/FAQ/Pso.aspx"><span>
                                                المدارس الخاصة
                                            </span></a></li>
                                            <li><a href="/FAQ/SchoolAffair.aspx"><span>
                                                شؤون المدارس</span></a></li>
                                            <li><a href="/FAQ/UniEquCertificate.aspx"><span>
                                                معادلة الشهادات الجامعية
                                            </span></a></li>
                                        </ul>

                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>
                                            أدلة الاستخدام

                                        </span>
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu multi-level">
                                            <li><a href="https://fs-nsis.edu.gov.qa/EduServices/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%AE%D8%AF%D8%A7%D9%85%20%D9%84%D8%AE%D8%AF%D9%85%D8%A9%20%D8%A7%D8%B5%D8%AF%D8%A7%D8%B1%20%D8%A7%D9%84%D8%B4%D9%87%D8%A7%D8%AF%D8%A7%D8%AA.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمة اصدار الشهادات
                                            </span></a></li>
                                            <li><a href="https://fs-nsis.edu.gov.qa/EduServices/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%AE%D8%AF%D8%A7%D9%85%20%D9%84%D8%AE%D8%AF%D9%85%D8%A9%20%D8%B1%D8%B3%D9%88%D9%85%20%D8%A7%D9%84%D9%83%D8%AA%D8%A8%20%D9%88%20%D8%A7%D9%84%D9%85%D9%88%D8%A7%D8%B5%D9%84%D8%A7%D8%AA.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمة رسوم الكتب و المواصلات
                                            </span></a></li>
                                            <li><a href="https://fs-nsis.edu.gov.qa/EduServices/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%AE%D8%AF%D8%A7%D9%85%20%D9%84%D8%AE%D8%AF%D9%85%D8%A9%20%D8%B1%D8%B3%D9%88%D9%85%20%D8%AA%D8%B3%D8%AD%D9%8A%D9%84-%D8%AA%D8%B9%D9%84%D9%8A%D9%85%20%D8%A7%D9%84%D9%83%D8%A8%D8%A7%D8%B1.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمةرسوم التسجيل-تعليم الكبار
                                            </span></a></li>
                                            <li><a href=" https://fs-nsis.edu.gov.qa/EduServices/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%AE%D8%AF%D8%A7%D9%85%20%D9%84%D8%AE%D8%AF%D9%85%D8%A9%20%D8%A7%D9%84%D8%AA%D8%AD%D9%82%D9%82%20%D9%85%D9%86%20%D8%A7%D9%84%D8%B4%D9%87%D8%A7%D8%AF%D8%A7%D8%AA.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمة التحقق من الشهادات
                                            </span></a></li>
                                            <li><a href="https://certificate.edu.gov.qa/Lists/HETemplates/%D8%A7%D9%84%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%A5%D8%B1%D8%B4%D8%A7%D8%AF%D9%8A%20-%20%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AF%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D8%B7%D9%84%D9%88%D8%A8%D8%A9%20%D9%84%D9%85%D8%B9%D8%A7%D8%AF%D9%84%D8%A9%20%D8%A7%D9%84%D8%B4%D9%87%D8%A7%D8%AF%D8%A7%D8%AA.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمة معادلة الشهادة الجامعية 
                                            </span></a></li>
                                            <li><a href="https://certificate.edu.gov.qa/Lists/HETemplates/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D8%B3%D8%AA%D8%AE%D8%AF%D8%A7%D9%85%20%20%D9%86%D8%B8%D8%A7%D9%85%20%D9%85%D8%B9%D8%A7%D8%AF%D9%84%D8%A9%20%D8%A7%D9%84%D8%B4%D9%87%D8%A7%D8%AF%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D8%AF%D8%B1%D8%B3%D9%8A%D8%A9.pdf"
                                                    target="_blank"><span>
                                                دليل الاستخدام لخدمة معادلة الشهادات المدرسية
                                            </span></a></li>
                                            <li><a href="https://fs-nsis.edu.gov.qa/EduServices/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AE%D8%AF%D9%85%20%D9%84%D8%AE%D8%AF%D9%85%D8%A9%20%D8%A7%D9%84%D8%AA%D8%B3%D8%AC%D9%8A%D9%84%20%D8%A7%D9%84%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A%20%D9%81%D9%8A%20%D8%A7%D9%84%D9%85%D8%AF%D8%A7%D8%B1%D8%B3%20%D8%A7%D9%84%D8%AD%D9%83%D9%88%D9%85%D9%8A%D8%A9.pdf"
                                                    target="_blank"><span>
                                                دليل المستخدم لخدمة التسجيل الالكتروني في المدارس الحكومية
                                            </span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====================  End of header area  ====================-->

    <div class="site-wrapper-reveal">

        <div class="payment-hero__slider position-relative  section-space--pt_50 section-space--pb_120"></div>
        <div class="news-staps">

            <!--========= News Area ===========-->
            <div class="pricing-table-area section-space--pb_20 position-relative ">

                <div class="pricing-table-content-area">
                    <div class="container">
                        <div class="row pricing-table-two">
                            <div class="col-12">
                                <div ng-controller="loginControl" class="loginControl" style="text-align: center; padding:40px 10px; background: #99999926;">
                                    <h2 class="font-weight--bold mb-15 wow move-up animated" style="visibility: visible;">
                                        مرحبا بكم في بوابة خدمات الجمهور
                                    </h2>
                                    <p class="section-text wow move-up animated" style="visibility: visible;">
                                        يرجى استخدام نفس بيانات دخول التعليم الإلكتروني / أنظمة الوزارة أو تسجيل حساب جديد
                                    </p>
                                    <div style="margin: 20px;">
                                        اسم المستخدم
                                        <input type="text" ng-model="username" placeholder=' 290xxxx او a.mohamed ' style="width: 50%; border-radius: 10px; border: none; background: #dcdcdc; height: 60px; margin: 20px; padding: 20px; color: #333;" />
                                    </div>
                                    <div style="margin: 20px;">
                                        كلمة المرور
                                        <input type="password" ng-model="password" style="width: 50%; border-radius: 10px; border: none; background: #dcdcdc; height: 60px; margin: 0 20px; padding: 20px; color: #333;" />
                                    </div>
                                    <div style="margin-top: 20px; display: none" ng-show="errorMessage" class="hiddenonload">
                                        <div class="alert alert-danger" ng-bind="errorMessage"></div>
                                    </div>
                                    <div>
                                        <button id="btnLogin" ng-click="sendLoginRequest()" class="btn" ng-disabled="isLoading">الدخول</button>
                                        <div class="spinner-border hiddenonload" role="status" ng-show="isLoading" style="display: none;">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <a href="https://pwdreset.edu.gov.qa/ResetPassword.aspx?ReturnUrl=https%3a%2f%2feduservices.edu.gov.qa%2f">
                                        هل نسيت كلمة المرور؟
                                    </a>
                                    </div>

                                    <a style="font-size: 20px" href="Signup.aspx">
                                    تسجيل حساب جديد
                                </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--========= Pricing  Table End ===========-->
            </div>
        </div>


    </div>

    <!--====================  footer area ====================-->
    <div class="footer-area-wrapper reveal-footer">
        <div class="footer-area section-space--ptb_90">
            <div class="container">
                <div class="row footer-widget-wrapper">
                    <div class="col-lg-6 col-md-6 footer-widget footer-center">

                        <ul class="footer-widget__list">
                            <li>
                                <a href="javascript:void(0)" data-toggle="modal" data-target="#privacy-policy" class="">
                                    سياسة الخصوصية
                                </a>
                                <a href="javascript:void(0)" data-toggle="modal" data-target="#terms-con" class="">
                                    الأحكام والشروط
                                </a>
                            </li>
                        </ul>
                        <p class="copyright">
                            حقوق الملكية®2020 وزارة التعليم و التعليم العالي. جميع الحقوق محفوظة‎
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 footer-widget footer-left" style="margin-top: 40px">

                        <ul class="footer-widget__list-2">
                            <li>
                                <a href="http://instagram.com/Qatar_edu/" target="_blank">
                                    <img src="/assets/images/instagram.png" /></a>
                            </li>
                            <li>
                                <a href="https://twitter.com/Qatar_edu" target="_blank">
                                    <img src="/assets/images/twitter.png" /></a>
                            </li>
                            <li>
                                <a href="https://www.youtube.com/c/eduqatar" target="_blank">
                                    <img src="/assets/images/youtube.png" /></a>
                            </li>
                            <li>
                                <a href="https://www.facebook.com/Qatar.edu">
                                    <img src="/assets/images/facebook.png" /></a>
                            </li>
                        </ul>

                    </div>

                </div>
                <div class="floatted-menu">
                    <ul class="footer-widget__list-3">
                        <li>
                            <a href="https://www.sc.qa/ar/qatar" target="_blank">
                                <img src="/assets/images/Qatar2022logo.png" /></a>
                        </li>
                        <li>
                            <a href="https://mada.org.qa/" target="_blank">
                                <img src="/assets/images/g.png" style="filter: grayscale(1)" /></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--====================  End of footer area  ====================-->


    <!--====================  scroll top ====================-->
    <a href="javascript:void(0)" class="scroll-top" id="scroll-top">
        <i class="arrow-top fal fa-long-arrow-up"></i>
        <i class="arrow-bottom fal fa-long-arrow-up"></i>
    </a>
    <!--====================  End of scroll top  ====================-->

    <!-- jQuery JS -->

    <script src="/assets/js/bootstrap.bundle.min.rtl.js"></script>

    <script src="/assets/js/wow.min.js"></script>
    <script src="/assets/js/animation-text.min.js"></script>
    <script src="/assets/js/owl.js"></script>
    <script src="/assets/js/main.js"></script>




    <div class="modal fade" id="under-construction" tabindex="-1" role="dialog" aria-labelledby="under-construction" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        الموقع حالياً تحت الانشاء</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        عذراً ربما تجد بعض الصفحات غير مفعلة لذا برجاء الضغط على رابط اخر
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        اغلاق
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="contact" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        المساعدة
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        للمزيد من المساعدة برجاء التواصل معنا على الرقم المختصر 155
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        اغلاق</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="privacy-policy" tabindex="-1" role="dialog" aria-labelledby="privacy-policy" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        سياسة الخصوصية
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label='اغلاق'>
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>تحرص وزارة التعليم والتعليم العالي على حماية الخصوصية وتوفير بيئة إلكترونية آمنة، ولذلك لا تقوم الوزارة بجمع أي معلومات عنك عندما تقوم بزيارة موقعها الالكتروني، وفي حالة قيامك بتقديم معلومات بطوعك وعلمك فإن هذه المعلومات تعامل بكل
                        جدية وحذر وخصوصية، ولا يتم استخدام المعلومات الشخصية بصفة تجارية، كما أن الوزارة لا تقدم هذه المعلومات لأي طرف ثالث إلا وفقاً لمقتضيات القانون، أو في حالة أن جهة أخرى تقدمت باستفسارات شبيهة باستفساراتك.</p>
                    <p>إن هذا يعني أن الوزارة مسؤولة عن حماية المعلومات الشخصية الخاصة بهذا الموقع وليس المواقع الأخرى، ويشمل ذلك المواقع الأخرى المرتبطة بموقع الوزارة.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        اغلاق</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="terms-con" tabindex="-1" role="dialog" aria-labelledby="terms-con" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        الأحكام والشروط</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="text-align: right">
                    <p style="text-align: right">إن الدخول إلى أو استخدام موقع بوابة أولياء الأمور التعليمية لدى وزارة التعليم والتعليم العالي في قطر (eduservices.edu.gov.qa) له شروط وحالات وملاحظات مبينة أدناه في ("الاحكام والشروط"). من فضلك، اقرأ هذه الشروط بعناية حيث يعتبر استخدامك
                        لمحتويات الموقع هو موافقة لهذه الشروط. إننا نحتفظ بكامل الحق، بحسب ما نراه، في تغيير أو تعديل أو تحديث أو إضافة أو إلغاء أجزاء من شروط الخدمة في أي وقت، وسوف يعتبر استخدامك للموقع مشروط بشروط الخدمة والتي تتزامن مع وقت استخدامك
                        للموقع. بالإضافة إلى ذلك، عند استخدامك لخدمات معينة، فإنك عرضة لأية إرشادات تتعلق بهذه الخدمات أو لشركائنا في الخدمة. لابد أن تتفقد هذه الصفحة بشكل دوري لتتأكد من التغييرات التي تحدث. في حال عدم موافقتك على هذه الشروط، يجب أن تمتنع
                        فورا عن المضي في استخدام الموقع.</p>
                    <h5 style="margin: 10px 0">حقوق الملكية وملاحظات العلامة التجارية</h5>
                    <p style="text-align: right">يتم تشغيل موقع eduservices.edu.gov.qa عن طريق وزارة التعليم والتعليم العالي في قطر. إن جميع المواد المذكورة في موقع eduservices.edu.gov.qa هي محمية بالكامل طبقا للقوانين الدولية لحماية حقوق النشر والعلامات التجارية وعلامة الخدمة وحقوق
                        الملكية الفكرية الذي يقوم عليها موقع eduservices.edu.gov.qa لدولة قطر. إن هذه الحقوق سارية المفعول ومحمية بجميع الأشكال والوسائل الإعلامية وعلى سائر الوسائل التقنية المتوفرة حاليا أو المطورة مستقبلا.</p>
                    <h5 style="margin: 10px 0">الإقرار</h5>
                    <p style="text-align: right">يرجى قراءة هذا الإقرار بعناية قبل استخدام موقع eduservices.edu.gov.qa إن هذا الموقع تم إعداده بالشكل الذي هو عليه. ينكر موقع eduservices.edu.gov.qa بكل ما يسمح به القانون السّاري المفعول، ضمانات من أي نوع، تعبر أو تدل قصرا وليس حصرا،
                        على قدرتنا على عدم الخرق أو توفير الأمن، أو الدقة أو الاستمرارية. أنك تقر بأن استخدامك أو اعتمادك على هذا الموقع يقع على مسؤوليتك فقط وأنت المسؤول قطعيا عن أي ضياع أو إتلاف قد ينتج عن هذا الاستخدام. إن eduservices.edu.gov.qa لا
                        يقدم أية ضمانات، ذات تعبير أو دلالة، بشأن تشغيل هذا الموقع، أو الخادمات التي يملكها، أو أية معلومات يحتويها أو المقدمة من قبل هذا الموقع تشمل بشكل غير حصري أية ضمانات بأن هذه الخدمة لن يتم خرقها، أو أنها ستكون متوفرة باستمرار،
                        أو على مدار الوقت، أو أمينة، أو خالية من الأخطاء، أو خالية من الفيروسات أو أجزاء ضارة أخرى. تحت أي ظرف من الظروف، يكون فيها موقع eduservices.edu.gov.qa معرضا لأي ضياع أو ضرر من أي نوع، بحيث كان متوقعا أم لا، يشمل ولا يقتصر على
                        أضرار مباشرة أو غير مباشرة عارضة وقاسية وخاصة وناتجة جراء استخدام هذا الموقع، تشمل ولا تقتصر على الدقة، أو حسن التوقيت، أو الاستمرارية، أو الحذف، أو الفشل في أي اتصال أو دفع، أو ضمن الإطار الشخصي. بالرغم من توفير موقع eduservices.edu.gov.qa
                        لمجموعة من الروابط لمواقع أخرى، فإن موقع eduservices.edu.gov.qa لا يمثل، أو يقدم ضمانات بشأن أي موقع نقوم بتوفير ربط له عبر موقعنا، يشمل ولا يقتصر على، تمثيل أو ضمانات بشأن الجودة، أو الدقة، أو استمرارية مثل هذه المواقع.</p>
                    <h5 style="margin: 10px 0">الحصر والاستمرارية</h5>
                    <p style="text-align: right">
                        تحت أي ظرف من الظروف، يكون موقع eduservices.edu.gov.qa أو فروعه معرضا لأي ضرر مباشر أو غير مباشر أو قاسي أو عرضي أو خاص كان متوقعا أم لا، ينتج جراء استخدام أو عدم القدرة على استخدام محتويات وخدمات موقع eduservices.edu.gov.qa أو مواد أو منتجات أو خدمات
                        الطرف الثالث المتوفرة عبر موقع eduservices.edu.gov.qa بغض النظر ما إذا كانت هذه المسؤولية المزعومة تستند إلى عقد، أو جنحة، أو إهمال، أو مسؤولية صارمة أو أي أمور أخرى. إذا كنت مستاء من محتويات أو خدمات موقع eduservices.edu.gov.qa
                        أو شروط الخدمة له، فإن الحل الحصري الأوحد هو الكف عن استخدام موقع eduservices.edu.gov.qa وذلك لأن بعض السلطات القضائية لا تسمح باستبعاد أو الحد من أنواع معينة من الأضرار، تكون مسؤولية موقع eduservices.edu.gov.qa محصورة بما يسمح
                        به القانون.
                    </p>
                    <h5 style="margin: 10px 0">سياسة السرية</h5>
                    <p style="text-align: right">يحتفظ موقع eduservices.edu.gov.qa بالحق في التصريح في جميع الأوقات بمعلومات ذات ضرورة لتتماشى مع قانون، أو لائحة أو طلب حكومي. إن سياسة السرية لدينا متماشية مع شروط الخدمة. وإنه بقبولك لشروط الخدمة، فإنك توافق على استخدامنا و إفشائنا
                        لمعلوماتك المعروفة شخصيًّا بوضوح وفقًا لمصطلحات سياسة السّرّيّة. في حال قيامنا بتغيير سياستنا السرية، سنقوم بتغييرها في صفحة سياسة السرية الخاصة بالموقع حيث تكون دائما على اطلاع بالمعلومات الشخصية التي نجمعها وكيف نستخدمها وتحت
                        أية ظروف نقوم بإفشائها.</p>
                    <h5 style="margin: 10px 0">روابط المواقع عبر موقع eduservices.edu.gov.qa </h5>
                    <p style="text-align: right">لا تخضع المواقع التي يوجد لها ربط في موقع eduservices.edu.gov.qa لسيطرة موقع eduservices.edu.gov.qa ولا يظهر الموقع أية مسؤولية تجاهك جراء حدوث ضرر، بخصوص اتصالات أو محتويات في تلك المواقع. إن موقع eduservices.edu.gov.qa لا يعتزم وجود
                        روابط على موقع وزارة التعليم والتعليم العالي بمثابة نقل أو تأييد لما تحتويه تلك المواقع، وإنما وجودها فقط مرتبط بمدى ملاءمتها لمحتويات موقع وزارة التعليم والتعليم العالي. إنك تقر بإعفاء موقع eduservices.edu.gov.qa وفروعه من أية
                        أضرار تتحملها أنت كما توافق على عدم الإصرار على المطالبة بتعويضات ضد الموقع جراء استخدامك لأي من منتجاته أو الخدمات المتوفرة عبر موقع eduservices.edu.gov.qa من شريكه الثالث.</p>
                    <h5 style="margin: 10px 0">الفصل</h5>
                    <p style="text-align: right">
                        لموقع eduservices.edu.gov.qa الحق الكامل، بحسب رؤيته، في إلغاء حقك في استخدام موقع وزارة التعليم والتعليم العالي أو جزء منه في أي وقت مع أو بدون إبداء الأسباب. كما للموقع الحق الكامل في منعك الفوري من استخدام الموقع في حال اشتراكك في أي تصرف يبين أن الموقع،
                        حسب توجهه، يعتبر غير مقبول، أو غير شرعي، أو بسبب مخالفة شروط الخدمة للموقع، بدون تحديد لحجم هذ التخلي. في حال الإلغاء، لم يعد مصرح لك استخدام الجزء من الموقع المتأثر بالمنع. ومع ذلك المنع، ستستمر القيود المفروضة عليك حسب شروط الخدمة.
                        إنك تقر بأن موقع eduservices.edu.gov.qa لا يتحمل أية مسؤولية تجاهك أو تجاه الشريك الثالث جراء هذا المنع.
                    </p>
                    <h5 style="margin: 10px 0">الاتفاقية الكاملة</h5>
                    <p style="text-align: right">
                        تمثل شروط الخدمة الاتفاقية الكاملة بين موقع eduservices.edu.gov.qa وبينك بخصوص الموضوع المحتوى في هذه الاتّفاقيّة و يلغي كلّ الاتّفاقيّات المعاصرة السّابقة، والاقتراحات والاتصالات سواء كانت مكتوبة أو شفوية. كما إنه ليس لمسار السلوك بين الشركاء ولا للخبرة
                        التجارية أن تحدث تعديلا تحت شروط الخدمة. إن أيّ فشل بالنسبة لموقع وزارة التعليم والتعليم العالي لتطبيق الانصياع الصّارم لشروط الخدمة هذه لن يُفَسَّر كتنازل عن أيّ من حقوقه التالية، أيّ تنازل عن مخالفة لشروط الخدمة بالنسبة لموقع
                        eduservices.edu.gov.qa، لن يُعْتَبَر تنازلاً عن أيّ مخالفة لاحقة أو سابقة . أنت أيضًا قد تكون عرضة للبنود والشّروط الإضافيّة التي قد تنطبق عندما تستخدم الخدمات لطرف ثالث عبر موقع eduservices.edu.gov.qa. في حالة أيّ نزاع بين أيّ
                        بنود وشروط الطّرف الثّالث هذا و شروط الخدمة هذه، فإن شروط الخدمة هذه ستسود. إذا اعتبر أيّ امتداد لهذه الاتّفاقيّة غير شرعيّ، أو باطل أو غير مفترض لأي سبب، فإنه سيُفَسَّر إلى حدّ ما متوافقا مع القانون السّاري المفعول، تقريبًا بقدر
                        الإمكان، ليعكس النوايا الأصليّة للأطراف، أو الفشل في أيّ تفسير من هذا القبيل والذي سيجعل الامتداد صحيح، اُعْتُبِرَ قابلا للفصل من هذه الاتّفاقيّة دون أن يؤثّر على الصّلاحيّة و إمكانيّة تنفيذ الأجزاء المتبقّية لشروط الخدمة التي
                        ستبقى بكامل سلطتها.
                    </p>
                    <h5 style="margin: 10px 0">القانون الحاكم</h5>
                    <p style="text-align: right">هذه الاتّفاقيّة ستُحْكَم بواسطة وتفسّر وفقًا لقوانين دولة قطر بدون تنفيذ أيّ مبادئ أو متعارضات مع بنود القانون. إنك توافق بموجب هذا و تخضع للسّلطة القضائيّة الشّخصيّة الخاصّة لدولة قطر، بخصوص كلّ المطالبات و جدل جراء استعمالك لهذا
                        الموقع بناء على هذه الاتّفاقيّة</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        اغلاق</button>
                </div>
            </div>
        </div>
    </div>


    <style>
        /*.modal-header .close {
            left: 0;
            position: absolute;
        }*/
        
        .modal-body p {
            text-align: center
        }
        
        .btn {
            background: #ac0031;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
        }
    </style>
</body>

</html>
<script id="f5_cspm">
    (function() {
        var f5_cspm = {
            f5_p: 'GGPMBFEGGLOKBBOEDEJLNAFCEDDMGIOCCGFJMOOAPEFDAGEJKMCNLMHHEHIBFALGODHNJLEMNCIBMFGAGECDFHGBBOOAPKPLAAFMMDMKBKDLOJKNAAIPPOGEEONEILMK',
            setCharAt: function(str, index, chr) {
                if (index > str.length - 1) return str;
                return str.substr(0, index) + chr + str.substr(index + 1);
            },
            get_byte: function(str, i) {
                var s = (i / 16) | 0;
                i = (i & 15);
                s = s * 32;
                return ((str.charCodeAt(i + 16 + s) - 65) << 4) | (str.charCodeAt(i + s) - 65);
            },
            set_byte: function(str, i, b) {
                var s = (i / 16) | 0;
                i = (i & 15);
                s = s * 32;
                str = f5_cspm.setCharAt(str, (i + 16 + s), String.fromCharCode((b >> 4) + 65));
                str = f5_cspm.setCharAt(str, (i + s), String.fromCharCode((b & 15) + 65));
                return str;
            },
            set_latency: function(str, latency) {
                latency = latency & 0xffff;
                str = f5_cspm.set_byte(str, 48, (latency >> 8));
                str = f5_cspm.set_byte(str, 49, (latency & 0xff));
                str = f5_cspm.set_byte(str, 43, 2);
                return str;
            },
            wait_perf_data: function() {
                try {
                    var wp = window.performance.timing;
                    if (wp.loadEventEnd > 0) {
                        var res = wp.loadEventEnd - wp.navigationStart;
                        if (res < 60001) {
                            var cookie_val = f5_cspm.set_latency(f5_cspm.f5_p, res);
                            window.document.cookie = 'f5avr0418675030aaaaaaaaaaaaaaaa=' + encodeURIComponent(cookie_val) + ';path=/';
                        }
                        return;
                    }
                } catch (err) {
                    return;
                }
                setTimeout(f5_cspm.wait_perf_data, 100);
                return;
            },
            go: function() {
                var chunk = window.document.cookie.split(/\s*;\s*/);
                for (var i = 0; i < chunk.length; ++i) {
                    var pair = chunk[i].split(/\s*=\s*/);
                    if (pair[0] == 'f5_cspm' && pair[1] == '1234') {
                        var d = new Date();
                        d.setTime(d.getTime() - 1000);
                        window.document.cookie = 'f5_cspm=;expires=' + d.toUTCString() + ';path=/;';
                        setTimeout(f5_cspm.wait_perf_data, 100);
                    }
                }
            }
        }
        f5_cspm.go();
    }());
</script>