<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookView.aspx.cs" Inherits="AdminPanel_Book_BookList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Book List
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
<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumThird" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Book List
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Book List

    <div style="float:right;">
        <i class="ni ni-bold-left"></i>
        <asp:button id="btnBack" runat="server" text="Back" CssClass="btn btn-info btn-sm" OnClientClick="JavaScript:window.history.back(1); return false;" OnClick="btnCancel_Click" /> 
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphMainArea" runat="Server">
    <div class="col-md-12 text-center">
        <div class="jemis card-profile" style="width:80%;">
            <div class="row">
                <div class="col-md-6">
                    <asp:Image  ID="imgBook"  CssClass="card-img-top" runat="server" />
                </div>
                <div class="col-md-6">
                    <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                        
                        <div style="margin-top:100px;" class="card-body pt-0">
                            <div class="text-center">
                                <div class="h5 font-weight-300">
                                <asp:Label runat="server" ID="Label1" Text="Book Name"></asp:Label><br />
                                </div>
                                <h5 class="h1">
                                    
                                    <asp:Label runat="server" ID="lblBookName" Text="Book Name"></asp:Label>
                                </h5>
                                <div class="h5 font-weight-300">
                                <asp:Label runat="server" ID="Label2" Text="Author Name"></asp:Label><br />
                                </div>
                                <h5 class="h3">
                                    <asp:Label runat="server" ID="lblAuthorName" Text="Author Name"></asp:Label>
                                </h5>
                                <div>
                                    <br />
                                    <asp:Label runat="server" ID="lblBookDetails" Text="Book Details ..."></asp:Label>  
                                </div>
                                <%--<div>
                                    <br />
                                    <h5 class="h3">Issued By Student</h5>
                                    <span class="description">180540107007</span>
                                    <br />
                                    <asp:Button ID="btnSearch" runat="server" Text="View Profile" CssClass="btn btn-outline-info btn-sm" OnClick="btnSearch_Click" />
                                </div>--%>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="card-profile-stats d-flex justify-content-center">
                                        <div>
                                            <span class="heading"></span>
                                            <span class="description"></span>
                                        </div>
                                        <div>
                                            <span class="heading">
                                                <asp:Label runat="server" ID="lblBookCopyNo" Text="NAME0001"></asp:Label>  
                                            </span>
                                            <span class="description">Book Serial No.</span>
                                        </div>
                                        <div>
                                            <span class="heading"></span>
                                            <span class="description"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <br />
                        <br />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

