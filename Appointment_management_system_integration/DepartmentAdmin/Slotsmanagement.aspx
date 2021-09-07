<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Slotsmanagement.aspx.cs" Inherits="Appointment_management_system_integration.DepartmentAdmin.Slotsmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Slots Management - Tata Power Delhi Distribution Limited</title>

    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/fontawesome-free/css/all.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/css/responsive.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/plugins/datatables-buttons/css/buttons.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/Css/njtimepicker.css") %>">
    <style>
        .ui-widget.ui-widget-content {
            width: auto !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Slots Management</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">

                        <button type="button" id="Calendar_get_dates" class="btn btn-block btn-success btn-sm">
                            <i class=" fas fa-calendar-alt mr-1"></i>
                            Create Slots for Dates
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Manage Datewise Slots</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <!-- we are adding the accordion ID so Bootstrap's collapse plugin detects it -->
                                <div id="DatesData">
                                  <%--  <div class="card card-primary">
                                        <div class="card-header">
                                            <h4 class="card-title w-100">
                                                <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseOne"
                                                    aria-expanded="false">Thursday, July, 03 2021
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="collapse" data-parent="#accordion" style="">
                                            <div class="card-body">
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
                                                                                <th>Slot</th>
                                                                                <th>Start Time</th>
                                                                                <th>End Time</th>
                                                                                <th>Max Appointments</th>
                                                                                <th>Slot Status</th>
                                                                                <th>Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="SlotsData">
                                                                        </tbody>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th>Sno</th>
                                                                                <th>Slot</th>
                                                                                <th>Start Time</th>
                                                                                <th>End Time</th>
                                                                                <th>Max Appointments</th>
                                                                                <th>Slot Status</th>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card card-success">
                                        <div class="card-header">
                                            <h4 class="card-title w-100">
                                                <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false">Friday, July, 04 2021
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordion" style="">
                                            <div class="card-body">
                                             
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card card-success">
                                        <div class="card-header">
                                            <h4 class="card-title w-100">
                                                <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false">Monday, July, 07 2021 
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="collapse" data-parent="#accordion" style="">
                                            <div class="card-body">
                                             
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-default" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Select Dates</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="mdp-demo"></div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="CreateSlots" class="btn btn-primary">Create Slots</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
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
    <script src="<%= Page.ResolveUrl("~/media/Jquery/njtimepicker.js") %>"></script>
    <script>
        var Dates = [];

        var filedDates = [];

        $(document).ready(function (e) {
            fnGetSlotDates();
        })

        function fnGetSlotDates() {
            $.ajax({
                type: "POST",
                url: "Slotsmanagement.aspx/GetDateSlots",
                contentType: "application/json; charset=utf-8",
                data: '',
                dataType: "json",
                processData: false,
                beforeSend: function () {
                    $(".loading").show();
                },
                success: function (msg) {
                    debugger;
                    if (msg.d != "") {

                        var Status = JSON.parse(msg.d).status;
                        var data = JSON.parse(msg.d).data;

                        if (Status === 200) {

                            var AccordianData = "";

                            for (var i = 0; i < data.length; i++) {

                                var Selected_Date = {
                                    Date: data[i].Slot_Date
                                };

                                filedDates.push(Selected_Date);

                                var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                                var today = new Date(data[i].Slot_Date);

                                AccordianData = AccordianData + '<div class="card card-primary"> <div class="card-header"> <h4 class="card-title w-100"> <a class="d-block w-100 collapsed getslotsForDates" data-toggle="collapse"  date="' + data[i].Slot_Date + '" href="#collapse_' + i + '" aria- expanded="false">' + today.toLocaleDateString("en-US", options) + ' </a> </h4> </div> <div id="collapse_' + i + '" class="collapse" data-parent="#DatesData" style=""> <div class="card-body"> <div class="container-fluid"> <div class="row"> <div class="col-12"> <div class="card">  <table id="example_' + i + '" class="table table-bordered table-striped"> <thead> <tr> <th>Sno</th> <th>Slot</th> <th>Start Time</th> <th>End Time</th> <th>Max Appointments</th> <th>Slot Status</th>  <th>Action</th> </tr>   </thead> <tbody id="SlotsData_' + i + '"> </tbody> <tfoot><tr> <th>Sno</th> <th>Slot</th> <th>Start Time</th> <th>End Time</th> <th>Max Appointments</th> <th>Slot Status</th>  <th>Action</th> </tr> </tfoot> </table>  </div> </div>  </div> </div> </div>  </div> </div> </div>';
                            }
                            $('#DatesData').html("");
                            $('#DatesData').html(AccordianData);

                            $('.getslotsForDates').click(function (e) {
                                e.preventDefault();
                                debugger;
                                var clickedButton = $(this);
                                if ($(clickedButton.attr('href')).hasClass('show')) {
                                    clickedButton.parent().parent().parent().find('table').dataTable().fnDestroy();
                                }

                                $.ajax({
                                    type: "POST",
                                    url: "Slotsmanagement.aspx/GetslotsForDay",
                                    contentType: "application/json; charset=utf-8",
                                    data: '{"date":"' + $(this).attr('date') + '"}',
                                    dataType: "json",
                                    processData: false,
                                    beforeSend: function () {
                                        $(".loading").show();
                                    },
                                    success: function (msg) {
                                        if (msg.d != "") {
                                            var Status = JSON.parse(msg.d).status;
                                            var data = JSON.parse(msg.d).data;
                                            if (Status === 200) {
                                                var tabledata = "";
                                                var ID = "";
                                                for (var i = 0; i < data.length ; i++) {

                                                    var count = i + 1;
                                                    ID = clickedButton.attr('date')

                                                    var slotstart = "slotStartTime" + ID + "_" + i + "";
                                                    var slotend = "slotEndTime" + ID + "_" + i + "";

                                                    tabledata = tabledata + "<tr> <td>" + count + " </td> <td>Slot " + count + "  </td>" +
                                                            "<td>  <span class='startTime'>" + data[i].Slot_start_time + "</span>  <input type='text' readonly='readonly'     id='" + slotstart + "' value='" + data[i].Slot_start_time + "' style='display:none;' class='form-control slotStartTime'>" +
                                                            "</td> <td>  <span class='endTime'>" + data[i].Slot_end_time + "</span>  <input type='text'  style='display:none;'  readonly='readonly' id='" + slotend + "'  value='" + data[i].Slot_end_time + "' class='form-control slotEndTime'> </td> <td>" +
                                                           "<span class='maxAppointment'>" + data[i].Max_Appointments + "</span> <input type='text' onkeypress='return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))' maxlength='2' value='" + data[i].Max_Appointments + "'  class='form-control Appointments_Max' style='display:none;'   /> </td>" +
                                                              "<td><span class='slotStatus'>" + data[i].Status + "</span><select style='display:none;' class='form-control Status_Slot'><option value='Active'>Active</option><option value='Break'>Break</option><option value='Hide'>Hide</option></select></td>  " +
                                                            "<td><i class='fas fa-edit clickable_events editSlots' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i> <i class='fas fa-check clickable_events SaveSlotChanges' style='display:none;' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i><i class='fas fa-times clickable_events CloseSlotSettings' style='display:none;    margin: 10px;' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i></td> </tr>";

                                                }
                                                clickedButton.parent().parent().parent().find('tbody').html();
                                                clickedButton.parent().parent().parent().find('tbody').html(tabledata);
                                                debugger;
                                                ///Loop For Generating Time For all Slots.
                                                for (var i = 0; i < data.length ; i++) {

                                                    //var slotstart = "slotStartTime" + ID + "_" + i + "";
                                                    //var slotend = "slotEndTime" + ID + "_" + i + "";

                                                    var slot_start_time_id = "slotStartTime" + ID + "_" + i + "";
                                                    var slot_end_time_id = "slotEndTime" + ID + "_" + i + "";
                                                    (function () {

                                                        $('#' + slot_start_time_id + '');
                                                        let format_12 = $('#' + slot_start_time_id + '');
                                                        var format_12_picker = new NJTimePicker({
                                                            targetID: '' + slot_start_time_id + '',
                                                            autoSave: false,
                                                            texts: {
                                                                header: 'Slot Start Time'
                                                            }
                                                        });
                                                        format_12_picker.on('save', function (data) {
                                                            if (data.fullResult)
                                                                format_12.textContent = data.fullResult;
                                                        });
                                                        format_12_picker.on('ready', function (data) {
                                                            return
                                                            format_12_picker.setValue({
                                                                hours: 12,
                                                                minutes: 45,
                                                                ampm: 'AM'
                                                            });
                                                        });

                                                        let format_12_end = $('#' + slot_end_time_id + '');
                                                        var format_12_picker_end = new NJTimePicker({
                                                            targetID: '' + slot_end_time_id + '',
                                                            autoSave: false,
                                                            texts: {
                                                                header: 'Slot End Time'
                                                            }
                                                        });
                                                        format_12_picker_end.on('save', function (data) {
                                                            if (data.fullResult)
                                                                format_12_end.textContent = data.fullResult;
                                                        });
                                                        format_12_picker_end.on('ready', function (data) {
                                                            return
                                                            format_12_picker_end.setValue({
                                                                hours: 12,
                                                                minutes: 45,
                                                                ampm: 'AM'
                                                            });
                                                        });


                                                    })();

                                                }

                                                if (!$.fn.DataTable.isDataTable('#' + clickedButton.parent().parent().parent().find('table').attr('id') + '')) {
                                                    $(function () {
                                                        clickedButton.parent().parent().parent().find('table').DataTable({
                                                            "responsive": true, "lengthChange": false, "autoWidth": false,
                                                            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                                                        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

                                                    });
                                                } else {
                                                    clickedButton.parent().parent().parent().find('table').dataTable().fnDestroy();
                                                    $(function () {
                                                        clickedButton.parent().parent().parent().find('table').DataTable({
                                                            "responsive": true, "lengthChange": false, "autoWidth": false,
                                                            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                                                        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

                                                    });
                                                }
                                                $('.editSlots').click(function (e) {
                                                    e.preventDefault();
                                                    var Slot_ID = $(this).attr('slotID');
                                                    var Department_ID = $(this).attr('departmentID');

                                                    $(this).parent().parent().find('.startTime').hide();
                                                    $(this).parent().parent().find('.endTime').hide();
                                                    $(this).parent().parent().find('.maxAppointment').hide();
                                                    $(this).parent().parent().find('.slotStatus').hide();

                                                    $(this).parent().parent().find('.slotStartTime').show();
                                                    $(this).parent().parent().find('.slotEndTime').show();
                                                    $(this).parent().parent().find('.Appointments_Max').show();
                                                    $(this).parent().parent().find('.Status_Slot').show();

                                                    $(this).hide();

                                                    $(this).parent().find('.SaveSlotChanges').show();
                                                    $(this).parent().find('.CloseSlotSettings').show();


                                                    var slot_start_time_id = $(this).parent().parent().find('.slotStartTime').attr('id');
                                                    var slot_end_time_id = $(this).parent().parent().find('.slotEndTime').attr('id');


                                                    var Slot_Status_Selected = $(this).parent().parent().find('.slotStatus').text().trim();
                                                    $(this).parent().parent().find('.Status_Slot').val(Slot_Status_Selected);
                                                });

                                                $('.CloseSlotSettings').click(function (e) {
                                                    e.preventDefault();
                                                    var Slot_ID = $(this).attr('slotID');
                                                    var Department_ID = $(this).attr('departmentID');

                                                    $(this).parent().parent().find('.startTime').show();
                                                    $(this).parent().parent().find('.endTime').show();
                                                    $(this).parent().parent().find('.maxAppointment').show();
                                                    $(this).parent().parent().find('.slotStatus').show();

                                                    $(this).parent().parent().find('.slotStartTime').hide();
                                                    $(this).parent().parent().find('.slotEndTime').hide();
                                                    $(this).parent().parent().find('.Appointments_Max').hide();
                                                    $(this).parent().parent().find('.Status_Slot').hide();

                                                    $(this).hide();

                                                    $(this).parent().find('.SaveSlotChanges').hide();
                                                    $(this).parent().find('.editSlots').show();
                                                });

                                                $('.SaveSlotChanges').click(function (e) {
                                                    e.preventDefault();

                                                    var Slot_ID = $(this).attr('slotID');
                                                    var Department_ID = $(this).attr('departmentID');
                                                    var Button_Click = $(this);
                                                    var StartTime = $(this).parent().parent().find('.slotStartTime').val();
                                                    var EndTime = $(this).parent().parent().find('.slotEndTime').val();
                                                    var MaxAppointments = $(this).parent().parent().find('.Appointments_Max').val();
                                                    var SlotStatus = $(this).parent().parent().find('.Status_Slot').val();
                                                    if (confirm("Are you sure want to update slot changes?")) {
                                                        $.ajax({
                                                            type: "POST",
                                                            url: "Slotsmanagement.aspx/UpdateSlotDataDatewise",
                                                            contentType: "application/json; charset=utf-8",
                                                            data: '{"Slot_ID":"' + Slot_ID + '","Department_ID":"' + Department_ID
                                               + '","StartTime":"' + StartTime + '","EndTime":"' + EndTime
                                               + '","MaxAppointments":"' + MaxAppointments + '","SlotStatus":"' + SlotStatus
                                               + '"}',
                                                            dataType: "json",
                                                            processData: false,
                                                            beforeSend: function () {
                                                                $(".loading").show();
                                                            },
                                                            success: function (msg) {
                                                                if (msg.d != "") {
                                                                    var Status = JSON.parse(msg.d).status;
                                                                    var data = JSON.parse(msg.d).data;

                                                                    if (Status === 200) {
                                                                        SuccessAlert("Slot Updated successfully.");
                                                                        debugger;
                                                                        Button_Click.parent().parent().find('.startTime').show();
                                                                        Button_Click.parent().parent().find('.endTime').show();
                                                                        Button_Click.parent().parent().find('.maxAppointment').show();
                                                                        Button_Click.parent().parent().find('.slotStatus').show(); 
                                                                        Button_Click.parent().parent().find('.startTime').text(StartTime);
                                                                        Button_Click.parent().parent().find('.endTime').text(EndTime);
                                                                        Button_Click.parent().parent().find('.maxAppointment').text(MaxAppointments);
                                                                        Button_Click.parent().parent().find('.slotStatus').text(SlotStatus);
                                                                         Button_Click.parent().parent().find('.slotStartTime').hide();
                                                                        Button_Click.parent().parent().find('.slotEndTime').hide();
                                                                        Button_Click.parent().parent().find('.Appointments_Max').hide();
                                                                        Button_Click.parent().parent().find('.Status_Slot').hide(); 
                                                                        Button_Click.hide(); 
                                                                        Button_Click.parent().find('.CloseSlotSettings').hide();
                                                                        Button_Click.parent().find('.editSlots').show();

                                                                        //setTimeout(function (e) {
                                                                        //    window.location.reload();
                                                                        //}, 2000);
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

                                                })


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
                            })

                        }
                        else if (Status === 401) {
                            ErrorAlert("Error Please try again or Contact Developer.")
                        }

                    } else {
                        $('#DatesData').html("");
                        $('#DatesData').html("No Dates find please create slots");
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

        $('#Calendar_get_dates').click(function (e) {
            e.preventDefault();

            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

            var arrayDates = [];

            filedDates.forEach(function (index) {
                var today = new Date(index.Date);
                arrayDates.push(today.toLocaleDateString("en-US"))
            })
            if (arrayDates.length == 0) {
                $('#mdp-demo').multiDatesPicker({
                    minDate: 0,
                    beforeShowDay: $.datepicker.noWeekends
                });

            } else {
                $('#mdp-demo').multiDatesPicker({
                    minDate: 0,
                    beforeShowDay: $.datepicker.noWeekends,
                    addDisabledDates: arrayDates
                });

            }

            $('#modal-default').modal('show');

            $('#CreateSlots').click(function (e) {
                e.preventDefault();
                var dates = $('#mdp-demo').multiDatesPicker('getDates');

                if (dates.length == 0) {
                    ErrorAlert("Please Select atleast one date.")
                    return false;
                }

                if (confirm("Are you sure want to create slots?")) {
                    $.ajax({
                        type: "POST",
                        url: "Slotsmanagement.aspx/CreatedSlotsWrtToDate",
                        contentType: "application/json; charset=utf-8",
                        data: '{"dates":"' + dates + '"}',
                        dataType: "json",
                        processData: false,
                        beforeSend: function () {
                            $(".loading").show();
                        },
                        success: function (msg) {
                            if (msg.d != "") {
                                var Status = JSON.parse(msg.d).status;
                                var data = JSON.parse(msg.d).data;
                                if (Status === 200) {
                                    SuccessAlert("Dates with Slots Created successfully.");

                                    $('#modal-default').modal('hide');
                                    $('#mdp-demo').multiDatesPicker('resetDates', 'picked');

                                    setTimeout(function (e) {
                                        window.location.reload();
                                    }, 2000);
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

                e.stopImmediatePropagation();
            })
            e.stopImmediatePropagation();
        })
    </script>
</asp:Content>
