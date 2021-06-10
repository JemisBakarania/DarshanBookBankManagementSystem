<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookInventory.aspx.cs" Inherits="AdminPanel_Book_AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Book Inventory 
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
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" runat="server" CssClass="nav-link active">
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
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/AdminPanel/AdminUser/AdminUserProfile.aspx" runat="server" CssClass="nav-link">
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Book Inventory 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Book Inventory 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMainArea" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="card" style="width: 25rem; margin-left:30%; box-shadow: 0 0 2rem 0 rgba(136, 152, 170, .60);" >
                <asp:Image ID="imgAddBook" ImageUrl="~/Content/img/theme/bookinventor.jpg" runat="server" CssClass="card-img-top" />

                <div class="card-body">
                    <h5 class="card-title" style="text-align:center;">What You Want To Do ..?</h5>
                    <div style="text-align:center;">
                        <asp:HyperLink Width="40%" runat="server" ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/AddBook.aspx" CssClass="btn btn-outline-success btn-lg" Text="Add"></asp:HyperLink>
                        <asp:HyperLink Width="40%" runat="server" ID="hlEditBook"  NavigateUrl="~/AdminPanel/Book/EditBook.aspx" CssClass="btn btn-outline-info btn-lg" Text="View"></asp:HyperLink>
                    </div>
                    
                </div>
            </div>
<%--            <asp:HyperLink runat="server" ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/AddBook.aspx" CssClass="btn btn-outline-success btn-lg" Text="Add"></asp:HyperLink>--%>
<%--            <button onclick="AddBook()" style="padding:60px; float:right;" type="button" class="btn btn-outline-success btn-lg"></button>--%>
        </div>   
    </div>
    <span class="text-light">*Note: In View option Admin can edit the list of the Books.</span>
    
</asp:Content>


