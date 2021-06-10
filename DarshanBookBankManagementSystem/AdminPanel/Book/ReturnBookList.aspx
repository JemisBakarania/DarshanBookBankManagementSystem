<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnBookList.aspx.cs" Inherits="AdminPanel_Book_ReturnBookList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Return Book
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
                            <asp:HyperLink ID="hlReturnBook" NavigateUrl="~/AdminPanel/Book/ReturnBook.aspx" runat="server" CssClass="nav-link active">
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
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumSecond" Runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/ReturnBook.aspx" Text="Return Book"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumThird" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" Runat="Server">
    Book-Student List
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphTitleOfArea" Runat="Server">
    Book / Student List


</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphMainArea" Runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Book Returned',
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
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label ID="lblDetails" Text="Remarks For Student (Optional)" runat="server"></asp:Label>
                    <asp:TextBox ID="txtDetails" runat="server" placeholder="Enter Here ... " CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        
        
        <div class="row" style="padding: 20px;">
            <div class="co-md-12" style="margin-left: 30%;">
                <div class="form-group">
                    <asp:Button ID="btnReturn" Width="500%" CssClass="btn btn-outline-warning" Text="Return" runat="server" OnClick="btnReturn_Click"/>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

