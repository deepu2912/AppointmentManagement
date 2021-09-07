<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="mybin.aspx.cs" Inherits="Appointment_management_system_integration.User.mybin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/fontawesome-free/css/all.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/css/responsive.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/plugins/datatables-buttons/css/buttons.bootstrap4.min.css") %>">
    <style>
        input {
            position: relative;
            width: 150px;
            height: 20px;
            color: white;
        }

            input:before {
                position: absolute;
                top: 3px;
                left: 3px;
                content: attr(data-date);
                display: inline-block;
                color: black;
            }

            input::-webkit-datetime-edit, input::-webkit-inner-spin-button, input::-webkit-clear-button {
                display: none;
            }

            input::-webkit-calendar-picker-indicator {
                position: absolute;
                top: 3px;
                right: 0;
                color: black;
                opacity: 1;
            }
    </style>
    <style>
        @media(min-width:992px) {
            .margin_left {
                margin-left: 150px;
            }
        }

        .my-5 {
            margin-top: 10rem !important;
            margin-bottom: 3rem !important;
        }

        .modal-footer {
            display: block !important;
            justify-content: inherit !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Appointments</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-12">
                        <div class="card card-primary">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <!-- Date -->
                                        <div class="form-group">
                                            <label>Date:</label>
                                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                <input type="date" data-date-format="DD MMMM YYYY" class="form-control datetimepicker-input" id="AppointmentDate">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <%--<div class="form-group">
                                            <label>Status</label>
                                            <select class="form-control" id="CasesType">
                                                <option value="UnAssigned">UnAssigned</option>
                                                <option value="Assigned">Assigned</option>
                                            </select>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label></label>
                                            <input type="button" value="Get Records" id="GetRecords" class="form-control btn btn-success" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">

                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead class="tablehead">
                                    </thead>
                                    <tbody id="AppointmentData">
                                    </tbody>

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
    </div>

    <div class="modal fade" id="AppointmentStatusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalTitle">Book Appointment</h5>
                    <button
                        type="button"
                        class="btn-close fa fa-times closeModal"
                        data-mdb-dismiss="modal"
                        aria-label="Close" style="border: none; background: white; outline: none;">
                    </button>
                </div>
                <div class="modal-body" id="AppointmentStatus">
                    <div class="row">
                        <div class="col-4 col-lg-4">
                            <span style="text-decoration: underline; color: #1b1a1a; display: inline-block; font-family: 'Lato', sans-serif; font-size: 15px; font-weight: bold; margin: 0 0 20px; padding: 4px 1px 4px;">Appointment Status</span>
                        </div>
                        <div class="col-8 col-lg-8">
                            <select class="form-control" id="Status_of_Meeting">
                                <option value="--Select--">--Select--</option>
                                <option value="Completed">Completed</option>
                                <option value="Cancelled">Cancelled</option>
                                <option value="Resolved">Resolved</option>
                                <option value="Not Attended">Not Attended</option>
                                <option value="Rescheduled">Rescheduled</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4 col-lg-4">
                            <span style="text-decoration: underline; color: #1b1a1a; display: inline-block; font-family: 'Lato', sans-serif; font-size: 15px; font-weight: bold; margin: 0 0 20px; padding: 4px 1px 4px;">Remarks</span>
                        </div>
                        <div class="col-8 col-lg-8">
                            <textarea id="Remarks" class="form-control"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-6 col-lg-6">
                            <button type="button" class="btn btn-secondary closeModal" data-mdb-dismiss="modal">
                                Close
                            </button>
                        </div>
                        <div class="col-6 col-lg-6" style="text-align: end;">
                            <button type="button" class="btn btn-primary" id="UpdateAppointmentStatus">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

    <script>

        $('#GetRecords').click(function (e) {
            e.preventDefault();
            GetAppointmentsData($('#AppointmentDate').attr('data-date'));
        })

        $(document).ready(function (e) {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear() + "-" + (month) + "-" + (day);

            $('#AppointmentDate').attr("data-date", moment(today, "YYYY-MM-DD")
                .format($('#AppointmentDate').attr("data-date-format")));

            GetAppointmentsData($('#AppointmentDate').attr('data-date'));
        })

        $("#AppointmentDate").on("change", function () {
            this.setAttribute(
                "data-date",
                moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
            )
        }).trigger("change")

        function GetAppointmentsData(SelectedDate) {
            var SelectedDate = SelectedDate

            $.ajax({
                type: "POST",
                url: "<%= Page.ResolveUrl("~/User/mybin.aspx/GetAppointmentData") %>",
                contentType: "application/json; charset=utf-8",
                data: '{"SelectedDate":"' + SelectedDate + '"}',
                dataType: "json",
                processData: false,
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    if (msg.d != "") {
                        var Status = JSON.parse(msg.d).status;
                        var data = JSON.parse(msg.d).data;

                        if (Status === 100) {
                            if (data == "") {
                                $(".tablehead").html('No Appointments.')
                                $('#AppointmentData').empty();
                                $('.tablefoot').html('');
                                if (!$.fn.DataTable.isDataTable('#example1')) {

                                } else {
                                    $('#example1').dataTable().fnDestroy();
                                }
                                $('#AppointmentData').empty();

                            } else {

                                $('.tablehead,.tablefoot').empty();
                                $('#AppointmentData').empty();

                                var noti_cano_column = "";
                                if (data[0].Based_On == "Notification Number") {
                                    noti_cano_column = "<th>Notification Number</th>";
                                }
                                else if (data[0].Based_On == "Contract Account Number") {
                                    noti_cano_column = "<th>CA Number</th>";
                                }
                                else if (data[0].Based_On == "Notification Number / Contract Account Number") {
                                    noti_cano_column = "<th>Notification Number</th><th>CA Number</th>";
                                }

                                var tableHead = "<tr><th>Sno</th>" + noti_cano_column + "<th>Email ID</th><th>Mobile No</th> <th>Slot Time</th><th>Meeting</th><th>Action</th></tr>";

                                var TableData = "";
                                for (var i = 0; i < data.length; i++) {
                                    var SNO = i + 1;

                                    var Noti_caNo_val = "";

                                    if (data[i].Based_On == "Notification Number") {
                                        Noti_caNo_val = "<td>" + data[i].Notification_No + "</td>";
                                    }
                                    else if (data[i].Based_On == "Contract Account Number") {
                                        Noti_caNo_val = "<td>" + data[i].CA_No + "</td>";
                                    }
                                    else if (data[i].Based_On == "Notification Number / Contract Account Number") {
                                        Noti_caNo_val = "<td>" + data[i].Notification_No + "</td><td>" + data[i].CA_No + "</td>";
                                    }

                                    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

                                    var SlotDate = new Date(data[i].Slot_Date);
                                    var today = new Date();

                                    var Action = "";
                                    debugger;
                                    if (data[i].Status_Of_Meeting == null) {

                                        //if (SlotDate.toLocaleDateString("en-US", options) === today.toLocaleDateString("en-US", options)) {
                                            Action = "<i class='fa fa-edit Meeting_Status' AppointmentID='" + data[i].ID + "' style='cursor:pointer;' title='Meeting Status' />"
                                        //}
                                        //else if (SlotDate.toLocaleDateString("en-US", options) > today.toLocaleDateString("en-US", options)) {
                                        //    Action = "<span style='color: red;font-weight: bold;'>You are not allowed to closed future cases.</span>"
                                        //}
                                        //else if (SlotDate.toLocaleDateString("en-US", options) < today.toLocaleDateString("en-US", options)) {
                                        //    Action = "<span style='color: red;font-weight: bold;'>You are not allowed to closed past cases.</span>"
                                        //}
                                    }
                                    else {
                                        if (data[i].Status_Of_Meeting == "Not Attended") {
                                            Action = "<span style='color: red;font-weight: bold;'>Meeting is Cancelled due to unavailabilty of Customer.</span>"
                                        }
                                        else {
                                            Action = "<span style='color: red;font-weight: bold;'>Meeting is " + data[i].Status_Of_Meeting + "</span>"
                                        }
                                    }

                                    TableData = TableData + "<tr><td>" + SNO + "</td>" + Noti_caNo_val
                                        + "<td>" + data[i].Email_ID + "</td><td>" + data[i].Mob_No
                                        + "</td><td>" + data[i].Slot_start_time + " - " + data[i].Slot_end_time + "</td><td><a href='" + data[i].Meeting + "' target='_blank'>Meeting</a></td>" +
                                        "<td>" + Action + "</td></tr>";
                                }

                                if (!$.fn.DataTable.isDataTable('#example1')) {

                                } else {
                                    $('#example1').dataTable().fnDestroy();
                                }

                                $('.tablehead,.tablefoot').empty();
                                $('#AppointmentData').empty();

                                $('.tablehead,.tablefoot').html(tableHead);
                                $('#AppointmentData').html(TableData);

                                $('.Meeting_Status').click(function (e) {
                                    e.preventDefault();
                                    var AppointmentID = $(this).attr('AppointmentID');
                                    $('#AppointmentStatusModal').modal();

                                    $('#UpdateAppointmentStatus').click(function (e) {
                                        e.preventDefault();

                                        var AppointmentStatus = $('#Status_of_Meeting').val();
                                        var TxtRemarks = $('#Remarks').val();

                                        if (AppointmentStatus === "--Select--") {
                                            WarningAlert("Please Select Appointment Status");
                                            $('#Status_of_Meeting').focus();
                                            return false;
                                        }

                                        if (TxtRemarks === "") {
                                            WarningAlert("Please enter Remarks");
                                            $('#Remarks').focus();
                                            return false;
                                        }

                                        if (TxtRemarks.trim().length < 10) {
                                            WarningAlert("Please enter minimum 10 character Remarks");
                                            $('#Remarks').focus();
                                            return false;
                                        }

                                        $.ajax({
                                            type: "POST",
                                            url: "<%= Page.ResolveUrl("~/User/mybin.aspx/UpdateAppointmentStatus") %>",
                                            contentType: "application/json; charset=utf-8",
                                            data: '{"AppointmentStatus":"' + AppointmentStatus + '","TxtRemarks":"' + TxtRemarks + '","AppointmentID":"' + AppointmentID + '"}',
                                            dataType: "json",
                                            beforeSend: function () {
                                                $(".loading").show();
                                            },
                                            success: function (msg) {
                                                if (msg.d != "") {
                                                    var Status = JSON.parse(msg.d).status;
                                                    var data = JSON.parse(msg.d).data;

                                                    var SlotsData = "";
                                                    if (Status === 200) {
                                                        $('#AppointmentStatusModal').modal('hide');
                                                        SuccessAlert("Appointment data saved successfully.");
                                                        GetAppointmentsData($('#AppointmentDate').attr('data-date'));
                                                    }
                                                    else {
                                                        ErrorAlert(data)
                                                    }
                                                } else {
                                                    ErrorAlert("Error Please try again.")
                                                }
                                            },
                                            complete: function () {
                                                $(".loading").hide();
                                            },
                                            error: function (req, status, error) {
                                                ErrorAlert("Error try again");
                                            }
                                        });

                                    })


                                })

                                $('.closeModal').click(function (e) {
                                    $('#AppointmentStatusModal').modal('hide');
                                })

                                $('#example1').DataTable({
                                    "responsive": true, "lengthChange": false, "autoWidth": false,
                                    buttons: [
                                        {
                                            extend: 'copy',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'csv',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'excel',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'pdf',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'print',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        }
                                        ,
                                        'colvis'
                                    ]
                                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
                            }
                        }
                        else if (Status == 501) {
                            ErrorAlert("Error Please logout & then login again.")
                        }
                        else if (Status === 401) {
                            ErrorAlert("Error Please try again or Contact Developer.")
                        }
                    }
                },
                complete: function () {
                    $(".loading").hide();
                },
                error: function (req, status, error) {
                    ErrorAlert("Error try again");
                }
            });
        }

    </script>
</asp:Content>
