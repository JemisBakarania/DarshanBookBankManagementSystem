<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #172b4d;">
            <!-- Navbar -->
            <nav id="navbar-main" class="navbar navbar-horizontal navbar-transparent navbar-main navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand" href="dashboard.html">
                        <asp:Image ImageUrl="~/Content/img/brand/White.png" runat="server" />

                    </a>
                    <h2 class="text-white" style="margin-top: 10px; margin-right: 20px;">BookBank</h2>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse navbar-custom-collapse collapse" id="navbar-collapse">
                        <ul class="navbar-nav mr-auto">
                            
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <span class="nav-link-inner--text">Login</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="Register.aspx" class="nav-link">
                                    <span class="nav-link-inner--text">Register</span>
                                </a>
                            </li>
                        </ul>
                        <hr class="d-lg-none" />

                    </div>
                </div>
            </nav>

            <!-- Main content -->
            <div class="main-content">
                <!-- Header -->
                <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
                    <div class="container">
                        <div class="header-body text-center mb-7">
                            <div class="row justify-content-center">
                                <div class="col-xl-5 col-lg-6 col-md-8 px-5">
                                    <h1 class="text-white">Welcome!</h1>
                                    <p class="text-lead text-white">Use these awesome forms to login or create new account in your project for free.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="separator separator-bottom separator-skew zindex-100">
                        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
                            <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
                        </svg>
                    </div>
                </div>
                <!-- Page content -->
                <div class="container mt--8 pb-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-7">
                            <div class="card bg-secondary border-0 mb-0">

                                <div class="card-body px-lg-5 py-lg-5">
                                    <div class="text-center text-muted mb-4">
                                        <h1>Sign-In</h1>
                                    </div>
                                    <form role="form">
                                        <div>
                                            <asp:Label CssClass="text-danger" runat="server" ID="lblMessage"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative mb-3">

                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" style="color: red;">*</span>
                                                    <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtName" placeholder="Admin User Name" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Enter Your Name" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtPassword" placeholder="Password" CssClass="form-control" type="password"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vgRegister" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <%--                                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Enter valid Password <br> 1 Uppecase <br> 1 Lowercase <br> 1 Number <br> 1 Special character (@ # $ . , etc..) <br> At least 8 characters max 15." ControlToValidate="txtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$" ValidationGroup="vgRegister" ForeColor="Red" Display="Dynamic" Font-Size="Small"></asp:RegularExpressionValidator>--%>
                                        </div>
                                        <div class="text-center">
                                            <asp:Button ID="btnSignIn" runat="server" CssClass="btn btn-primary mt-4" Text="Sign in" ValidationGroup="vgRegister" OnClick="btnSignIn_Click"/>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12 text-right">
                                    <a href="./Register.aspx" class="text-light"><small>Create new account</small></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="py-5" id="footer-main">
                <div class="container">
                    <div class="row align-items-center justify-content-xl-between">
                        <div class="col-xl-6">
                            <div class="copyright text-center text-xl-left text-muted">
                                &copy; 2020 <a href="" class="font-weight-bold ml-1" target="_blank">Darshan Book Bank</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </form>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery/dist/jquery.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/bootstrap/dist/js/bootstrap.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/js-cookie/js.cookie.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery.scrollbar/jquery.scrollbar.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js") %>"></script>

    <script src="<%=ResolveClientUrl("~/Content/vendor/chart.js/dist/Chart.min.js") %>"></script>
    <script src="<%=ResolveClientUrl("~/Content/vendor/chart.js/dist/Chart.extension.js") %>"></script>

    <script src="<%=ResolveClientUrl("~/Content/js/argon.js?v=1.2.0") %>"></script>
</body>
</html>
