<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Slots.aspx.cs" Inherits="Appointment_management_system_integration.DepartmentAdmin.Slots" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Slots - Tata Power Delhi Distribution Limited</title>

    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/fontawesome-free/css/all.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css") %>">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/media/plugins/datatables-responsive/css/responsive.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/plugins/datatables-buttons/css/buttons.bootstrap4.min.css") %>">
    <link rel="stylesheet" href=" <%= Page.ResolveUrl("~/media/Css/njtimepicker.css") %>">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6 col-6">
                        <h1 class="m-0">Slots</h1>
                    </div>
                    <div class="col-sm-4 col-1">
                    </div>
                    <div class="col-sm-2 col-5">
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

        $(document).ready(function (e) {
            getSlotsData();
        })

        function getSlotsData() {
            $.ajax({
                type: "POST",
                url: "Slots.aspx/GetSlotsData",
                contentType: "application/json; charset=utf-8",
                data: '',
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
                            for (var i = 0; i < data.length ; i++) {

                                var count = i + 1;

                                tabledata = tabledata + "<tr> <td>" + count + " </td> <td>Slot " + count + "  </td>" +
                                        "<td>  <span class='startTime'>" + data[i].Slot_start_time + "</span>  <input type='text' readonly='readonly'     id='slotStartTime_" + i + "' value='" + data[i].Slot_start_time + "' style='display:none;' class='form-control slotStartTime'>" +
                                        "</td> <td>  <span class='endTime'>" + data[i].Slot_end_time + "</span>  <input type='text'  style='display:none;'  readonly='readonly' id='slotEndTime_" + i + "'  value='" + data[i].Slot_end_time + "' class='form-control slotEndTime'> </td> <td>" +
                                       "<span class='maxAppointment'>" + data[i].Max_Appointments + "</span> <input type='text' onkeypress='return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))' maxlength='2' value='" + data[i].Max_Appointments + "'  class='form-control Appointments_Max' style='display:none;'   /> </td>" +
                                          "<td><span class='slotStatus'>" + data[i].Slot_status + "</span><select style='display:none;' class='form-control Status_Slot'><option value='Active'>Active</option><option value='Break'>Break</option><option value='Hide'>Hide</option></select></td>  " +
                                        "<td><i class='fas fa-edit clickable_events editSlots' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i> <i class='fas fa-check clickable_events SaveSlotChanges' style='display:none;' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i><i class='fas fa-times clickable_events CloseSlotSettings' style='display:none;    margin: 10px;' slotID='" + data[i].ID + "' departmentID='" + data[i].Department_ID + "'></i></td> </tr>";

                            }
                            $('#SlotsData').html();
                            $('#SlotsData').html(tabledata);

                            ///Loop For Generating Time For all Slots.
                            for (var i = 0; i < data.length ; i++) {

                                var slot_start_time_id = "slotStartTime_" + i;
                                var slot_end_time_id = "slotEndTime_" + i;
                                (function () {

                                    //$('#' + slot_start_time_id + '').NJTimePicker('destroy');
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

                            $(function () {
                                $("#example1").DataTable({
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

                            });

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
                                debugger;
                                var Slot_ID = $(this).attr('slotID');
                                var Department_ID = $(this).attr('departmentID');

                                var StartTime = $(this).parent().parent().find('.slotStartTime').val();
                                var EndTime = $(this).parent().parent().find('.slotEndTime').val();
                                var MaxAppointments = $(this).parent().parent().find('.Appointments_Max').val();
                                var SlotStatus = $(this).parent().parent().find('.Status_Slot').val();
                                if (confirm("Are you sure want to update slot changes?")) {
                                    $.ajax({
                                        type: "POST",
                                        url: "Slots.aspx/UpdateSlotData",
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
                                                    setTimeout(function (e) {
                                                        $("#example1").dataTable().fnDestroy();
                                                        getSlotsData();
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

                            })

                        }
                        else if (Status === 401) {
                            ErrorAlert("Error Please try again")
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
