<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Appointment_management_system_integration.DepartmentAdmin.Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/daterangepicker/daterangepicker.css") %>">--%>
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
                                        <div class="form-group">
                                            <label>Status</label>
                                            <select class="form-control" id="CasesType">
                                                <option value="UnAssigned">UnAssigned</option>
                                                <option value="Assigned">Assigned</option>
                                            </select>
                                        </div>
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
                                    <tfoot class="tablefoot">
                                        
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
            GetAppointmentsData($('#AppointmentDate').attr('data-date'), $('#CasesType').val());
        })

        $(document).ready(function (e) {

            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);

            var today = now.getFullYear() + "-" + (month) + "-" + (day);

            $('#AppointmentDate').attr("data-date", moment(today, "YYYY-MM-DD")
                .format($('#AppointmentDate').attr("data-date-format")));


            GetAppointmentsData($('#AppointmentDate').attr('data-date'), $('#CasesType').val());
        })

        $("#AppointmentDate").on("change", function () {
            this.setAttribute(
                "data-date",
                moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
            )
        }).trigger("change")

        function GetAppointmentsData(SelectedDate, AppointmentType) {
            var SelectedDate = SelectedDate
            var appointmentType = AppointmentType

            $.ajax({
                type: "POST",
                url: "<%= Page.ResolveUrl("~/DepartmentAdmin/Appointments.aspx/GetAppointmentData") %>",
                contentType: "application/json; charset=utf-8",
                data: '{"SelectedDate":"' + SelectedDate + '","appointmentType":"' + appointmentType + '"}',
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
                                var Users = JSON.parse(msg.d).users;

                                var selectUsers = "<option value='--Select--'>--Select--</option>";

                                if (Users != "") {
                                    for (var j = 0; j < Users.length; j++) {
                                        selectUsers = selectUsers + "<option value='" + Users[j].EMP_ID + "'>" + Users[j].Name + "( " + Users[j].EMP_ID + " )</option>";
                                    }
                                } else {
                                    selectUsers = selectUsers + "<option disabled='true'>No Users Available</option>";
                                }


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

                                var tableHead = "<tr><th>Sno</th>" + noti_cano_column + "<th>Email ID</th><th>Mobile No</th><th>Slot Date</th><th>Slot Time</th><th>Action</th></tr>";

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
                                    var today = new Date(data[i].Slot_Date);

                                    TableData = TableData + "<tr><td>" + SNO + "</td>" + Noti_caNo_val
                                        + "<td>" + data[i].Email_ID + "</td><td>" + data[i].Mob_No
                                        + "</td><td>" + today.toLocaleDateString("en-US", options) + "</td><td>" + data[i].Slot_start_time + " - " + data[i].Slot_end_time + "</td><td><div class='row'><div class='col-lg-8'><select class='AssignedUsers form-control' Official_Assigned='" + data[i].Official_Assigned + "' >" + selectUsers + "</select></div><div class='col-lg-4'><i AppointmentID = '" + data[i].ID + "' class='fa fa-check assignUser clickable_events' style='zoom: 1.3;margin-top: 7px;'></i></div></td></tr>";
                                }

                                if (!$.fn.DataTable.isDataTable('#example1')) {

                                } else {
                                    $('#example1').dataTable().fnDestroy();
                                }

                                $('.tablehead,.tablefoot').empty();
                                $('#AppointmentData').empty();

                                $('.tablehead,.tablefoot').html(tableHead);
                                $('#AppointmentData').html(TableData);

                                if (AppointmentType == "Assigned") {
                                    $('.AssignedUsers').each(function (e) {
                                        var EmpID = $(this).attr('Official_Assigned')
                                        $(".AssignedUsers option").each(function () {
                                            if ($(this).val() == EmpID) {
                                                $(this).attr('selected', 'selected');
                                            }
                                        });
                                    })
                                }

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


                                $('.assignUser').click(function (e) {
                                    e.preventDefault();
                                    debugger;

                                    var AppointmentID = $(this).attr('AppointmentID');
                                    var EmpiD = $(this).parent().parent().find('.AssignedUsers :selected').val();
                                    var EmpName = $(this).parent().parent().find('.AssignedUsers :selected').text();

                                    var Row = $(this).closest('tr');

                                    if (EmpiD == "--Select--") {
                                        ErrorAlert('Please select an Employee')
                                    } else {

                                        if (confirm("Are you sure want to Assign?")) {
                                            $.ajax({
                                                type: "POST",
                                                url: "<%= Page.ResolveUrl("~/DepartmentAdmin/Appointments.aspx/AssignedUser") %>",
                                                contentType: "application/json; charset=utf-8",
                                                data: '{"AppointmentID":"' + AppointmentID + '","EmpiD":"' + EmpiD + '"}',
                                                dataType: "json",
                                                processData: false,
                                                beforeSend: function () {
                                                    $(".loading").show();
                                                },
                                                success: function (msg) {
                                                    if (msg.d != "") {
                                                        var Status = JSON.parse(msg.d).status;
                                                        var data = JSON.parse(msg.d).data;

                                                        if (Status == 200) {
                                                            if ($('#CasesType').val() != "Assigned") {
                                                                Row.addClass("bg-danger");
                                                                Row.hide(2000, function () {
                                                                    this.remove();
                                                                });
                                                            } 
                                                            SuccessAlert("Task Assign to " + EmpName + " successfully.")
                                                        } else {
                                                            ErrorAlert(data);
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
                                    }

                                });

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
