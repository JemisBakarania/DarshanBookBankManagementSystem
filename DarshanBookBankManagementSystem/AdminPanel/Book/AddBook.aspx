<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="AdminPanel_Book_AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Add Book
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
<asp:Content ID="Content4" ContentPlaceHolderID="cphBreadcrumLast" runat="Server">
    <asp:Label Text="Add Book" ID="lblBread" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    <asp:Label Text="Add Book" ID="lblTitle" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMainArea" runat="Server">
    <script src="<%=ResolveClientUrl("~/swalert.js") %>" type="text/javascript"></script>
    <script>
        function alertme() {
            Swal.fire({
                position: 'middle',
                type: 'success',
                title: 'Subject Added',
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
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lbBookTitle" Text="Book Title " runat="server"></asp:Label>
                    <asp:TextBox ID="txtBookTitle" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBookTitle" runat="server" ErrorMessage="Enter The Book Titile" ControlToValidate="txtBookTitle" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <span style="color: #00CC66;">*</span>
                    <asp:Label ID="lblAuthor" Text="Author Name" runat="server"></asp:Label>
                    <asp:TextBox ID="txtAuthor" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ErrorMessage="Enter The Book Author" ControlToValidate="txtAuthor" ForeColor="Red" ValidationGroup="vgAdd" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label ID="lblDetails" Text="Book Details " runat="server"></asp:Label>
                    <asp:TextBox ID="txtDetails" runat="server" placeholder="Enter Here ... " CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="col-md-12">
                <div class="custom-file">
                    <asp:Label ID="lblImage" Text="Select Book Cover Photo (Optional) " runat="server"></asp:Label><br />
                    <br />
                    <asp:FileUpload ID="fuBook" runat="server" />
                    <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ErrorMessage="Upload Only (.jpeg or .png) File" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$" ForeColor="Red" Display="Dynamic" ValidationGroup="vgAdd" Font-Size="Small" ControlToValidate="fuBook"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 20px;">
            <div class="co-md-5" style="margin-left:30px ;float:right;">
                <div class="form=group">
                    <asp:Button ValidationGroup="vgAdd" ID="btnAdd" Width="300%" CssClass="btn btn-outline-success" Text="ADD" runat="server" OnClick="btnAdd_Click" />
                </div>

            </div>
            <div class="co-md-5" style="margin-left: 400px ;">
                <div class="form=group">
                    <asp:Button ValidationGroup="vgAddCopy" ID="btnAddCopy" Width="100%" CssClass="btn btn-outline-success " Text="ADD Book Copy" runat="server" OnClick="btnAddCopy_Click"  />
                </div>

            </div>
            <div class="co-md-2" style="margin-left:30px ;">
                <div class="form=group">
                    <asp:Button ID="btnCancel" Width="100%"  CssClass="btn btn-outline-danger" Text="Cancel" runat="server" OnClick="Button1_Click" />
                </div>

            </div>
        </div>
    </div>



</asp:Content>

