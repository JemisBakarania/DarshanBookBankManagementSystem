<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditBook.aspx.cs" Inherits="AdminPanel_Book_EditBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Edit Book
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
    Edit Book
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitleOfArea" runat="Server">
    Edit Book 
    <div style="float: right;">
        <asp:LinkButton CssClass="btn btn-info" runat="server" ID="lnbtnAddNewBook" OnClick="lnbtnAddNewBook_Click">
                    <span class="ni ni-books"></span>&nbsp Add New Book
        </asp:LinkButton>
    </div>

    <div style="float: right; margin-right: 10px;">
        <asp:LinkButton CssClass="btn btn-outline-warning" runat="server" ID="lnbtnUpdateSubject" OnClick="lnbtnUpdateSubject_Click">
                    <span class="ni ni-books"></span>&nbsp Edit Subject
        </asp:LinkButton>
    </div>

    <div style="float: right; margin-right: 10px;">
        <asp:LinkButton CssClass="btn btn-outline-warning" runat="server" ID="lnbtnUpdateBookCopy" OnClick="lnbtnUpdateBookCopy_Click">
                    <span class="ni ni-books"></span>&nbsp Edit Book Copy
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMainArea" runat="Server">
    <asp:Panel runat="server" BackColor="#F7F7F7">
        <div class="container">

            <div class="row" style="padding: 20px;">
                <div class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            <asp:TextBox CssClass="form-control" placeholder="Book Serial No...." ID="txtBookSerialNo" runat="server"></asp:TextBox>

                            <%--<input class="form-control" placeholder="Search" type="text">--%>
                        </div>

                    </div>
                    <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <%--<div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="lblBookSerialNo" Text="Book Serial No." runat="server"></asp:Label>
                        <asp:TextBox ID="txtBookSerialNo" runat="server" placeholder="Enter Here ... " CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBookCopyNo" runat="server" ErrorMessage="Enter Book Serial No" ControlToValidate="txtBookSerialNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>
                </div>--%>

                <div id="divSearch" class="col-md-3" style="padding: 20px; margin-top: ;">
                    <asp:LinkButton CssClass="btn btn-outline-default btn-sm rounded-2" ValidationGroup="vgSearch" runat="server" ID="lnbtnSearch" OnClick="lnbtnSearch_Click">
                    <span class="fas fa-search"></span>&nbsp Search
                    </asp:LinkButton>
                    <%--<asp:Button ValidationGroup="vgSearch" ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-info btn-sm " OnClick="btnSearch_Click" />--%>
                </div>
                <div class="col-md-3" style="padding: 20px; margin-top: 5px; float: right;">
                    <asp:LinkButton CssClass="btn btn-info btn-md" runat="server" ID="lnbtnViewAll" OnClick="lnbtnViewAll_Click">
                    <span class="ni ni-bullet-list-67"></span>&nbsp View All
                    </asp:LinkButton>
                </div>
            </div>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Book Serial No" ControlToValidate="txtBookSerialNo" ForeColor="Red" ValidationGroup="vgSearch" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
            <asp:Label ID="lblErrorMessage" CssClass="text-danger" runat="server"></asp:Label>
            <asp:Panel CssClass="table table-borderless" ID="pnlBookCopy" runat="server">
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
                <div class="row">

                    <div class="col-md-12">
                        <asp:GridView OnRowCommand="gvBookCopy_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light " Width="100%" ID="gvBookCopy" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookTitle" HeaderText="Book Title" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyNo" HeaderText="Serial No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="ViewBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button runat="server" Text="View" CssClass="btn btn-info btn-md" CommandName="View" CommandArgument='<%# Eval("BookCopyNo") %>' />--%>
                                        <asp:HyperLink runat="server" ToolTip="Update" NavigateUrl='<%#"~/AdminPanel/Book/BookUpdate.aspx?BookCopyID=" + Eval("BookCopyID") %>' Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:HyperLink>
                                        <%--<asp:Button runat="server" Text="Update" CssClass="btn btn-warning btn-sm" />--%>
                                        <asp:LinkButton OnClientClick="javascript:return confirm('Are You Sure?');" CommandName="DeleteBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button runat="server" Text="Detele" CssClass="btn btn-danger btn-sm" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>



            <asp:Panel CssClass="table table-borderless" ID="pnlBook" runat="server">

                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView OnRowCommand="gvBookCopy_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light" Width="100%" ID="gvBook" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookTitle" HeaderText="Book Title" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookCopyNo" HeaderText="Serial No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="ViewBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="View" Text="View" CssClass="btn btn-outline-info btn-sm">
                                            <span class="far fa-eye"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button runat="server" Text="View" CssClass="btn btn-info btn-md"  />--%>
                                        <asp:HyperLink runat="server" ToolTip="Update" NavigateUrl='<%#"~/AdminPanel/Book/BookUpdate.aspx?BookCopyID=" + Eval("BookCopyID").ToString() %>' Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:HyperLink>
                                        <%--<asp:Button runat="server" Text="Update" CssClass="btn btn-warning btn-sm" />--%>
                                        <asp:LinkButton OnClientClick="javascript:return confirm('Are You Sure?');" CommandName="DeleteBook" CommandArgument='<%#Eval("BookCopyID") %>' runat="server" ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button runat="server" Text="Detele" CssClass="btn btn-danger btn-sm" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel CssClass="table table-borderless" ID="pnlSubject" runat="server">

                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView OnRowCommand="gvSubject_RowCommand" BorderWidth="0px" CssClass="table table-hover align-items-center thead-light" Width="100%" ID="gvSubject" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookID" HeaderText="Sr No" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Book Cover Photo">
                                    <ItemTemplate>
                                        <asp:Image HeaderText="Book Cover Photo" ID="imgBook" runat="server" ImageUrl='<%# Eval("Image") %>' Height="70" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="BookTitle" HeaderText="Subject" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="Author" HeaderText="Book Author" />
                                <asp:BoundField HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" ItemStyle-Font-Bold="true" ItemStyle-CssClass="text-center" DataField="Details" HeaderText="Book Details" />
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-uppercase bg-primary text-white text-center" HeaderText="Controls">
                                    <ItemTemplate>

                                        <%--<asp:Button runat="server" Text="View" CssClass="btn btn-info btn-md"  />--%>
                                        <asp:HyperLink runat="server" ToolTip="Update" NavigateUrl='<%#"~/AdminPanel/Book/AddBook.aspx?BookID=" + Eval("BookID").ToString() %>' Text="Update" CssClass="btn btn-outline-warning btn-sm">
                                            <span class="fas fa-pen-alt"></span>
                                        </asp:HyperLink>
                                        <%--<asp:Button runat="server" Text="Update" CssClass="btn btn-warning btn-sm" />--%>
                                        <asp:LinkButton OnClientClick="javascript:return confirm('Are You Sure?');" CommandName="DeleteBook" CommandArgument='<%#Eval("BookID") %>' runat="server" ToolTip="Detele" Text="Detele" CssClass="btn btn-outline-danger btn-sm">
                                            <span class="far fa-trash-alt"></span>
                                        </asp:LinkButton>
                                        <%--<asp:Button runat="server" Text="Detele" CssClass="btn btn-danger btn-sm" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </asp:Panel>


    </div>
    </asp:Panel>

</asp:Content>

