<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookUpdate.aspx.cs" Inherits="AdminPanel_Book_ViewBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Book Update
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
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumSecond" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/BookInventory.aspx" Text="Book Inventory"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBreadcrumThird" runat="Server">
    <li class="breadcrumb-item">
        <asp:HyperLink runat="server" NavigateUrl="~/AdminPanel/Book/EditBook.aspx" Text="Edit Book"></asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    Book Update
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Book Update

    <div style="float: right;">
        <i class="ni ni-bold-left"></i>
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-info btn-sm" OnClientClick="JavaScript:window.history.back(1); return false;" OnClick="btnCancel_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cphMainArea" runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Book Updated',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
    <div class="container ">
        <div class="row" style="padding: 20px;">
            <div>
                <asp:Label CssClass="text-danger" runat="server" ID="lblMessage"></asp:Label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    
                    <asp:Label ID="lbBookTitle" Text="Book Title " runat="server"></asp:Label>
                    <asp:TextBox ID="txtBookTitle" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBookTitle" runat="server" ErrorMessage="Enter The Book Titile" ControlToValidate="txtBookTitle" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblBookCopyNo" Text="Book Serial No. " runat="server"></asp:Label>
                    <asp:TextBox ID="txtBookCopyNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBookCopyNo" runat="server" ErrorMessage="Enter The Book Serial No" ControlToValidate="txtBookCopyNo" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>

        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label ID="lblDetails" Text="Book Details " runat="server"></asp:Label>
                    <asp:TextBox ID="txtDetails" runat="server" placeholder="Enter Here ... " CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    
                    <asp:Label ID="lblAuthor" Text="Author Name" runat="server"></asp:Label>
                    <asp:TextBox ID="txtAuthor" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ErrorMessage="Enter The Book Author" ControlToValidate="txtAuthor" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
       <%-- <div class="row" style="padding: 20px;">
            <div class="pl-lg-4">
                <div class="row">
                    <div class="col-md-10">
                        <asp:Label runat="server" Text="Update Your BookCover Photo (Optional)" CssClass="form-control" Font-Bold="True"></asp:Label>
                        <div class="input-group input-group-merge input-group-alternative">
                            <span class="input-group-text" style="color: red;">&ensp;</span>

                            <asp:FileUpload CssClass="form-control custom-file-label" ID="fuAdminpic" runat="server" />
                            <asp:Label CssClass="text-danger" ID="lblFileUploadMessge" runat="server"></asp:Label>
                        </div>
                        <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ErrorMessage="Upload Only (.jpeg or .png) File" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$" ForeColor="Red" Display="Dynamic" ValidationGroup="vgUpdate" Font-Size="Small" ControlToValidate="fuAdminpic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="col-md-2">
                        <asp:Button runat="server" ID="btnUpload" Text="Upload" CssClass="btn btn-outline-warning btn-sm" OnClick="btnUpload_Click" />
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="row" style="padding: 20px;">
            <div class="co-md-6" style="margin-left: 150px; text-align: center;">
                <div class="form=group">
                    <asp:Button ValidationGroup="vgAdd" ID="btnAdd" Width="300%" CssClass="btn btn-outline-warning" Text="Update" runat="server" OnClick="btnUploadPic_Click" />
                </div>

            </div>
            <div class="co-md-6" style="margin-left: 400px; text-align: center;">
                <div class="form=group">
                    <asp:Button ID="btnCancel" Width="300%" CssClass="btn btn-outline-danger" Text="Cancel" runat="server" OnClick="btnCancel_Click1" />
                </div>

            </div>
        </div>
    </div>
    <br />

    <span class="text-light">*Note: If Admin wants to update Subject one should goto the previous page and click on the update subject button.</span>
</asp:Content>

