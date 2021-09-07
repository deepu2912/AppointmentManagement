<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="Appointment_management_system_integration.Super_Admin.Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Departments - Tata Power Delhi Distribution Limited</title>

    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/fontawesome-free/css/all.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/css/responsive.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/plugins/datatables-buttons/css/buttons.bootstrap4.min.css") %>">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Departments</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">
                        <button type="button" id="Add_Department" class="btn btn-block btn-success btn-sm">
                            <i class=" fa fa-plus"></i>
                            Add Department
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <%--Table--%>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">

                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Sno</th>
                                            <th>Department</th>
                                            <th>Officials Count</th>
                                            <th>Slot Duration (in Mins)</th>
                                            <th>Slot Start Time</th>
                                            <th>Slot End Time</th>
                                            <th>Next Visible Days</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="DepartmentData" runat="server">
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Sno</th>
                                            <th>Department</th>
                                            <th>Officials Count</th>
                                            <th>Slot Duration (in Mins)</th>
                                            <th>Slot Start Time</th>
                                            <th>Slot End Time</th>
                                            <th>Next Visible Days</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <%--Table--%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables/jquery.dataTables.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/js/dataTables.responsive.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/js/responsive.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/dataTables.buttons.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.bootstrap4.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/jszip/jszip.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/pdfmake/pdfmake.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/pdfmake/vfs_fonts.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.html5.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.print.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/plugins/datatables-buttons/js/buttons.colVis.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/media/Jquery/njtimepicker.js") %>"></script>
    <script>
        $('.editDepartment').click(function (e) {
            e.preventDefault();
            var depID = $(this).attr('depid');
            window.location.href = "editdepartment.aspx?dep=" + depID + "";
        })

        $(function () {
            $("#example1").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

        });
        $('#Add_Department').click(function (e) {
            window.location.href = "adddepartment.aspx"
        })
    </script>
</asp:Content>
