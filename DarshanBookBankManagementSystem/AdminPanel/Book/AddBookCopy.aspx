<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBookCopy.aspx.cs" Inherits="AdminPanel_Book_BookCopy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Book Copies
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
                            <asp:HyperLink ID="hlAddBook" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" runat="server" CssClass="nav-link active">
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
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" Text="Book Inventory"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphBreadcrumThird" runat="server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/AddBook.aspx" Text="Add Book"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Add Book Copies
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Add Book Copies
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMainArea" runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Succesfully Added',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
    <div class="container">
        <div>
            <asp:Label CssClass="text-danger" runat="server" ID="lblMessage"></asp:Label>
        </div>
        <div class="row" style="padding: 20px;">

            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblBook" Text="Select Book " runat="server"></asp:Label>
                    <asp:DropDownList ID="ddlBook" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvBook" ControlToValidate="ddlBook" ErrorMessage="Select The Book" ForeColor="Red" Display="Dynamic" ValidationGroup="vgAdd" Font-Size="Small" InitialValue="-1"></asp:RequiredFieldValidator>
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
                    <asp:Label ID="Label1" Text="Book Serial No." runat="server"></asp:Label>
                    <asp:TextBox ID="txtBookSerialNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvBookSerialNo" ControlToValidate="txtBookSerialNo" ErrorMessage="Enter The Book Serial No" ForeColor="Red" Display="Dynamic" ValidationGroup="vgAdd" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="co-md-6" style="margin-left: 15%;">
                <div class="form=group">
                    <asp:Button ID="btnAdd" ValidationGroup="vgAdd" Width="500%" CssClass="btn btn-outline-success" Text="ADD" runat="server" OnClick="btnAdd_Click" />

                </div>
            </div>
            <div class="co-md-6" style="margin-left: 30%;">
                <div class="form=group">
                    <asp:Button ID="btnDone" Width="450%" CssClass="btn btn-outline-info" Text="DONE" runat="server" OnClick="btnDone_Click" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>

