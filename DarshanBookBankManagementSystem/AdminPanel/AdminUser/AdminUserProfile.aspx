<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUserProfile.aspx.cs" Inherits="AdminPanel_AdminUser_AdminUserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin User Profile
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <!-- Favicon -->
    <link rel="icon" href="<%=ResolveClientUrl("~/Content/img/brand/favicon.png") %>" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="<%=ResolveClientUrl("~/Content/vendor/nucleo/css/nucleo.css") %>" type="text/css">
    <link rel="stylesheet" href="<%=ResolveClientUrl("~/Content/vendor/@fortawesome/fontawesome-free/css/all.min.css") %>" type="text/css">
    <!-- Page plugins -->
    <!-- Argon CSS -->
    <link rel="stylesheet" href="<%=ResolveClientUrl("~/Content/css/argon.css?v=1.2.0") %>" type="text/css">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Profile Updated',
                showConfirmButton: false,
                timer: 2500
            })
        }

        function alert() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Profile Picture Updated',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidenav -->
        <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
            <div class="scrollbar-inner">
                <!-- Brand -->
                <div class="sidenav-header  align-items-center" style="margin-top: 30px;">

                    <asp:Image ImageUrl="~/Content/img/brand/Logo.png" Height="160px" runat="server" />
                </div>
                <div class="navbar-inner" style="margin-top: 70px;">
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                        <!-- Nav items -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <asp:HyperLink ID="hlHomePage" NavigateUrl="~/HomePage.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-tv-2 text-primary"></i>
                                    <span class="nav-link-text">Home</span>
                                </asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="hlIssueBook" NavigateUrl="~/AdminPanel/Book/IssueBook.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-books text-orange"></i>
                                    <span class="nav-link-text">Issue Book</span>
                                </asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="hlReturnBook" NavigateUrl="~/AdminPanel/Book/ReturnBook.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-book-bookmark text-pink"></i>
                                    <span class="nav-link-text">Return Book</span>
                                </asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" runat="server" CssClass="nav-link ">
                                    <i class="ni ni-single-copy-04 text-info"></i>
                                    <span class="nav-link-text">Book Inventory</span>
                                </asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="hlStudentrofile" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-single-02 text-yellow"></i>
                                    <span class="nav-link-text">Student Profile</span>
                                </asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="#" runat="server" CssClass="nav-link active">
                                    <i class="ni ni-settings"></i>
                                    <span class="nav-link-text">My Profile</span>
                                </asp:HyperLink>
                            </li>

                        </ul>
                        <!-- Divider -->
                        <hr class="my-3">
                        <!-- Heading -->

                        <!-- Navigation -->

                    </div>
                </div>
            </div>
        </nav>
        <!-- Main content -->
        <div class="main-content" id="panel">
            <!-- Topnav -->
            <nav class="navbar navbar-top navbar-expand navbar-dark bg-default border-bottom">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Search form -->
                        <div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                            <div class="form-group mb-0">
                                <div class="input-group input-group-alternative input-group-merge">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                    </div>
                                    <asp:TextBox CssClass="form-control" placeholder="Search" runat="server"></asp:TextBox>
                                    <%--<input class="form-control" placeholder="Search" type="text">--%>
                                </div>
                            </div>
                            <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <!-- Navbar links -->
                        <ul class="navbar-nav align-items-center  ml-md-auto ">
                            <li class="nav-item d-xl-none">
                                <!-- Sidenav toggler -->
                                <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
                            <li class="nav-item dropdown">
                                <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="media align-items-center">
                                        <span class="avatar avatar-sm rounded-circle">
                                            <asp:Image ID="imgProfile" ImageUrl="~/Content/img/theme/ProfilePic.png" runat="server" CssClass=" " />
                                        </span>
                                        <div class="media-body  ml-2  d-none d-lg-block">
                                            <span class="mb-0 text-sm  font-weight-bold">
                                                <asp:Label ID="lblNameMassege" Text="User Name" runat="server"></asp:Label>
                                            </span>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-menu  dropdown-menu-right ">
                                    <div class="dropdown-header noti-title">
                                        <h6 class="text-overflow m-0">Welcome!</h6>
                                    </div>
                                    <asp:HyperLink runat="server" NavigateUrl="#" CssClass="dropdown-item">
                                        <i class="ni ni-single-02"></i>
                                        <span>My profile</span>
                                    </asp:HyperLink>
                                    <%-- <asp:HyperLink runat="server" NavigateUrl="#" CssClass="dropdown-item">
                                        <i class="ni ni-settings-gear-65"></i>
                                        <span>Settings</span>
                                    </asp:HyperLink>--%>
                                    <%--<a href="#!" class="dropdown-item">
                                        <i class="ni ni-calendar-grid-58"></i>
                                        <span>Activity</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        <i class="ni ni-support-16"></i>
                                        <span>Support</span>
                                    </a>--%>
                                    <div class="dropdown-divider"></div>
                                    <asp:HyperLink NavigateUrl="~/Login.aspx" CssClass="dropdown-item" runat="server">
                                    
                                        <i class="ni ni-user-run"></i>
                                        <span>Logout</span>
                                    </asp:HyperLink>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header -->
            <!-- Header -->
            <div class="header pb-6 d-flex align-items-center" style="min-height: 500px; background-image: url(../../Content/img/theme/ACfJ9c.jpg); background-size: cover; background-position: center top;">
                <!-- Mask -->
                <span class="mask bg-gradient-default opacity-8"></span>
                <!-- Header container -->
                <div class="container-fluid d-flex align-items-center">
                    <div class="row">
                        <div class="col-lg-7 col-md-10">
                            <h1 class="display-2 text-white">Hello ,
                                <asp:Label ID="lblNameMassege2" Text="User Name" runat="server"></asp:Label>
                            </h1>
                            <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made with your work and manage your projects or assigned tasks</p>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Page content -->
            <div class="container-fluid mt--6">
                <div class="row">
                    <div class="col-xl-4 order-xl-2">
                        <div class="card card-profile">
                            <asp:Image ImageUrl="~/Content/img/theme/img-1-1000x600.jpg" CssClass="card-img-top" runat="server" />

                            <div class="row justify-content-center">
                                <div class="col-lg-3 order-lg-2">
                                    <div class="card-profile-image">
                                        <a href="#">
                                            <asp:Image ID="imgProfile2" ImageUrl="~/Content/img/theme/ProfilePic.png" runat="server" CssClass="rounded-circle " />
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                                <div class="d-flex justify-content-between">
                                    <asp:Button runat="server" CssClass="btn btn-sm btn-info  mr-4" Text="Refresh" />
                                    <asp:Button runat="server" CssClass="btn btn-sm btn-danger float-right" Text="LogOut" OnClick="Unnamed7_Click" />
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="row">
                                    <div class="col">
                                        <div class="card-profile-stats d-flex justify-content-center">
                                            <div>
                                                <h5 class="h3">
                                                    <asp:Label Text="Registered Date" runat="server" ID="lblRegisteredDate"></asp:Label>
                                                </h5>
                                                <span class="description">Account Created</span>
                                            </div>
                                            <%--<div>
                                                <span class="heading">10</span>
                                                <span class="description">Photos</span>
                                            </div>--%>
                                            <div>
                                                <h5 class="h3">
                                                    <asp:Label Text="Updated Date" runat="server" ID="lblUpdatedDate"></asp:Label>
                                                </h5>
                                                <span class="description">Last Update</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <h5 class="h3">
                                        <asp:Label runat="server" ID="lblNameMassege3" Text="User Name"></asp:Label>
                                    </h5>
                                    <div class="h5 font-weight-300">
                                        <asp:Label runat="server" ID="lblEmailDisplay" Text="User Email ID"></asp:Label>
                                    </div>
                                    <div class="h5 font-weight-300">
                                        <asp:Label runat="server" ID="lblMobileNoDisplay" Text="User Mobile No"></asp:Label>
                                    </div>
                                    <div class="h5 mt-4">
                                        <i class="ni business_briefcase-24 mr-2"></i>Working In - 
                                        <asp:Label runat="server" ID="lblDepartment" Text="User Department"></asp:Label>
                                    </div>
                                    <div>
                                        <i class="ni education_hat mr-2"></i>
                                        <asp:Label runat="server" ID="lblInstitute" Text="User  Institute"></asp:Label>
                                    </div>
                                    <div>
                                        <i class="ni education_hat mr-2"></i>
                                        Darshan University
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 order-xl-1">
                        <div class="card">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <h3 class="mb-0">Edit profile </h3>
                                    </div>
                                    <div class="col-4 text-right">
                                        <asp:Button ID="btnUpdate" ValidationGroup="vgUpdate" CssClass="btn btn-sm btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />

                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form>
                                    <h6 class="heading-small text-muted mb-4">User information</h6>
                                    <div class="pl-lg-4">
                                        <div>
                                            <asp:Label CssClass="text-danger" runat="server" ID="lblMessage"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:Label ID="lblUserName" runat="server" CssClass="form-control-label" Text="UserName"></asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUserName"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Enter Your Name" ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic" ValidationGroup="vgUpdate" Font-Size="Small"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:Label ID="lblEmail" runat="server" CssClass="form-control-label" Text="Email"></asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="vgUpdate" Font-Size="Small"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="vgUpdate" Display="Dynamic" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:Label ID="lblPassword" runat="server" CssClass="form-control-label" Text="Enter Password"></asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vgUpdate" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                                                    <%--                                         <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Enter valid Password <br> 1 Uppecase <br> 1 Lowercase <br> 1 Number <br> 1 Special character (@ # $ . , etc..) <br> At least 8 characters max 15." ControlToValidate="txtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$" ValidationGroup="vgUpdate" ForeColor="Red" Display="Dynamic" Font-Size="Small"></asp:RegularExpressionValidator>--%>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:Label ID="lblRetypePassword" runat="server" CssClass="form-control-label" Text="Re-Enter Password"></asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtRetypePassword"></asp:TextBox>
<%--                                                    <asp:RequiredFieldValidator ID="rfvRetypePassword" runat="server" ErrorMessage="Re-Type Password" ControlToValidate="txtRetypePassword" ForeColor="Red" ValidationGroup="vgUpdate" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>--%>
                                                    <asp:CompareValidator ID="RetypePassword" runat="server" ErrorMessage="Password must be same" ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" ForeColor="Red" ValidationGroup="vgUpdate" Display="Dynamic" Font-Size="Small"></asp:CompareValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <asp:Label ID="lblMobileNo" runat="server" CssClass="form-control-label" Text="Mobile No."></asp:Label>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtMobileNo"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Enter Valid Mobile No (10 Digit)" ControlToValidate="txtMobileNo" ValidationExpression="[0-9]{10}" Display="Dynamic" Font-Size="Small" ForeColor="Red" ValidationGroup="vgUpdate"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="my-4" />
                                    <div class="pl-lg-4">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <asp:Label runat="server" Text="Update Your ProilePicture (Optional)" CssClass="form-control" Font-Bold="True"></asp:Label>
                                                <div class="input-group input-group-merge input-group-alternative">
                                                    <span class="input-group-text" style="color: red;">&ensp;</span>

                                                    <asp:FileUpload CssClass="form-control custom-file-label" ID="fuAdminpic" runat="server" />
                                                    <asp:Label CssClass="text-danger" ID="lblFileUploadMessge" runat="server"></asp:Label>
                                                </div>
                                                <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ErrorMessage="Upload Only (.jpeg or .png) File" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$" ForeColor="Red" Display="Dynamic" ValidationGroup="vgUpdate" Font-Size="Small" ControlToValidate="fuAdminpic"></asp:RegularExpressionValidator>
                                            </div>

                                            <div class="col-md-5">
                                                <asp:Button runat="server" ID="btnUpload" Text="Upload" CssClass="btn btn-outline-warning btn-sm" OnClick="btnUploadProfilepic_Click" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Address -->
                                    <%--<h6 class="heading-small text-muted mb-4">Contact information</h6>
                                    <div class="pl-lg-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <asp:Label ID="lblDisplayName" runat="server" CssClass="form-control-label" Text="NAME."></asp:Label>
                                                </div>
                                                <div>
                                                    <span>Is form </span>
                                                    <asp:Label ID="Label1" runat="server" CssClass="" Text="B.E."></asp:Label><span> And Currently In </span>
                                                    <asp:Label ID="lblBranch" runat="server" CssClass="" Text="Computer Engineering"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>--%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <footer class="footer pt-0" style="margin-top: 10%;">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6">
                            <div class="copyright text-center  text-lg-left  text-muted">
                                &copy; 2020 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Darshan Book Bank</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

        </div>
    </form>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery/dist/jquery.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/bootstrap/dist/js/bootstrap.bundle.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/js-cookie/js.cookie.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery.scrollbar/jquery.scrollbar.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js") %>"></script>

    <script src="<%=ResolveClientUrl("~/Content/vendor/chart.js/dist/Chart.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/chart.js/dist/Chart.extension.js") %>"></script>

    <script src="<%=ResolveClientUrl("~/Content/js/argon.js?v=1.2.0") %>"></script>
</body>
</html>
