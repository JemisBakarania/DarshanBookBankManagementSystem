<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="AdminPanel_Student_AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Add Student
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cphSidenav" runat="server">
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
                            <asp:HyperLink ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" runat="server" CssClass="nav-link">
                                    <i class="ni ni-single-copy-04 text-info"></i>
                                    <span class="nav-link-text">Book Inventory</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="hlStudentrofile" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" runat="server" CssClass="nav-link active">
                                    <i class="ni ni-single-02 text-yellow"></i>
                                    <span class="nav-link-text">Student Profile</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/AdminPanel/AdminUser/AdminUserProfile.aspx" runat="server" CssClass="nav-link">
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" Text="Student Profile"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumThird" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    <asp:Label Text="Add Student" ID="lblBread" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    <asp:Label Text="Add Student" ID="lblTitle" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphMainArea" runat="Server">
    <div class="container ">
        <div>
            <asp:Label CssClass="text-danger" runat="server" ID="lblMessage"></asp:Label>
        </div>
        <div class="row" style="padding: 20px;">

            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblStudentName" Text="Name " runat="server"></asp:Label>
                    <asp:TextBox ID="txtStudentName" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ErrorMessage="Enter Student Name" ControlToValidate="txtStudentName" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblEnrollmentNo" Text="Entrollment No" runat="server"></asp:Label>
                    <asp:TextBox ID="txtEnrollmentNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEnrollmentNo" runat="server" ErrorMessage="Enter EnrollmentNo" ControlToValidate="txtEnrollmentNo" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEnrollmentNo" runat="server" ErrorMessage="Enter Valid Entrollment No (12 Digit)" ControlToValidate="txtEnrollmentNo" ValidationExpression="[0-9]{12}" Display="Dynamic" Font-Size="Small" ForeColor="Red" ValidationGroup="vgAdd"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblEmail" Text="Email " runat="server"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="vgAdd" Font-Size="Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblSemester" Text="Semester" runat="server"></asp:Label>
                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ErrorMessage="Select Semester" ControlToValidate="ddlSemester" ForeColor="Red" Display="Dynamic" ValidationGroup="vgAdd" Font-Size="Small" InitialValue="-1"></asp:RequiredFieldValidator>
                    <%--<asp:TextBox ID="txtSemester" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>--%>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="co-md-6" style="margin-left: 25%;">
                <div class="form=group">
                    <asp:Button ValidationGroup="vgAdd" ID="btnAdd" Width="300%" CssClass="btn btn-outline-success" Text="ADD" runat="server" OnClick="btnAdd_Click" />
                </div>

            </div>
            <div class="co-md-6" style="margin-left: 20%;">
                <div class="form=group">
                    <asp:Button ID="Button1" Width="300%" CssClass="btn btn-outline-danger" Text="Cancel" runat="server" OnClick="Button1_Click"  />
                </div>

            </div>
        </div>
    </div>
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
</asp:Content>

