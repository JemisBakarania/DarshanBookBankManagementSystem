<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IssueBookFinal.aspx.cs" Inherits="AdminPanel_Book_IssueBookFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Issue book
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidenav" runat="Server">
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
                            <asp:HyperLink ID="hlIssueBook" NavigateUrl="~/AdminPanel/Book/IssueBook.aspx" runat="server" CssClass="nav-link active">
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
                            <asp:HyperLink ID="hlStudentrofile" NavigateUrl="~/AdminPanel/Student/StudentProfile.aspx" runat="server" CssClass="nav-link">
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
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/IssueBook.aspx" Text="Issue Book"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumThird" runat="Server">

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Book Issue Form
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Book Issue Form

    <div style="float:right;">
        <i class="ni ni-bold-left"></i>
        <asp:button id="btnBack" runat="server" text="Back" CssClass="btn btn-info btn-sm" OnClientClick="JavaScript:window.history.back(1); return false;" OnClick="btnCancel_Click" /> 
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cphMainArea" runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Book Issued',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
    <div class="container">
        <div>
            <asp:Label CssClass="text-danger text-bold" runat="server" ID="lblMessage"></asp:Label>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblEnrollmentNo" Text="Entrollment No" runat="server"></asp:Label>
                    <asp:TextBox ID="txtEnrollmentNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEnrollmentNo" runat="server" ErrorMessage="Enter EnrollmentNo" ControlToValidate="txtEnrollmentNo" ForeColor="Red" ValidationGroup="vgIssue" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEnrollmentNo" runat="server" ErrorMessage="Enter Valid Entrollment No (12 Digit)" ControlToValidate="txtEnrollmentNo" ValidationExpression="[0-9]{12}" Display="Dynamic" Font-Size="Small" ForeColor="Red" ValidationGroup="vgIssue"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        
        <div class="row" style="padding: 20px;">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblReturnDate" Text="Return Date" runat="server"></asp:Label>
                    <asp:TextBox ID="txtReturnDate" runat="server" type="date" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvReturnDate" runat="server" ErrorMessage="Select The Date" ControlToValidate="txtReturnDate" ForeColor="Red" ValidationGroup="vgIssue" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="co-md-12" style="margin-left: 30%;">
                <div class="form-group">
                    <asp:Button ID="btnIssue" Width="500%" ValidationGroup="vgIssue" CssClass="btn btn-outline-info" Text="Issue" runat="server" OnClick="btnIssue_Click"/>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

