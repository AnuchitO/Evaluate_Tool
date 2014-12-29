<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Evaluate Tool</title>
</head>
<style>
    .navbar-default {
        background-color: #FF8C00;
    }

    .navbar-default>.container-fluid>.navbar-header>.navbar-brand {
        color: black;
    }

    .navbar-default>.container-fluid>.navbar-collapse>.navbar-nav>li>a {
        color: black;
    }

    .panel-body {
        text-align: right;
    }

    .panel-footer {
        text-align: center;
        color: #FFFFFF;
        background-color: #428bca;
    }

    .modal-title {
        text-align: center;
    }

    .btn {
        background-color: #FF8C00;
    }

    .bg-default {
        background-color: #FF8C00;
    }
    a {
        cursor: pointer;
    }

</style>
<body>

<input type="hidden" id="yourId" value="${yourId}" />
<input type="hidden" id="yourPosition" value="${yourPosition}" />
<div id="container" class="row">
    <div id="setSizeContainer" class="col-sm-12 col-md-12"></div>
</div>
<div id="setSizeCard0" class="col-sm-6 col-md-6"></div>
<div id="room0" class="panel panel-default" style="border:solid 2px #e1e9ea"></div>
<div id="body0" class="panel-body"><div style="margin-right:95%; display: inline"><a ><img id="removecard" src="${contextPath}/resources/images/removecard.png" onClick="javascript:removeRoom(this)"/></a></div>
    <div class="hidden-sm" id="showprocess0" style="position:relative;bottom:190px;left:50px;width:110px;height:110px"></div>
</div>
</div>
<div id="setSizeDetail0" class="col-sm-12 col-md-12"></div>
<div id="roomName0" style="font-size:20pt;text-shadow: -1px 4px 4px rgba(146, 150, 150, 1);"></div>
<input type="hidden" id="roomId0" value="" />
<input type="hidden" id="examinerId0" value="" />
<div id="committee0"></div>
<div id="examiner0"></div>
<input type="hidden" id="modulatorId0" value="" />
<div id="modulator0"></div>
<div id="roomStatus0" class="checkStatus"></div>
<div id="courseName0"></div>
<input type="hidden" id="courseId0" value="" />
<div id="roomDescription0"></div>
<div id="roomTime0"></div>
<div id="setHalfSizeOne0" class="col-sm-6 col-md-6"></div>
<div id="setHalfSizeTwo0" class="col-sm-6 col-md-6"></div>
<button id="btnExaminer0" style="margin-top:10px" type="button"
        class="ui orange tiny  button"
        onClick="javascript:sendIdExaminer(this)">Examiner</button>
<button id="btnCommittee0" type="button"
        class="ui orange tiny  button" style="margin-top:10px" onClick="javascript:sendId(this)">Committee</button>
<div id="loader" align="center" style="position:fixed;left:50%;top:50%">
    <img src="resources/images/loading.gif" alt="" />
</div>
<script type="text/javascript"
        src="${contextPath}/resources/stomp.js"></script>
<script type="text/javascript"
        src="${contextPath}/resources/sockjs-0.3.4.js"></script>

<script>
/*   var w = window,
 d = document,
 e = d.documentElement,
 g = d.getElementsByTagName('body')[0],
 x = w.innerWidth || e.clientWidth || g.clientWidth,
 y = w.innerHeight|| e.clientHeight|| g.clientHeight;
 if(x==768){
 $("div[class='showprocess']").each(function(){
 $(this).attr("style","position:relative;top:0px;left:50px;width:110px;height:110px");
 });
 }*/
var totalprocessPercent=0;
var stompClient = null;
$(function(){
    ////////////////////////////////Web Socket Add Access Funtion After Subscribe///////////////////////
    var socket = new SockJS('/EvaluateTool/webSocket/requestandapprove');
    stompClient = Stomp.over(socket);
    stompClient.heartbeat.outgoing = 20000;
    stompClient.heartbeat.incoming = 20000;
    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/examinationroomandevaluateboard/requestandapprove', function(data){
            accessMethod(JSON.parse(data.body));
        });
    });
    ////////////////////////////////From Add Room And Validate///////////////////////
    $('.input-daterange').datepicker({
        format: "yyyy-mm-dd",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true
    });
    $('#timepicker3').timepicker({
        minuteStep: 5,
        secondStep:10,
        showInputs: false,
        disableFocus: true,
        showMeridian:false,
        defaultTime:'current',
        showSeconds:true
    });
    $('#timepicker4').timepicker({
        minuteStep: 5,
        secondStep:10,
        showInputs: false,
        disableFocus: true,
        showMeridian:false,
        defaultTime:'current',
        showSeconds:true
    });
    $('.ui.form')
            .form({
                description: {
                    identifier  : 'description',
                    rules: [
                        {
                            type   : 'empty',
                            prompt: "กรุณากรอกคำอธิบาย",
                        }
                    ]
                },
                nameroom: {
                    identifier  : 'nameroom',
                    rules: [
                        {
                            type   : 'empty',
                            prompt: "กรุณากรอกชื่อห้อง",
                        }
                    ]
                },
            }, {
                inline : true,
          on     : 'blur',
          onSuccess : function(data){
                var dataform = {};
                    dataform.roomName=$("input[name=nameroom]").val();
                    dataform.description=$("textarea[name=description]").val();
                    dataform.nameExaminer=$("#listExaminer").val();
                    dataform.nameCommitti=$("#listCommittee").val();
                    dataform.nameCourse=$("#listCourse").val();
                    dataform.startDate=$("input[name=startDate]").val();
                    dataform.startTime=$("input[name=startTime]").val();
                    dataform.endTime=$("input[name=endTime]").val();
                    var dataSend = JSON.stringify(dataform);
                    console.info(dataSend);
              if(dataform.nameExaminer=="ผู้เข้าสอบ"||dataform.nameCommitti=="หัวหน้าห้องสอบ"||dataform.startDate==""||dataform.startTime==""||dataform.endTime==""||dataform.nameCourse==""){
                  swal({
                       type:"error",
                       title: "แจ้งเตือน",
                       text:"กรุณากรอกข้อมูลให้ครบถ้วน",
                       closeOnConfirm:false,
                       confirmButtonText:"OK"
                   });
              }else{
                  $.ajax({
                        url : "/EvaluateTool/application/addRoom",
                        type : 'POST',
                        data : {
                            dataRoom : dataSend
                        },
                        success:function(){
                        swal({
                           type:"success",
                           title: "บันทึกสำเร็จ",
                           closeOnConfirm:false,
                           confirmButtonText:"OK"
                        });
                          $("input[name=nameroom]").val("");
                          $("textarea[name=description]").val("");
                          $("#listExaminer").text("ผู้เข้าสอบ");
                          $("#listCommittee").text("หัวหน้าห้องสอบ");
                          $("#listCourse").text("หลักสูตร");
                          $("input[name=startDate]").val("");
                          $("input[name=startTime]").val("");
                          $("input[name=endTime]").val("");
                          location.reload();
                        },
                        error:function(){
                            swal("ErrorAddRoom!!!");
                        }
                  });

              }

          }
      });

    ////////////////////////////////Function Call After Subscribe///////////////////////
    $(".dropdown").dropdown();
    function accessMethod(data){
        var namefunction=JSON.parse(data).function;
        //alert(namefunction);
        if(namefunction=="removeProcess"){
            removeProcess(data);
        }else if(namefunction=="approveSubmitModulator"){
            approveSubmitModulator(data);
        }else if(namefunction=="approveSubmitCommittee"){
            approveSubmitCommittee(data);
        }else if(namefunction=="updateStatusCard"){
            updateStatusCard(data);
        }else if(namefunction=="alertRequestSame"){
            alertRequestSame(data);
        }else if(namefunction=="approveSubmitExaminer"){
            approveSubmitExaminer(data);
        }else if(namefunction=="processPercent"){
            processPercent(data);
        }

    }

    function processPercent(data){
        $("div[id=showprocess"+JSON.parse(data).roomId+"]").each(function(index,element1){
            $("div[id=showprocess"+JSON.parse(data).roomId+"] svg").each(function(index){
                if(index==0){
                    $(this).remove();
                }
            });
            if(JSON.parse(data).percent<=9){
                var seconds = new ProgressBar.Circle(element1, {
                    duration: 200,
                    color: "#7A4634",
                    trailColor: "#ffffff",
                    strokeWidth: 13
                });
                seconds.animate((JSON.parse(data).percent)/100, function() {
                });
                $("span[id=clock-seconds"+JSON.parse(data).roomId+"]").html(JSON.parse(data).percent);
            }else if(JSON.parse(data).percent>9 && JSON.parse(data).percent<100){
                var seconds = new ProgressBar.Circle(element1, {
                    duration: 200,
                    color: "#7A4634",
                    trailColor: "#ffffff",
                    strokeWidth: 13
                });
                seconds.animate((JSON.parse(data).percent)/100, function() {
                });
                $("span[id=clock-seconds"+JSON.parse(data).roomId+"]").html(JSON.parse(data).percent);
                $("span[id=clock-seconds"+JSON.parse(data).roomId+"]").css("right","25px");
            }else{
                var seconds = new ProgressBar.Circle(element1, {
                    duration: 200,
                    color: "#7A4634",
                    trailColor: "#ffffff",
                    strokeWidth: 13
                });
                seconds.animate((JSON.parse(data).percent)/100, function() {
                });
                $("span[id=clock-seconds"+JSON.parse(data).roomId+"]").html(JSON.parse(data).percent);
                $("span[id=clock-seconds"+JSON.parse(data).roomId+"]").css("right","18px");
            }
        });
    }

    function removeProcess(data){
        //$("#loader").hide();
        var datamessage=JSON.parse(data).data;
        var yourId=JSON.parse(data).yourId;
        var roomId=JSON.parse(data).roomId;
        var yourIdInRoom='${yourId}';
        if(yourId==yourIdInRoom){
            sweetAlert(JSON.parse(data).roomName+":"+JSON.parse(data).roomDescription, datamessage,"error");
        }else{

        }

    }

    function approveSubmitModulator(data){
        var datamessage=JSON.parse(data).data;
        var yourIdApprove=JSON.parse(data).yourId;
        var roomIdApprove=JSON.parse(data).roomId;
        var yourIdInRoom='${yourId}';
        var yourNameModulator=JSON.parse(data).name;
        var yourLastNameModulator=JSON.parse(data).lastname;
        if(yourIdApprove==yourIdInRoom){
            sweetAlert(JSON.parse(data).roomDescription+":"+JSON.parse(data).roomName, datamessage, "success");
        }
        $("#modulatorId"+roomIdApprove).val(yourIdApprove);
        $("#modulator"+roomIdApprove).html("Modulator : "+yourNameModulator+" "+yourLastNameModulator+"");
    }
    function approveSubmitCommittee(data){
        var datamessage=JSON.parse(data).data;
        var yourId=JSON.parse(data).yourId;
        var roomId=JSON.parse(data).roomId;
        var examinerId=JSON.parse(data).examinerId;
        var modulatorId=JSON.parse(data).modulatorId;
        var yourIdInRoom='${yourId}';
        var roomDescription=JSON.parse(data).roomDescription;
        var roomName=JSON.parse(data).roomName;
        var detailPerson = {};
        detailPerson.yourId=yourId;
        detailPerson.roomId =roomId;
        detailPerson.committeeId = yourId;
        detailPerson.examinerId = examinerId;
        detailPerson.modulatorId = modulatorId;
        var dataPersonId = JSON.stringify(detailPerson);
        if(yourId==yourIdInRoom){
            swal({
                type:"success",
                title: JSON.parse(data).roomDescription+":"+JSON.parse(data).roomName,
                text:datamessage,
                confirmButtonColor: "#DD6B55",
                cancelButtonText: "Cancel for Decline",
                confirmButtonText: "OK for Go To EvaluateBoard",
                showCancelButton: true,
                closeOnConfirm: false,
                closeOnCancel: true
            }, function(isConfirm) {
                if (isConfirm) {
                    stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'updateMenuApproveModulatorAfterSubmitCommittee','roomId':detailPerson.roomId}));
                    $
                            .ajax({
                                url : "/EvaluateTool/application/checkCommittee",
                                type : 'POST',
                                data : {
                                    dataPersonId : dataPersonId
                                },
                                success : function(data) {
                                    var idRoom = JSON.parse(data).idRoom;
                                    var idCourse = JSON.parse(data).idCourse;
                                    var idExaminer = JSON.parse(data).idExaminer;
                                    var nameExaminer = JSON.parse(data).nameExaminer;
                                    var lastNameExaminer = JSON.parse(data).lastNameExaminer;
                                    var idCommittee = JSON.parse(data).idCommittee;
                                    var nameCommittee = JSON.parse(data).nameCommittee;
                                    var lastNameCommittee = JSON.parse(data).lastNameCommittee;
                                    var idModulator = modulatorId;
                                    var yourPosition = $("#yourPosition").val();
                                    location.href = "/EvaluateTool/application/evaluateBoard"
                                            + "?idRoom="
                                            + encodeURIComponent(idRoom)
                                            + "&idCourse="
                                            + encodeURIComponent(idCourse)
                                            + "&idExaminer="
                                            + encodeURIComponent(idExaminer)
                                            + "&nameExaminer="
                                            + encodeURIComponent(nameExaminer)
                                            + "&lastNameExaminer="
                                            + encodeURIComponent(lastNameExaminer)
                                            + "&idCommittee="
                                            + +encodeURIComponent(idCommittee)
                                            + "&nameCommittee="
                                            + encodeURIComponent(nameCommittee)
                                            + "&lastNameCommittee="
                                            + encodeURIComponent(lastNameCommittee)
                                            + "&idModulator="
                                            + encodeURIComponent(idModulator)
                                            + "&yourPosition="
                                            + encodeURIComponent(yourPosition)
                                            + "&roomDescription="
                                            + encodeURIComponent(roomDescription)
                                            + "&roomName="
                                            + encodeURIComponent(roomName);
                                },error:function() {
                                    swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                                        type: "error",
                                        confirmButtonColor: "#8ACBE5",
                                        confirmButtonText: "OK",
                                        closeOnConfirm: false
                                    }, function (isConfirm) {
                                        if (isConfirm) {
                                            location.reload();
                                        }
                                    });
                                }
                            });
                }else{
                    $.ajax({
                        url: "/EvaluateTool/application/removeRequestCommittee",
                        type: "POST",
                        data: {
                            dataPersonId:dataPersonId
                        },
                        success: function (data) {

                        }
                    });
                }
            });
        }
    }
    function approveSubmitExaminer(data){
        var datamessage=JSON.parse(data).data;
        var yourId=JSON.parse(data).yourId;
        var roomId=JSON.parse(data).roomId;
        var examinerId=JSON.parse(data).examinerId;
        var modulatorId=JSON.parse(data).modulatorId;
        var yourIdInRoom='${yourId}';
        var roomDescription=JSON.parse(data).roomDescription;
        var roomName=JSON.parse(data).roomName;
        var detailPerson = {};
        detailPerson.yourId=yourId;
        detailPerson.roomId =roomId;
        detailPerson.committeeId = yourId;
        detailPerson.examinerId = examinerId;
        detailPerson.modulatorId = modulatorId;
        var dataPersonId = JSON.stringify(detailPerson);
        if(yourId==yourIdInRoom){
            swal({
                type:"success",
                title: JSON.parse(data).roomDescription+":"+JSON.parse(data).roomName,
                text:datamessage,
                confirmButtonColor: "#DD6B55",
                cancelButtonText: "Cancel for Decline",
                confirmButtonText: "OK for Go To EvaluateBoard",
                showCancelButton: true,
                closeOnConfirm: true,
                closeOnCancel: true
            }, function(isConfirm) {
                if (isConfirm) {
                    /*stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'updateMenuApproveModulatorAfterSubmitCommittee','roomId':detailPerson.roomId}));
                     $
                     .ajax({
                     url : "/EvaluateTool/application/checkCommittee",
                     type : 'POST',
                     data : {
                     dataPersonId : dataPersonId
                     },
                     success : function(data) {
                     var idRoom = JSON.parse(data).idRoom;
                     var idCourse = JSON.parse(data).idCourse;
                     var idExaminer = JSON.parse(data).idExaminer;
                     var nameExaminer = JSON.parse(data).nameExaminer;
                     var lastNameExaminer = JSON.parse(data).lastNameExaminer;
                     var idCommittee = JSON.parse(data).idCommittee;
                     var nameCommittee = JSON.parse(data).nameCommittee;
                     var lastNameCommittee = JSON.parse(data).lastNameCommittee;
                     var idModulator = modulatorId;
                     var yourPosition = $("#yourPosition").val();
                     location.href = "/EvaluateTool/application/evaluateBoard"
                     + "?idRoom="
                     + encodeURIComponent(idRoom)
                     + "&idCourse="
                     + encodeURIComponent(idCourse)
                     + "&idExaminer="
                     + encodeURIComponent(idExaminer)
                     + "&nameExaminer="
                     + encodeURIComponent(nameExaminer)
                     + "&lastNameExaminer="
                     + encodeURIComponent(lastNameExaminer)
                     + "&idCommittee="
                     + +encodeURIComponent(idCommittee)
                     + "&nameCommittee="
                     + encodeURIComponent(nameCommittee)
                     + "&lastNameCommittee="
                     + encodeURIComponent(lastNameCommittee)
                     + "&idModulator="
                     + encodeURIComponent(idModulator)
                     + "&yourPosition="
                     + encodeURIComponent(yourPosition)
                     + "&roomDescription="
                     + encodeURIComponent(roomDescription)
                     + "&roomName="
                     + encodeURIComponent(roomName);
                     },error:function() {
                     swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                     type: "error",
                     confirmButtonColor: "#8ACBE5",
                     confirmButtonText: "OK",
                     closeOnConfirm: false
                     }, function (isConfirm) {
                     if (isConfirm) {
                     location.reload();
                     }
                     });
                     }*//*,
                     error : function(data, status, er) {
                     alert("error: " + data + " status: " + status
                     + " er:" + er);
                     }*//*
                     });*/
                }else{
                    /*   $.ajax({
                     url: "/EvaluateTool/application/removeRequestCommittee",
                     type: "POST",
                     data: {
                     dataPersonId:dataPersonId
                     },
                     success: function (data) {

                     }
                     });*/
                }
            });
        }
    }
    function updateStatusCard(data){
        var count=JSON.parse(data).count;
        $("#body"+count+"").css("background-color","rgb(243, 243, 76");
        $("#roomStatus"+count+"").text("Status : Ready");
        $("#roomStatus"+count+"").attr("value","Ready");
    }
    function alertRequestSame(data){
        if(JSON.parse(data).yourId=='${yourId}'){
            sweetAlert(JSON.parse(data).roomDescription+":"+JSON.parse(data).roomName, "กรุณารอ คุณได้ทำการส่งไปแล้ว", "warning");
        }
    }
    $.ajax({
          url: "/EvaluateTool/application/sendName",
          type: "POST",
          success: function(data){
                var listname = JSON.parse(data);
                $.each(listname,function(index,item){
                    item.forEach(function(idAndName){
                            //console.log(idAndName.idPerson);
                            $("#listExaminer").append('<option style="font-size:8pt" value="'+idAndName.idPerson+'">'+idAndName.namePerson+'</option>');

                    });
                });
          },
          error: function(){
              swal("ErrorGetName");
          }
      });

      $.ajax({
          url: "/EvaluateTool/application/sendName",
          type: "POST",
          success: function(data){
                var listname = JSON.parse(data);
                    $.each(listname,function(index,item){
                    item.forEach(function(idAndName){
                            //console.log(idAndName.idPerson);
                            $("#listCommittee").append('<option style="font-size:8pt" value="'+idAndName.idPerson+'">'+idAndName.namePerson+'</option>');
                    });
                });
          },
          error: function(){
              swal("ErrorGetName");
          }
      });
      $.ajax({
          url: "/EvaluateTool/application/sendDescription",
          type: "POST",
          success: function(data){
                var listnamecourse = JSON.parse(data);
                    $.each(listnamecourse,function(index,item){
                        item.forEach(function(idAndDescription){
                                //console.log(idAndDescription.idCourse);
                                $("#listCourse").append('<option style="font-size:8pt" value="'+idAndDescription.idCourse+'">'+idAndDescription.descriptionCourse+'</option>');
                        });
                    });
          },
          error: function(){
              swal("ErrorGetName");
          }
      });
});

////////////////////////////////Set Standard Content And Menu After Open Page///////////////////////
var yourPosition='${yourPosition}';
var name='${name}';
var lastname='${lastname}';
$("#fullname").html(name+"  "+lastname);
$("#loader").hide();
if(yourPosition=="Manager"||yourPosition=="Software Analyst"||yourPosition=="Software Development"){
    $("#btnnotificationsubmitandcalcel").show();
    $("#headdropdownapprovepermission").hide();
    $("#headdropdownsubmitandcancel").hide();
    $("#menuleft").hide();
    $("#imgmenuleft").hide();
    $("#contenthead").removeClass("col-md-10 column");
    $("#contenthead").addClass("col-md-12 column");
}else{
    $("#btnnotificationsubmitandcalcel").hide();
    $("#headdropdownapprovepermission").hide();
    $("#headdropdownsubmitandcancel").hide();
    $("#menuleft").hide();
    $("#imgmenuleft").hide();
    $("#contenthead").removeClass("col-md-10 column");
    $("#contenthead").addClass("col-md-12 column");
}
if(yourPosition=="Software Analyst"){
    $("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    $("#confighistory").show();
    $("#configmanager").show();
}else if(yourPosition=="Manager"){
    $("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    $("#confighistory").show();
    $("#configmanager").show();
}else if(yourPosition=="Software Development Trainee"){
    $("#confighome").show();
    $("#configroom").show();
    $("#configreport").hide();
    $("#confighistory").hide();
    $("#configmanager").hide();
}else{
    $("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    $("#confighistory").show();
    $("#configmanager").hide();
}

$("#imgmenuleftplus").mouseover(function(){
    $("#extendimgmenuplus").slideToggle(800);
});
$("#imgmenuleftplus").mouseout(function(){
    $("#extendimgmenuplus").slideToggle(800);
});
var i= 0;
function openmenuplus(){
    if(i==0){
        $("#contenthead").removeClass("col-md-12 column").addClass("col-md-9 column");
        $("#contentcol2").removeClass("col-md-2 column").addClass("col-md-3 column");
        $("#fromadd").slideToggle(400);
        i++;
    }else{
        $("#contenthead").removeClass("col-md-9 column").addClass("col-md-12 column");
        $("#contentcol2").removeClass("col-md-3 column").addClass("col-md-2 column");
        $("#fromadd").hide();
        i--;
    }
}

////////////////////////////////Create Card///////////////////////
$(function() {
    $("#setSizeCard0").hide();
    $("#room0").hide();
    $("#body0").hide();
    $("#setSizeDetail0").hide();
    $("#roomName0").hide();
    $("#courseName0").hide();
    $("#roomDescription0").hide();
    $("#roomTime0").hide();
    $("#examiner0").hide();
    $("#modulator0").hide();
    $("#roomStatus0").hide();
    $("#setHalfSizeOne0").hide();
    $("#setHalfSizeTwo0").hide();
    $("#btnExaminer0").hide();
    $("#btnCommittee0").hide();
    $("#committee0").hide();
    $("#showprocess0").hide();

    var allRoom = JSON.parse('${room}');
    var memberEachRoom = JSON.parse('${memberEachRoom}');
    var dummySetSizeCard = 0;
    var dummyRoom = 0;
    var dummyBody = 0;
    var dummyProgress = 0;
    var dummyDetail = 0;
    var dummyRoomId = 0;
    var dummyRoomName = 0;
    var dummyCourseId = 0;
    var dummyCourseName = 0;
    var dummyRoomDescription = 0;
    var dummyTime = 0;
    var dummyExaminerId = 0;
    var dummyExaminer = 0;
    var dummyModulatorId = 0;
    var dummyModulator = 0;
    var dummyRoomStatus = 0;
    var dummySetHalfSizeOne = 0;
    var dummySetHalfSizeTwo = 0;
    var dummyBtnExaminer = 0;
    var dummyBtnCommittee = 0;
    var dummyCommittee = 0;

    var genSetSizeCard = ("#setSizeCard" + dummySetSizeCard);
    var genRoom = ("#room" + dummyRoom);
    var genBody = ("#body" + dummyBody);
    var genProgress = ("#setSizeProgress" + dummyProgress);
    var genDetail = ("#setSizeDetail" + dummyDetail);
    var genRoomId = ("#roomId" + dummyRoomId);
    var genRoomName = ("#roomName" + dummyRoomName);
    var genCourseId = ("#courseId" + dummyCourseId);
    var genCourseName = ("#courseName" + dummyCourseName);
    var genRoomDescription = ("#roomDescription" + dummyRoomDescription);
    var genTime = ("#roomTime" + dummyTime);
    var genExaminerId = ("#examinerId" + dummyExaminerId);
    var genExaminer = ("#examiner" + dummyExaminer);
    var genModulatorId = ("#modulatorId" + dummyModulatorId);
    var genModulator = ("#modulator" + dummyModulator);
    var genRoomStatus = ("#roomStatus" + dummyRoomStatus);
    var genSetHalfSizeOne = ("#setHalfSizeOne" + dummySetHalfSizeOne);
    var genSetHalfSizeTwo = ("#setHalfSizeTwo" + dummySetHalfSizeTwo);
    var genBtnExaminer = ("#btnExaminer" + dummyBtnExaminer);
    var genBtnCommittee = ("#btnCommittee" + dummyBtnCommittee);
    var genCommittee = ("#committee" + dummyCommittee);
    var summaryOfTopic=0;
    var summarySubmitScoreOfTopic=0;
    var totalPercentScoreInRoom=0;
    $
            .each(
            allRoom,
            function(i, item) {
                item
                        .forEach(function(room) {

                            var roomId = room.id;
                            var roomName = room.name;
                            var roomCourseId = room.courseId;
                            var roomCourseName = room.courseName;
                            var roomDescription = room.description;
                            var roomStartTime = room.startTime;
                            var roomEndTime = room.endTime;
                            var roomExaminerId = room.examinerId;
                            var roomExaminer = room.examiner;
                            var roomModulatorId = room.modulatorId;
                            var roomModulator = room.modulator;
                            var roomStatus = room.status;

                            $("#setSizeCard0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'setSizeCard'
                                            + (++dummySetSizeCard))
                                    .insertAfter(genSetSizeCard)
                                    .show()
                                    .appendTo(
                                    $("#setSizeContainer"));
                            $("#room0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'room'
                                            + (++dummyRoom))
                                    .insertAfter(genRoom)
                                    .fadeIn('slow')
                                    .appendTo(
                                    $("#setSizeCard"
                                            + dummySetSizeCard));
                            $("#body0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'body'
                                            + (++dummyBody))
                                    .insertAfter(genBody)
                                    .show()
                                    .appendTo(
                                    $("#room"
                                            + dummyRoom));
                            $("#setSizeDetail0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'setSizeDetail'
                                            + (++dummyDetail))
                                    .insertAfter(genDetail)
                                    .show()
                                    .appendTo(
                                    $("#body"
                                            + dummyRoom));
                            $("#roomId0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'roomId'
                                            + (++dummyRoomId))
                                    .val(roomId)
                                    .insertAfter(genRoomId)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#roomName0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'roomName'
                                            + (++dummyRoomName))
                                    .text(roomName)
                                    .insertAfter(genRoomName)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#courseId0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'courseId'
                                            + (++dummyCourseId))
                                    .val(roomCourseId)
                                    .insertAfter(genCourseId)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#courseName0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'courseName'
                                            + (++dummyCourseName))
                                    .text(roomCourseName)
                                    .insertAfter(genCourseName)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            /* var countIdExaminer= ++dummyExaminerId;
                             for(var i in room.examiner){
                             var examinerEachRoom=room.examiner[i].examiner;
                             var examinerIdEachRoom=room.examiner[i].examinerId;*/
                            $("#examinerId0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'examinerId'
                                            + (++dummyExaminerId))
                                    .val(room.examinerId)
                                    .insertAfter(genExaminerId)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#examiner0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'examiner'
                                            + (++dummyExaminer))
                                    .text(
                                            "Examiner : "
                                            + roomExaminer)
                                    .insertAfter(genExaminer)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            //}
                            $("#modulatorId0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'modulatorId'
                                            + (++dummyModulatorId))
                                    .val(roomModulatorId)
                                    .insertAfter(genModulatorId)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#modulator0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'modulator'
                                            + (++dummyModulator))
                                    .text(
                                            "Modulator : "
                                            + roomModulator)
                                    .insertAfter(genModulator)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#roomStatus0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'roomStatus'
                                            + (++dummyRoomStatus))
                                    .attr(
                                    'value',
                                    roomStatus)
                                    .text(
                                            "Status : "
                                            + roomStatus)
                                    .insertAfter(genRoomStatus)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#roomDescription0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'roomDescription'
                                            + (++dummyRoomDescription))
                                    .text(roomDescription)
                                    .insertAfter(
                                    genRoomDescription)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#roomTime0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'roomTime'
                                            + (++dummyTime))
                                    .text(
                                            roomStartTime
                                            + " : "
                                            + roomEndTime)
                                    .insertAfter(genTime)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#showprocess0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'showprocess'
                                            + (dummyDetail))
                                    .insertAfter(genDetail)
                                    .show()
                                    .appendTo(
                                    $("#body"
                                            + dummyRoom));

                            ////////////////////////////////////////Add Percent Submit Topic Each Subject///////////////////////////////////////////////////
                            var data={};
                            data.roomId=String(roomId);
                            data.examinerId=roomExaminerId;
                            data.committeeId=String(roomModulatorId);
                            data.courseId=String(roomCourseId);
                            var dataEachRoom=JSON.stringify(data);
                            $.ajax({
                                url : "/EvaluateTool/application/evaluateBoardTopicList",
                                type : 'POST',
                                data:{
                                    data:dataEachRoom
                                },success:function(data){
                                    $.each(JSON.parse(data),function(i,element){
                                        element.forEach(function(subject){
                                            for(var i in subject.topic){
                                                summaryOfTopic=summaryOfTopic+1;
                                                if(subject.topic[i].score!="-"){
                                                    summarySubmitScoreOfTopic=summarySubmitScoreOfTopic+1;
                                                }
                                            }
                                        });
                                    });
                                    var showProcessEachRoom=$("div[id=showprocess"+roomId+"]").append('<span id="clock-seconds'+roomId+'" class="label label-success" style="text-shadow: -1px 4px 4px rgb(146, 150, 150);font-size:18pt;position:relative;top:65px;right:30px"></span>');
                                    var elementProcess=document.getElementById("showprocess"+roomId);
                                    totalPercentScoreInRoom=totalPercentScoreInRoom+(~~((summarySubmitScoreOfTopic*100)/(summaryOfTopic)));
                                    if(totalPercentScoreInRoom<=9){
                                        var seconds = new ProgressBar.Circle(elementProcess, {
                                            duration: 200,
                                            color: "#7A4634",
                                            trailColor: "#ffffff",
                                            strokeWidth: 13
                                        });
                                        seconds.animate((totalPercentScoreInRoom)/100, function() {
                                        });
                                        $("span[id=clock-seconds"+roomId+"]").html(totalPercentScoreInRoom);
                                    }else if(totalPercentScoreInRoom>9 && totalPercentScoreInRoom<100){
                                        var seconds = new ProgressBar.Circle(elementProcess, {
                                            duration: 200,
                                            color: "#7A4634",
                                            trailColor: "#ffffff",
                                            strokeWidth: 13
                                        });
                                        seconds.animate((totalPercentScoreInRoom)/100, function() {
                                        });
                                        $("span[id=clock-seconds"+roomId+"]").html(totalPercentScoreInRoom);
                                        $("span[id=clock-seconds"+roomId+"]").css("right","25px");
                                    }else {
                                        var seconds = new ProgressBar.Circle(elementProcess, {
                                            duration: 200,
                                            color: "#7A4634",
                                            trailColor: "#ffffff",
                                            strokeWidth: 13
                                        });
                                        seconds.animate((totalPercentScoreInRoom) / 100, function () {
                                        });
                                        $("span[id=clock-seconds" + roomId + "]").html(totalPercentScoreInRoom);
                                        $("span[id=clock-seconds" + roomId + "]").css("right", "18px");
                                    }
                                    summaryOfTopic=0;
                                    summarySubmitScoreOfTopic=0;
                                    totalPercentScoreInRoom=0;
                                }
                            });
                            $("#setHalfSizeOne0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'setHalfSizeOne'
                                            + (++dummySetHalfSizeOne))
                                    .insertAfter(
                                    genSetHalfSizeOne)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));
                            $("#setHalfSizeTwo0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'setHalfSizeTwo'
                                            + (++dummySetHalfSizeTwo))
                                    .insertAfter(
                                    genSetHalfSizeTwo)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));

                            $("#committee0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'committee'
                                            + (++dummyCommittee))
                                    .insertAfter(
                                    genCommittee)
                                    .show()
                                    .appendTo(
                                    $("#setSizeDetail"
                                            + dummyDetail));

                            for(var i in room.committee){
                                var committeeEachRoom=room.committee[i].committee;
                                var committeeIdEachRoom=room.committee[i].committeeId;
                                $("#committee"+dummyCommittee+"").append("<input id='nameCommittee' type='hidden' value='"+committeeEachRoom+"'/>");
                                $("#committee"+dummyCommittee+"").append("<input id='idCommittee'  type='hidden' value='"+committeeIdEachRoom+"'/>");
                            }

                            $("#btnExaminer0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'btnExaminer'
                                            + (++dummyBtnExaminer))
                                    .insertAfter(genBtnExaminer)
                                    .show()
                                    .appendTo(
                                    $("#setHalfSizeOne"
                                            + dummySetHalfSizeOne));
                            $("#btnCommittee0")
                                    .clone()
                                    .attr(
                                    'id',
                                            'btnCommitte'
                                            + (++dummyBtnCommittee))
                                    .insertAfter(
                                    genBtnCommittee)
                                    .show()
                                    .appendTo(
                                    $("#setHalfSizeTwo"
                                            + dummySetHalfSizeTwo));
                        });

                var count = 0;
                var lengthOfMemberEachRoom = memberEachRoom.room.length;
                var lengthOfAllroom = allRoom.room.length;
                for (count; count < lengthOfMemberEachRoom; count++) {
                    var memberOfRoom = memberEachRoom.room[count].idRoom;

                    if (memberEachRoom.room[count].idPerson == allRoom.room[memberOfRoom - 1].examinerId) {
                        $("#btnExaminer" + (memberOfRoom));
                        /*		.removeClass('ui orange tiny disabled button'
                         );*/
                        $("#btnExaminer" + (memberOfRoom));
                        /*		.addClass('ui orange tiny button'
                         );*/
                        $("#btnExaminer" + (memberOfRoom));
                        /*		.removeAttr('disabled',
                         'disabled');	*/
                    } else {
                        $("#btnCommitte" + (memberOfRoom));
                        /*	.removeClass('ui orange tiny disabled button'
                         );*/
                        $("#btnCommitte" + (memberOfRoom));
                        /*	.addClass('ui orange tiny button'
                         );*/
                        $("#btnCommitte" + (memberOfRoom));
                        /*	.removeAttr('disabled',
                         'disabled');	*/
                    }
                }
            });
    /*Check Status And AddColor Card*/
    $("div[class=checkStatus]").each(function(index,element){
        var status=$(this).html();
        var indexbody=index+1;
        //alert(indexbody);
        if(status==("Status : Completed")){
            $("div[id=body"+indexbody+"] #removecard").hide();
            $("div[id=body"+indexbody+"]").css("background-color","#d0f8a6");
        }else if(status==("Status : Testing")){
            $("div[id=body"+indexbody+"] #removecard").hide();
            $("div[id=body"+indexbody+"]").css("background-color","#b0e1df");
        }else if(status==("Status : Waiting")){
            $("div[id=body"+indexbody+"]").css("background-color","#ffc166");
        }else if(status==("Status : Ready")){
            $("div[id=body"+indexbody+"] #removecard").hide();
            $("div[id=body"+indexbody+"]").css("background-color","#f3f34c");
        }else if(status==("Status : Terminate")){
            $("div[id=body"+indexbody+"] #removecard").hide();
            $("div[id=body"+indexbody+"]").css("background-color","#cdc5bf");
        }
    });
});


////////////////////////////////Event Submit Button Committee///////////////////////
function sendId(element) {
    var count = (element.id).replace(/[^\d.]/g, '');
    var roomStatus=$("#roomStatus"+count).attr('value');
    var roomName=$("#roomName"+count).text();
    var roomDescription=$("#roomDescription"+count).text();
    var yourId='${yourId}';
    var name='${name}';
    var lastname='${lastname}';
    var detailPerson = {};
    detailPerson.roomId = $("#roomId" + count).val();
    detailPerson.committeeId = $("#yourId").val();
    detailPerson.examinerId = $("#examinerId" + count).val();
    detailPerson.modulatorId = $("#modulatorId" + count).val();
    detailPerson.yourId=yourId;
    var dataPersonId = JSON.stringify(detailPerson);
    if(roomStatus=="Ready"||roomStatus=="Testing"||(roomStatus=="Waiting"&&yourId==detailPerson.modulatorId)||roomStatus=="Completed"){
        if(yourId==detailPerson.examinerId){
            sweetAlert("คุณเป็น Examiner ห้องนี้แล้ว", "ไม่สามารถเป็น Modulator ได้","error");
        }else if(yourId==detailPerson.modulatorId){
            if(roomStatus!="Completed"&&roomStatus!="Testing"){
                $.ajax({
                    url:"/EvaluateTool/application/setStatusRoomReady",
                    type:"POST",
                    data:{
                        roomId:dataPersonId
                    },
                    success:function(){
                        stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'updateStatusCard','name': name,'lastname': lastname,'yourId':yourId,'roomId':detailPerson.roomId,'modulatorId':detailPerson.modulatorId,'count':count }));
                        $
                                .ajax({
                                    url : "/EvaluateTool/application/checkCommittee",
                                    type : 'POST',
                                    data : {
                                        dataPersonId : dataPersonId
                                    },
                                    success : function(data) {
                                        var idRoom = JSON.parse(data).idRoom;
                                        var idCourse = JSON.parse(data).idCourse;
                                        var idExaminer = JSON.parse(data).idExaminer;
                                        var nameExaminer = JSON.parse(data).nameExaminer;
                                        var lastNameExaminer = JSON.parse(data).lastNameExaminer;
                                        var idCommittee = JSON.parse(data).idCommittee;
                                        var nameCommittee = JSON.parse(data).nameCommittee;
                                        var lastNameCommittee = JSON.parse(data).lastNameCommittee;
                                        var idModulator = JSON.parse(data).idModulator;
                                        var yourPosition = $("#yourPosition").val();
                                        location.href = "/EvaluateTool/application/evaluateBoard"
                                                + "?idRoom="
                                                + encodeURIComponent(idRoom)
                                                + "&idCourse="
                                                + encodeURIComponent(idCourse)
                                                + "&idExaminer="
                                                + encodeURIComponent(idExaminer)
                                                + "&nameExaminer="
                                                + encodeURIComponent(nameExaminer)
                                                + "&lastNameExaminer="
                                                + encodeURIComponent(lastNameExaminer)
                                                + "&idCommittee="
                                                + +encodeURIComponent(idCommittee)
                                                + "&nameCommittee="
                                                + encodeURIComponent(nameCommittee)
                                                + "&lastNameCommittee="
                                                + encodeURIComponent(lastNameCommittee)
                                                + "&idModulator="
                                                + encodeURIComponent(idModulator)
                                                + "&yourPosition="
                                                + encodeURIComponent(yourPosition)
                                                + "&roomDescription="
                                                + encodeURIComponent(roomDescription)
                                                + "&roomName="
                                                + encodeURIComponent(roomName);
                                    },error:function() {
                                        swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                                            type: "error",
                                            confirmButtonColor: "#8ACBE5",
                                            confirmButtonText: "OK",
                                            closeOnConfirm: false
                                        }, function (isConfirm) {
                                            if (isConfirm) {
                                                location.reload();
                                            }
                                        });
                                    }
                                });
                    }
                });
            }else{
                $ .ajax({
                    url : "/EvaluateTool/application/checkCommittee",
                    type : 'POST',
                    data : {
                        dataPersonId : dataPersonId
                    },
                    success : function(data) {
                        var idRoom = JSON.parse(data).idRoom;
                        var idCourse = JSON.parse(data).idCourse;
                        var idExaminer = JSON.parse(data).idExaminer;
                        var nameExaminer = JSON.parse(data).nameExaminer;
                        var lastNameExaminer = JSON.parse(data).lastNameExaminer;
                        var idCommittee = JSON.parse(data).idCommittee;
                        var nameCommittee = JSON.parse(data).nameCommittee;
                        var lastNameCommittee = JSON.parse(data).lastNameCommittee;
                        var idModulator = JSON.parse(data).idModulator;
                        var yourPosition = $("#yourPosition").val();
                        location.href = "/EvaluateTool/application/evaluateBoard"
                                + "?idRoom="
                                + encodeURIComponent(idRoom)
                                + "&idCourse="
                                + encodeURIComponent(idCourse)
                                + "&idExaminer="
                                + encodeURIComponent(idExaminer)
                                + "&nameExaminer="
                                + encodeURIComponent(nameExaminer)
                                + "&lastNameExaminer="
                                + encodeURIComponent(lastNameExaminer)
                                + "&idCommittee="
                                + +encodeURIComponent(idCommittee)
                                + "&nameCommittee="
                                + encodeURIComponent(nameCommittee)
                                + "&lastNameCommittee="
                                + encodeURIComponent(lastNameCommittee)
                                + "&idModulator="
                                + encodeURIComponent(idModulator)
                                + "&yourPosition="
                                + encodeURIComponent(yourPosition)
                                + "&roomDescription="
                                + encodeURIComponent(roomDescription)
                                + "&roomName="
                                + encodeURIComponent(roomName);
                    },error:function() {
                        swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                            type: "error",
                            confirmButtonColor: "#8ACBE5",
                            confirmButtonText: "OK",
                            closeOnConfirm: true
                        }, function (isConfirm) {
                            if (isConfirm) {
                                location.reload();
                            }
                        });
                    }
                });
            }
        }else{
            var committee=[];
            $("#committee"+count+" input[id=idCommittee]").each(function(){
                committee.push($(this).val());
            });
            if(committee.indexOf(yourId)!=-1){
                $
                        .ajax({
                            url : "/EvaluateTool/application/checkCommittee",
                            type : 'POST',
                            data : {
                                dataPersonId : dataPersonId
                            },
                            success : function(data) {
                                var idRoom = JSON.parse(data).idRoom;
                                var idCourse = JSON.parse(data).idCourse;
                                var idExaminer = JSON.parse(data).idExaminer;
                                var nameExaminer = JSON.parse(data).nameExaminer;
                                var lastNameExaminer = JSON.parse(data).lastNameExaminer;
                                var idCommittee = JSON.parse(data).idCommittee;
                                var nameCommittee = JSON.parse(data).nameCommittee;
                                var lastNameCommittee = JSON.parse(data).lastNameCommittee;
                                var idModulator = JSON.parse(data).idModulator;
                                var yourPosition = $("#yourPosition").val();
                                location.href = "/EvaluateTool/application/evaluateBoard"
                                        + "?idRoom="
                                        + encodeURIComponent(idRoom)
                                        + "&idCourse="
                                        + encodeURIComponent(idCourse)
                                        + "&idExaminer="
                                        + encodeURIComponent(idExaminer)
                                        + "&nameExaminer="
                                        + encodeURIComponent(nameExaminer)
                                        + "&lastNameExaminer="
                                        + encodeURIComponent(lastNameExaminer)
                                        + "&idCommittee="
                                        + +encodeURIComponent(idCommittee)
                                        + "&nameCommittee="
                                        + encodeURIComponent(nameCommittee)
                                        + "&lastNameCommittee="
                                        + encodeURIComponent(lastNameCommittee)
                                        + "&idModulator="
                                        + encodeURIComponent(idModulator)
                                        + "&yourPosition="
                                        + encodeURIComponent(yourPosition)
                                        + "&roomDescription="
                                        + encodeURIComponent(roomDescription)
                                        + "&roomName="
                                        + encodeURIComponent(roomName);
                            },error:function() {
                                swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                                    type: "error",
                                    confirmButtonColor: "#8ACBE5",
                                    confirmButtonText: "OK",
                                    closeOnConfirm: true
                                }, function (isConfirm) {
                                    if (isConfirm) {
                                        location.reload();
                                    }
                                });
                            }
                        });
            }else{
                if(roomStatus!="Completed"){
                    $.ajax({
                        url:"/EvaluateTool/application/addRequestCommittee",
                        type:"POST",
                        data:{
                            dataPersonId:dataPersonId
                        },
                        success:function(data){
                            if(data=="success"){
                                stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'sendRequestCommittee','name': name,'lastname': lastname,'yourId':yourId,'role':'committee','modulator':false,'title':'เข้าเป็นผู้ประเมิน','roomId':detailPerson.roomId,'modulatorId':detailPerson.modulatorId,'count':count,'roomName':roomName,'roomDescription':roomDescription }));
                                swal({   title: "ระบบได้ส่ง Request ไปแล้วกรุณารอ Modulator Approve",
                                    text:"Click Yes for Wait Behind OR Click Cancel for Cancel",
                                    confirmButtonColor: "#8ACBE5",
                                    confirmButtonText: "Yes",
                                    cancelButtonText: "Cancel",
                                    closeOnCancel: true,
                                    closeOnConfirm: true,
                                    showCancelButton: true,
                                    imageUrl: "resources/images/loading.gif"
                                }, function(isConfirm){
                                    if (isConfirm) {
                                    }else{
                                        $.ajax({
                                            url: "/EvaluateTool/application/removeRequestCommittee",
                                            type: "POST",
                                            data: {
                                                dataPersonId:dataPersonId
                                            },
                                            success: function (data) {
                                                stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'cancelRequestCommittee', 'name': name, 'lastname': lastname, 'yourId': yourId, 'role': 'committee', 'modulator': false, 'title': 'เข้าเป็นผู้ประเมิน', 'roomId': detailPerson.roomId, 'modulatorId': detailPerson.modulatorId, 'count': count,'participantId':data }));
                                            }
                                        });
                                    }
                                });
                            }else{
                                stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head':'alertRequestSame','yourId':'${yourId}','roomName':roomName,'roomDescription':roomDescription}));
                            }
                        },error:function(){
                            swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
                                type:"error",
                                confirmButtonColor: "#8ACBE5",
                                confirmButtonText: "OK",
                                closeOnConfirm: true
                            }, function(isConfirm) {
                                if(isConfirm){
                                    location.reload();
                                }
                            });
                        }
                    });
                }else{
                    sweetAlert("การสอบได้สำเร็จแล้ว", "ไม่สามารถสมัครเป็น Committee ได้","error");
                }
            }
        }

    }else if(roomStatus=="Terminate"){
        sweetAlert("", "การสอบได้มีการยุติ","error");
    }else if(roomStatus=="Waiting"){
        sweetAlert("", "Modulator ยังไม่เข้าห้อง","error");
    }
}

////////////////////////////////Event Submit Button Examiner///////////////////////
function sendIdExaminer(element) {
    count = (element.id).replace(/[^\d.]/g, '');
    var roomId = $("#roomId" + count).val();
    var name='${name}';
    var lastname='${lastname}';
    var yourId = $("#yourId").val();
    var yourPosition = $("#yourPosition").val();
    var examinerId = $("#examinerId" + count).val();
    var courseId = $("#courseId" + count).val();
    var modulatorId=$("#modulatorId" + count).val();
    var roomStatus=$("#roomStatus"+count).attr("value");
    var roomName=$("#roomName"+count).text();
    var roomDescription=$("#roomDescription"+count).text();
    var committee=[];
    $("#committee"+count+" input[id=idCommittee]").each(function(){
        committee.push($(this).val());
    });
    /*            var detailPerson = {};
     detailPerson.roomId = $("#roomId" + count).val();
     detailPerson.committeeId = $("#yourId").val();
     detailPerson.examinerId = $("#examinerId" + count).val();
     detailPerson.modulatorId = $("#modulatorId" + count).val();
     detailPerson.yourId=yourId;
     var dataPersonId = JSON.stringify(detailPerson);*/
    if(roomStatus=="Completed"){
        sweetAlert("", "การสอบสำเร็จแล้ว","success");
    }
    else if(roomStatus=="Ready"||roomStatus=="Testing"){
        if(yourId==examinerId){
            location.href = "/EvaluateTool/application/examinerDashBoard"
                    + "?idRoom=" + encodeURIComponent(roomId) + "&idExaminer="
                    + encodeURIComponent(examinerId) + "&idCourse="
                    + encodeURIComponent(courseId) + "&yourId="
                    + encodeURIComponent(yourId) + "&yourPosition="
                    + encodeURIComponent(yourPosition) + "&name="
                    + encodeURIComponent('${name}') + "&lastname="
                    + encodeURIComponent('${lastname}');
        }else if(yourId==modulatorId){
            sweetAlert("คุณเป็น Modulator ห้องนี้แล้ว", "ไม่สามารถเป็น Examiner ได้","error");
        }else if(committee.indexOf(yourId)!=-1){
            sweetAlert("คุณเป็น Comittee ห้องนี้แล้ว", "ไม่สามารถเป็น Examiner ได้","error");
        }else{
            //stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'sendRequestExaminer','name': name,'lastname': lastname,'yourId':yourId,'role':'examiner','modulator':false,'title':'เข้าเป็นผู้เข้าสอบ','roomId':roomId,'modulatorId':modulatorId,'count':count,'roomName':roomName,'roomDescription':roomDescription }));
            sweetAlert("กรุณาสร้างห้องใหม่", "ห้องนี้มี Examiner แล้ว","error");
        }

    }else if(roomStatus=="Terminate"){
        sweetAlert("", "การสอบได้มีการยุติ","error");
    }else if(roomStatus=="Waiting"){
        sweetAlert("", "Modulator ยังไม่เข้าห้อง","error");
    }

}
$("#logOut").click(function() {
    location.href = "/EvaluateTool/application/logIn";
});

$("#courseManager").click(
        function() {
            location.href = "/EvaluateTool/application/managerCourse"
                    + "?yourId="
                    + encodeURIComponent('${yourId}')
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastname}');
        });
    
    function removeRoom(element){
        var sendId = element.parentElement.parentElement.parentElement.children[2].children[0].value;
        swal({
          title: "Are you sure?",
          text: "You will not be able to recover this room!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "Yes, delete it!",
          cancelButtonText: "No, cancel plx!",
          closeOnConfirm: false,
          closeOnCancel: true
        },
        function(isConfirm) {
          if (isConfirm) {
            $.ajax({
               url:"/EvaluateTool/application/removeRoom",
                type:"POST",
                data:{
                    dataId:sendId
                },
                success:function(){
                    element.parentElement.parentElement.parentElement.parentElement.remove();
                    swal("Deleted!", "Your room has been deleted.", "success");
                },
                error:function(){
                    swal("Cancelled", "Your room is safe :)", "error");
                }
             });
          }
        });
    }

    function editName(element){
        var x = element.textContent;
        alert(x);
    }
    
</script>
</body>
</html>