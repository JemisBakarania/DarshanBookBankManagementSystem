<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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
                title: 'Succesfully Registered',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
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
                                <a href="Login.aspx" class="nav-link">
                                    <span class="nav-link-inner--text">Login</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
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
                                    <h1 class="text-white">Create an account</h1>
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
                    <!-- Table -->
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-8">
                            <div class="card bg-secondary border-0">
                                <div class="card-body px-lg-5 py-lg-5">
                                    <div class="text-center text-muted mb-4">
                                        <h1>Sign-Up</h1>
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
                                                <asp:TextBox runat="server" ID="txtName" placeholder="Name" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Enter Your Name" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative mb-3">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="vgRegister" Display="Dynamic" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtPassword" placeholder="Password" CssClass="form-control" type="password"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vgRegister" Display="Dynamic" Font-Size="Small" ></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Enter valid Password <br> 1 Uppecase <br> 1 Lowercase <br> 1 Number <br> 1 Special character (@ # $ . , etc..) <br> At least 8 characters max 15." ControlToValidate="txtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$" ValidationGroup="vgRegister" ForeColor="Red" Display="Dynamic" Font-Size="Small"></asp:RegularExpressionValidator>
                                        </div>
                                         <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtReTypePassword" placeholder="Re-Type Password" CssClass="form-control" type="password"></asp:TextBox> 
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvRetypePassword" runat="server" ErrorMessage="Re-Type Password" ControlToValidate="txtReTypePassword" ForeColor="Red" ValidationGroup="vgRegister" Display="Dynamic" Font-Size="Small" ></asp:RequiredFieldValidator>
                                             <asp:CompareValidator ID="RetypePassword" runat="server" ErrorMessage="Password must be same" ControlToCompare="txtPassword" ControlToValidate="txtReTypePassword" ForeColor="Red" ValidationGroup="vgRegister" Display="Dynamic" Font-Size="Small"></asp:CompareValidator>
                                         </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">&ensp;</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-mobile-button"></i></span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtMobile" placeholder="Mobile No.." CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Enter Valid Mobile No (10 Digit)" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" Display="Dynamic" Font-Size="Small" ForeColor="Red" ValidationGroup="vgRegister"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                                </div>
                                                <asp:DropDownList ID="ddlInstitute" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvInstitute" runat="server" ErrorMessage="Select Institute" ControlToValidate="ddlInstitute" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small" InitialValue="-1"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">*</span>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-ruler-pencil"></i></span>
                                                </div>
                                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="Select Branch" ControlToValidate="ddlBranch" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small" InitialValue="-1"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" Text="Choose Your ProilePicture (Optional)" CssClass="form-control" Font-Bold="True"></asp:Label>
                                            <div class="input-group input-group-merge input-group-alternative">
                                                <span class="input-group-text" style="color: red;">&ensp;</span>
                                                
                                                <asp:FileUpload CssClass="form-control custom-file-label" ID="fuAdminpic" runat="server" />
                                                <asp:Label CssClass="text-danger" ID="lblFileUploadMessge" runat="server"></asp:Label>
                                            </div>
                                            <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ErrorMessage="Upload Only (.jpeg or .png) File" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$" ForeColor="Red" Display="Dynamic" ValidationGroup="vgRegister" Font-Size="Small" ControlToValidate="fuAdminpic"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label class="custom-toggle">
                                                        <asp:CheckBox ID="chkAgree" runat="server" />
                                                        <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>
                                                    </label>
                                                </div>
                                                <div class="col-md-10">
                                                    <asp:Label ID="lblCheckAgree" runat="server" CssClass="" Text="I agree to the terms and conditions."></asp:Label>
                                                </div>
                                                <asp:CustomValidator runat="server" ID="cvCheckAgree"
                                                    ClientValidationFunction="abc"
                                                    ErrorMessage="Kindly, Agree this terms and conditions."
                                                    ForeColor="Red"
                                                    Display="Dynamic"
                                                    ValidationGroup="vgRegister"
                                                    Font-Size="Small"></asp:CustomValidator>
                                            </div>
                                            <div class="text-center">
                                                <asp:Button ID="btnCreateAccount" runat="server" CssClass="btn btn-primary mt-4" Text="Create account" ValidationGroup="vgRegister" OnClick="btnCreateAccount_Click" />
                                            </div>
                                    </form>
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
    <script type="text/javascript">
        function abc(source, args) {
            var elem = document.getElementById('<%= chkAgree.ClientID %>');
            if (elem.checked) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
    </script>
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
