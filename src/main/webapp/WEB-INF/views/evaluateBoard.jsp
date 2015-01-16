<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluate Board</title>
<style>
#require {
    margin-top: 10px;
}

#message {
    margin-top: 10px;
}

.navbar-default {
    background-color: #FF8C00;
}

.navbar-default>.container-fluid>.navbar-header>.navbar-brand {
    color: black;
}

.navbar-default>.container-fluid>.navbar-collapse>.navbar-nav>li>a {
    color: black;
}

.panel-default>.panel-heading {
    background-color: #FF8C00;
    color: black;
}

.panel-default>.panel-body {

}

.panel-collapse>.panel-body>.nav-pills>li>a {
    background-color: #FFD700;
}

#btn0 {
    margin-top: 10px;
    margin-right: 100px;
    box-shadow: 3px 5px 0px 0px #97c4fe;
    border-radius: 30px;
    cursor: pointer;
    font-size: 20px;
    padding: 15px 25px;
}

#btn03 {
    margin-top: 10px;
    margin-right: 100px;
    box-shadow: 3px 5px 0px 0px #97c4fe;
    border-radius: 30px;
    cursor: pointer;
    font-size: 20px;
    padding: 15px 16px;
}

#btn05 {
    margin-top: 10px;
    margin-right: 100px;
    box-shadow: 3px 5px 0px 0px #97c4fe;
    border-radius: 30px;
    cursor: pointer;
    font-size: 20px;
    padding: 15px 16px;
}

#btn08 {
    margin-top: 10px;
    margin-right: 100px;
    box-shadow: 3px 5px 0px 0px #97c4fe;
    border-radius: 30px;
    cursor: pointer;
    font-size: 20px;
    padding: 15px 16px;
}

#btn1 {
    margin-top: 10px;
    margin-right: 100px;
    box-shadow: 3px 5px 0px 0px #97c4fe;
    border-radius: 30px;
    cursor: pointer;
    font-size: 20px;
    padding: 15px 25px;
}

.nav-pills>li {
    border-radius: 5px;
    background-color: #BDBDBD;
}

.nav-pills>li>a {
    color: black;
}

.panel-heading {
    cursor: pointer;
}

a {
    cursor: pointer;
}

.badge {
    background-color: #585858;
}

#notificationModulator_li {
    position: relative;
}

#notificationContainerModulator {
    background-color: #fff;
    border: 1px solid rgba(100, 100, 100, .4);
    -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
    overflow: visible;
    position: absolute;
    top: 30px;
    margin-left: -170px;
    width: 400px;
    display: none;
}

#notificationContainerModulator:before {
    content: '';
    display: block;
    position: absolute;
    width: 0;
    height: 0;
    color: transparent;
    border: 10px solid black;
    border-color: transparent transparent white;
    margin-top: -20px;
    margin-left: 188px;
}

#notificationTitleModulator {
    font-weight: bold;
    padding: 8px;
    font-size: 13px;
    background-color: #ffffff;
    position: absolute;
    z-index: 1000;
    width: 384px;
    border-bottom: 1px solid #dddddd;
}

#notificationsBodyModulator {
    padding: 33px 0px 0px 0px !important;
    min-height: 300px;
}

#notificationFooterModulator {
    background-color: #e9eaed;
    text-align: center;
    font-weight: bold;
    padding: 8px;
    font-size: 12px;
    border-top: 1px solid #dddddd;
}

#notification_li {
    position: relative;
}

#notificationContainer {
    background-color: #fff;
    border: 1px solid rgba(100, 100, 100, .4);
    -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
    overflow: visible;
    position: absolute;
    top: 30px;
    margin-left: -170px;
    width: 400px;
    display: none;
}

#notificationContainer:before {
    content: '';
    display: block;
    position: absolute;
    width: 0;
    height: 0;
    color: transparent;
    border: 10px solid black;
    border-color: transparent transparent white;
    margin-top: -20px;
    margin-left: 188px;
}

#notificationTitle {
    font-weight: bold;
    padding: 8px;
    font-size: 13px;
    background-color: #ffffff;
    position: absolute;
    z-index: 1000;
    width: 384px;
    border-bottom: 1px solid #dddddd;
}

#notificationsBody {
    padding: 33px 0px 0px 0px !important;
    min-height: 300px;
}

#notificationFooter {
    background-color: #e9eaed;
    text-align: center;
    font-weight: bold;
    padding: 8px;
    font-size: 12px;
    border-top: 1px solid #dddddd;
}

#notification_count {
    padding: 3px 7px 3px 7px;
    background: #cc0000;
    color: #ffffff;
    font-weight: bold;
    margin-left: 77px;
    border-radius: 9px;
    -moz-border-radius: 9px;
    -webkit-border-radius: 9px;
    position: absolute;
    margin-top: -11px;
    font-size: 11px;
}

.test {
    border-bottom: 1px solid #ccc;
}
.modal{
    top:300px;
}
a#menuPresenting:hover,a#menuTopicList:hover,a#menuleftbtnCompleteExamination:hover{
    background-color: #d0dcdb;
    width: 200px;
    -webkit-transition: width 1s; /* For Safari 3.1 to 6.0 */
    transition: width 1s;
}

</style>
</head>

<body>
<div id="nameOfRequestToJoinRoom0" class="test"></div>
<button id="btnAccept" type="button" class="btn btn-default">Accept</button>
<button id="btnDecline" type="button" class="btn btn-default">Decline</button>
<!-- <button id="buttonCreate" type="button" class="btn btn-primary">Create
    Panel</button>
<button id="buttonDelete" type="button" class="btn btn-primary">Delete
    Panel</button> -->

<!-- 			<button id="btnCompleteExamination" type="button"
			class="btn btn-default" value="">Complete</button> -->
<div class="ui list">
    <div class="item">
        <img class="ui top aligned avatar image" src="${contextPath}/resources/images/user.png">
        <div class="content">
            <div class="header"><input type="hidden" id="roomId" value="${idRoom}" /><input
                    type="hidden" id="modulatorId" value="${idModulator}" /><input
                    type="hidden" id="yourPosition" value="${yourPosition}" />
                <a><label  id="examinerId" value="${idExaminer}">Examiner</div></label></a>
            <b><span style="font-size:12pt">${nameExaminer} ${lastNameExaminer}</span></b>
            <div class="list">
                <div class="item">
                    <i class="top aligned right triangle icon"></i>
                    <div class="content">
                        <a class="header"><label id="committeeId"
                                                 value="${idCommittee}">Committee</label></a>
                        <div class="description">${nameCommittee}
                            ${lastNameCommittee}</div>
                    </div>
                </div>
                <div class="item">
                    <i class="top aligned right triangle icon"></i>
                    <div class="content">
                        <a class="header"><label id="courseId"
                                                 value="${idCourse}">Course</label></a>
                        <div class="description">${nameCourse}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="formBoard">
				<span id="submitOfAllTOpic" class="badge pull-right">Total <label
                        id="submitTopic" style="margin: 2px;"></label> / <label
                        id="totalTopic" style="margin: 2px;"></label></span> <br> <br>
    <div class="panel-group" id="accordion"></div>
</div>

<div id="panelRealTime" class="panel panel-default">
    <div class="panel-heading">
        <label id="subject">${subject}</label> : <label id="title">${title}</label>
    </div>
    <div class="panel-body">
        <label id="detail">${detail}</label>
        <textarea id="message" class="form-control" rows="3"
                  placeholder="comment here"></textarea>

        <div id="panelButtonScore" class="btn-group">
            <button id="btn0" type="button" class="btn btn-default" value="0">0</button>
            <button id="btn03" type="button" class="btn btn-default"
                    value="0.3">0.3</button>
            <button id="btn05" type="button" class="btn btn-default"
                    value="0.5">0.5</button>
            <button id="btn08" type="button" class="btn btn-default"
                    value="0.8">0.8</button>
            <button id="btn1" type="button" class="btn btn-default" value="1">1</button>
        </div>

        <button id="buttonSubmit" type="button" class="btn btn-default"
                style="margin: 20px; background-color: #FF8C00; color: #FFFFFF;">Submit</button>
    </div>
</div>

<!----------------------Model Collapse---------------------->
<div id="panelCollapse0" class="panel panel-default"></div>
<div id="panelHeading0" class="panel-heading" data-toggle="collapse"
     data-parent="#accordion" href="#collapse0" data-target="#collapse0">
</div>
<h4 id="panelTitle0" class="panel-title"></h4>
			<span id="spanTopic0" class="badge pull-right"
                  style="background-color: #585858;"></span> <label
        id="submitEachTopic0" style="margin: 2px;"></label> <label
        id="totalEachTopic0" style="margin: 2px;"></label>
<div id="collapse0" class="panel-collapse collapse"></div>
<div id="panelBody0" class="panel-body"></div>
<ul id="navpills0" class="nav nav-pills nav-stacked">
</ul>
<li id="listNavpills0" onClick="javascript:showModal(this);"></li> <a
        id="linkToScore0" ></a> <span id="spanScore0"
                                      class="badge pull-right"></span>
<!----------------------Model Collapse---------------------->

<!----------------------Model Panel in Modal---------------------->
<div id="panelScore0" class="panel panel-default"></div>
<div id="panelScoreHead0" class="panel-heading"></div>
<label id="panelScoreSubject0" class="textSubject"></label>
<button id="panelScoreBtnClose" type="button" class="close"
        data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove"></i> </button>
<div id="panelScoreBody0" class="panel-body"></div>
<span id="dummyKeepIdTopic0" class="textId"></span> <label
        id="panelScoreDescription0" class="textDescription"></label>
<textarea id="panelScoreMessage0" class="form-control" rows="3"
          placeholder="comment here"></textarea>
<div id="panelScoreBtnGroup0" class="btn-group">
    <button id="btnZero0" type="button" class="btn btn-default" value="0"
            onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
            style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">0</button>
    <button id="btnThree0" type="button" class="btn btn-default"
            value="0.3"
            onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
            style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.3</button>
    <button id="btnFive0" type="button" class="btn btn-default"
            value="0.5"
            onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
            style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.5</button>
    <button id="btnEight0" type="button" class="btn btn-default"
            value="0.8"
            onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
            style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 16px;">0.8</button>
    <button id="btnOne0" type="button" class="btn btn-default" value="1"
            onClick="javascript:setScore(this.id,$(this).parent().attr('id'))"
            style="margin-top: 10px; margin-right: 20px; box-shadow: 3px 5px 0px 0px #97c4fe; border-radius: 30px; cursor: pointer; font-size: 20px; padding: 15px 25px;">1</button>
</div>
<button id="panelScoreBtnSubmit0" type="button"
        class="btn btn-default"
        onClick="javascript:sendDetailScoreOfTopic(this,$(this).parent().attr('id'));"
        style="margin: 20px; background-color: #FF8C00; color: #FFFFFF;">Submit</button>
<!----------------------Model Panel in Modal---------------------->

<!----------------------Model Modal---------------------->
<div class="modal"  title="genModal" id="modalScore0" tabindex="-1"
     aria-labelledby="myModalLabel" role="dialog"  aria-hidden="true" ></div>
<div id="modalScoreDialog0" class="modal-dialog"></div>
<!----------------------Model Modal---------------------->
<div id="loader" align="center">
    <img src="resources/images/ajax-loader.gif" alt="" width="10%"
         height="10%"/>
</div>
<div id="alertChooseScore" class="alert alert-warning" role="alert"
     style="margin-top: 20px;">
    <strong>Warning! </strong>Please choose Score.
</div>
<input type="hidden" id="score" value="" />
</div>
<script type="text/javascript"
        src="${contextPath}/resources/stomp.js"></script>
<script type="text/javascript"
        src="${contextPath}/resources/sockjs-0.3.4.js"></script>

<script>
var elementModalPresentingNow=null;
var stompClient = null;

$(function(){
    ////////////////////////////////Web Socket Add Access Funtion After Subscribe///////////////////////
    setConnect();
    function setConnect(){
        var socket = new SockJS('/EvaluateTool/webSocket/requestandapprove');
        stompClient = Stomp.over(socket);
        stompClient.heartbeat.outgoing = 20000;
        stompClient.heartbeat.incoming = 20000;
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/examinationroomandevaluateboard/requestandapprove', function(data){
                data.ack();
                accessMethod(JSON.parse(data.body));
            },{ack: 'client'});
        });
        socket.onclose = function() {
            console.log('close');
            stompClient.disconnect();
            setConnect();
            console.log("socket fail");
        };
    }

    ////////////////////////////////Access Funtion After Subscribe///////////////////////
    function accessMethod(data){
        var namefunction=JSON.parse(data).function;
        if(namefunction=="notificationRequestCommittee"){
            notificationRequestCommittee(data);
        }else if(namefunction=="removeNotificationRequestCommittee"){
            removeNotificationRequestCommittee(data);
        }else if(JSON.parse(data).function=="notificationRequestUpdate"){
            notificationRequestUpdate(data);
        }else if(namefunction=="updateBadgeNotification"){
            updateBadgeNotification(data);
        }else if(namefunction=="updateMenuApproveAfterSubmit"){
            updateMenuApproveAfterSubmit(data);
        }else if(namefunction=="approveSubmitModulator"){
            approveSubmitModulator(data);
        }else if(namefunction=="updateMenuApproveModulatorAfterSubmitCommittee"){
            updateMenuApproveModulatorAfterSubmitCommittee(data);
        }else if(namefunction=="notificationRequestExaminer"){
            notificationRequestExaminer(data);
        }else if(namefunction=="presentingShow"){
            presentingShowModal(data);
        }
    }
    function presentingShowModal(data){
        var topic = JSON.parse(data).topic;
        if(JSON.parse(data).roomId=='${idRoom}'&&JSON.parse(data).yourIdExaminer=='${idExaminer}'){
            elementModalPresentingNow=$("li[title='" + topic + "']")[0];
        }
        if(($("#menuPresenting").hasClass("red teal item active")||$("#menuPresenting").hasClass("red active teal item"))&&JSON.parse(data).roomId=='${idRoom}'&&JSON
                .parse(data).yourIdExaminer=='${idExaminer}'){
            $("div[class='modal ui transition visible active']").each(function(){
                $(this).removeClass("modal ui transition visible active").addClass("modal ui transition visible hidden");
            });
            var element = $("li[title='" + topic + "']")[0];
            showModal(element);
        }
    }

    function updateMenuApproveModulatorAfterSubmitCommittee(data){
        $("div[id=contentlistapprove]").each( function() {
            $(this).remove();
        });
        if('${idCommittee}'=='${idModulator}'&&JSON.parse(data).roomId=='${idRoom}'){
            var idRoomInRoom=JSON.parse('${idRoom}');
            var data={};
            data.roomId=JSON.parse('${idRoom}');
            var roomId=JSON.stringify(data);
            $.ajax({
                url:"/EvaluateTool/application/getallPersonToApprove",
                type:"POST",
                data:{
                    roomId:roomId
                },
                success:function(data){
                    $.each(JSON.parse(data),function(index,item){
                        item.forEach(function(person){
                            var yourId=person.id;
                            var name=person.name;
                            var lastName=person.lastname;
                            if(yourId!='${idCommittee}'){
                                $("#listrequestapprove").append('<div id="contentlistapprove" class="ui feed">'+'<div class="event"><div class="label">'+'<img id="imguserrequestapprove" src="${contextPath}/resources/images/user.png" width="32px" height="30px"/>'+'</div><div class="content"><div class="date">'+'<div onclick=\'(approve("'+yourId+'","'+idRoomInRoom+'","'+name+'","'+lastName+'"))\' class="ui teal tiny button">มอบสิทธิ</div>'+'</div><div class="summary">'+'<a><p id="fullnamerequestapprove">'+name+' '+lastName+'</p></a>'+'<span id="titlereqeustapprove">เข้าเป็นผู้ดูแลห้อง</span></div></div></div></div>');
                            }
                        });
                    });
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
    }
    function approveSubmitModulator(data){
        if(JSON.parse(data).yourId=='${idCommittee}'&&JSON.parse(data).roomId=='${idRoom}'){
            swal({
                type:"success",
                title: JSON.parse(data).roomDescription+":"+JSON.parse(data).roomName,
                text:JSON.parse(data).data
            }, function(isConfirm) {
                if (isConfirm) {

                }
            });
            var idRoom = '${idRoom}';
            var idCourse = '${idCourse}';
            var idExaminer = '${idExaminer}';
            var nameExaminer = '${nameExaminer}';
            var lastNameExaminer = '${lastNameExaminer}';
            var idCommittee = '${idCommittee}';
            var nameCommittee = '${nameCommittee}';
            var lastNameCommittee = '${lastNameCommittee}';
            var idModulator = JSON.parse(data).yourId;
            var yourPosition = '${yourPosition}';
            var roomName='${roomName}';
            var roomDescription='${roomDescription}';
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
        }
    }
    function notificationRequestUpdate(data){
        if('${idModulator}'=='${idCommittee}'&&'${idRoom}'==JSON.parse(data).roomId){
            $("div[title="+JSON.parse(data).yourId+"][value=committee]").fadeOut("slow",function() {
                $("div[title="+JSON.parse(data).yourId+"][value=committee]").remove();
            });
        }

    }
    function removeNotificationRequestCommittee(data){
        var yourIdRemove=JSON.parse(data).yourId;
        if('${idModulator}'=='${idCommittee}'&&'${idRoom}'==JSON.parse(data).roomId) {
            $("div[title=" + yourIdRemove + "][value=committee]").fadeOut("slow", function () {
                $("div[title=" + yourIdRemove + "]").remove();
            });
            $("input[value=" + JSON.parse(data).participantId + "]").remove();
            var countbadgenotificationsubmitandcalcel = $("#badgenotificationsubmitandcalcel").text();
            if (countbadgenotificationsubmitandcalcel == 1) {
                $("#badgenotificationsubmitandcalcel").html("");
            } else if (countbadgenotificationsubmitandcalcel > 1) {
                $("#badgenotificationsubmitandcalcel").html(--countbadgenotificationsubmitandcalcel);
            }
        }
    }
    function updateBadgeNotification(data){
        if(JSON.parse(data).roomId=='${idRoom}'&&JSON.parse(data).modulatorId=='${idModulator}'&&'${idModulator}'=='${idCommittee}'){
            $("#badgenotificationsubmitandcalcel").html("");
            $("input[id=paticipantId]").each(function(){
                $(this).remove();
            });
        }
    }
    function updateMenuApproveAfterSubmit(data){
        if('${idModulator}'=='${idCommittee}'&&JSON.parse(data).roomId=='${idRoom}'){
            var idRoom = '${idRoom}';
            var idCourse = '${idCourse}';
            var idExaminer = '${idExaminer}';
            var nameExaminer = '${nameExaminer}';
            var lastNameExaminer = '${lastNameExaminer}';
            var idCommittee = '${idCommittee}';
            var nameCommittee = '${nameCommittee}';
            var lastNameCommittee = '${lastNameCommittee}';
            var idModulator = JSON.parse(data).yourId;
            var yourPosition = '${yourPosition}';
            var roomName='${roomName}';
            var roomDescription='${roomDescription}';
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
            /*  $("#headdropdownapprovepermission").hide();
             $("#headdropdownsubmitandcancel").hide();
             $("#btnCompleteExamination").hide();*/
        }

    }

    ////////////////////////////////List Person With Request Committee In Room///////////////////////
    var committiIdInRoom='${idCommittee}';
    var modulatorIdInRoom='${idModulator}';
    if(committiIdInRoom==modulatorIdInRoom){
        var data={};
        data.roomId='${idRoom}';
        var roomId = JSON.stringify(data);
        $.ajax({
            url:"/EvaluateTool/application/personWithRequestCommittee",
            type:"POST",
            data:{
                roomId:roomId
            },
            success:function(data){
                console.log(data);
                var countWait=JSON.parse(data).countWait;
                for(var i in JSON.parse(data).allUserWithRequestCommittee){
                    var yourIdRequest=JSON.parse(data).allUserWithRequestCommittee[i].yourId;
                    var countbadgenotificationsubmitandcalcel=$("#badgenotificationsubmitandcalcel").text();
                    var namerequest=JSON.parse(data).allUserWithRequestCommittee[i].name;
                    var lastnamerequest=JSON.parse(data).allUserWithRequestCommittee[i].lastname;
                    var title="เข้าเป็นผู้ประเมิน";
                    var roomidrequest=JSON.parse(data).allUserWithRequestCommittee[i].roomId;
                    var modualtorInRoom='${idModulator}';
                    var idRoomInRoom='${idRoom}';
                    var roomDescription='${roomDescription}';
                    var roomName='${roomName}';
                    var rolerequest=JSON.parse(data).allUserWithRequestCommittee[i].role;
                    var countlistrequestsubmitandcancel=$("#listrequestsubmitandcancel").val();
                    if(countlistrequestsubmitandcancel==""||countlistrequestsubmitandcancel>=0){
                        $("#listrequestsubmitandcancel").val(++countlistrequestsubmitandcancel);
                        $("#listrequestsubmitandcancel").append('<div id="contentlistsubmitandcancel" title="'+yourIdRequest+'" value="committee" class="ui feed">'+'<div class="event">'+'<div class="label">'+
                                '<img id="imguserrequestapprove" src="${contextPath}/resources/images/user.png" width="32px" height="30px"/>'+
                                '</div>'+'<div class="content">'+'<div class="date">'+'<a onclick=\'(approveNotificationRequestCommittee("committee","'+yourIdRequest+'","'+roomidrequest+'","'+roomDescription+'","'+roomName+'"))\'><div class="ui tiny buttons">'+'<div class="ui green button">อนุญาต</div></a>'+
                                '<div class="or"></div>'+'<a onclick=\'(notApproveNotificationRequestCommittee("committee","'+yourIdRequest+'","'+roomidrequest+'","'+roomDescription+'","'+roomName+'"))\'><div class="ui red button">ปฎิเสธ</div></a>'+'</div>'+'</div>'+'<div class="summary">'+
                                '<a><p id="fullnamerequestapprove">'+namerequest+' '+lastnamerequest+'</p></a>'+
                                '<span id="titlereqeustapprove">'+title+'</span>'+'</div>'+'</div>'+'</div>'+'</div>');
                    }
                    $("div[id=contentlistsubmitandcancel]").each(function(index,element){
                        if(index<3){
                            $(element).show();
                        }else{
                            $(element).hide();
                        }

                    });
                    if(rolerequest=="wait"){
                        $("body").append("<input type='hidden' id='paticipantId' value='"+JSON.parse(data).allUserWithRequestCommittee[i].paticipantId+"'/>")
                        if(countbadgenotificationsubmitandcalcel==""){
                            $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
                        }else{
                            $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
                        }
                    }
                }
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

    ////////////////////////////////Alert Notification with Request Committee///////////////////////
    function notificationRequestCommittee(data){
        console.log(data);
        var countbadgenotificationsubmitandcalcel=$("#badgenotificationsubmitandcalcel").text();
        var namerequest=JSON.parse(data).name;
        var lastnamerequest=JSON.parse(data).lastname;
        var youridrequest=JSON.parse(data).yourId;
        var title=JSON.parse(data).title;
        var modulator=JSON.parse(data).modualtor;
        var roomidrequest=JSON.parse(data).roomId;
        var rolerequest=JSON.parse(data).role;
        var modulatorId=JSON.parse(data).modulatorId;
        var modualtorInRoom='${idModulator}';
        var idRoomInRoom='${idRoom}';
        var roomDescription=JSON.parse(data).roomDescription;
        var roomName=JSON.parse(data).roomName;
        if('${idCommittee}'==modualtorInRoom&&roomidrequest==idRoomInRoom){
            alertify.log("<center><button class='ui orange tiny button'>Approve Notification</br>"+namerequest+" "+lastnamerequest+"</button></center>");
            var countlistrequestsubmitandcancel=$("#listrequestsubmitandcancel").val();
            if(countlistrequestsubmitandcancel==""||countlistrequestsubmitandcancel>=0){
                $("#listrequestsubmitandcancel").val(++countlistrequestsubmitandcancel);
                $("#listrequestsubmitandcancel").append('<div id="contentlistsubmitandcancel" title="'+youridrequest+'" value="committee" class="ui feed">'+'<div class="event">'+'<div class="label">'+
                        '<img id="imguserrequestapprove" src="${contextPath}/resources/images/user.png" width="32px" height="30px"/>'+
                        '</div>'+'<div class="content">'+'<div class="date">'+'<a onclick=\'(approveNotificationRequestCommittee("committee","'+youridrequest+'","'+roomidrequest+'","'+roomDescription+'","'+roomName+'"))\'><div class="ui tiny buttons">'+'<div class="ui green button">อนุญาต</div></a>'+
                        '<div class="or"></div>'+'<a onclick=\'(notApproveNotificationRequestCommittee("committee","'+youridrequest+'","'+roomidrequest+'","'+roomDescription+'","'+roomName+'"))\'><div class="ui red button">ปฎิเสธ</div></a>'+'</div>'+'</div>'+'<div class="summary">'+
                        '<a><p id="fullnamerequestapprove">'+namerequest+' '+lastnamerequest+'</p></a>'+
                        '<span id="titlereqeustapprove">'+title+'</span>'+'</div>'+'</div>'+'</div>'+'</div>');
            }
            $("div[id=contentlistsubmitandcancel]").each(function(index,element){
                if(index<3){
                    $(element).show();
                }else{
                    $(element).hide();
                }

            });
            if(countbadgenotificationsubmitandcalcel==""){
                $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
            }else{
                $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
            }
        }
    }

    ////////////////////////////////Alert Notification with Request Examiner///////////////////////
    function notificationRequestExaminer(data) {
        var countbadgenotificationsubmitandcalcel = $("#badgenotificationsubmitandcalcel").text();
        var namerequest = JSON.parse(data).name;
        var lastnamerequest = JSON.parse(data).lastname;
        var youridrequest = JSON.parse(data).yourId;
        var title = JSON.parse(data).title;
        var modulator = JSON.parse(data).modualtor;
        var roomidrequest = JSON.parse(data).roomId;
        var rolerequest = JSON.parse(data).role;
        var modulatorId = JSON.parse(data).modulatorId;
        var modulatorInRoom = '${idModulator}';
        var idRoomInRoom = '${idRoom}';
        var roomDescription = JSON.parse(data).roomDescription;
        var roomName = JSON.parse(data).roomName;
        if ('${idCommittee}' == modulatorInRoom && roomidrequest == idRoomInRoom) {
            alertify.log("<center><button class='ui orange tiny button'>Approve Notification</br>" + namerequest + " " + lastnamerequest + "</button></center>");
            var countlistrequestsubmitandcancel = $("#listrequestsubmitandcancel").val();
            if (countlistrequestsubmitandcancel == "" || countlistrequestsubmitandcancel >= 0) {
                $("#listrequestsubmitandcancel").val(++countlistrequestsubmitandcancel);
                $("#listrequestsubmitandcancel").append('<div id="contentlistsubmitandcancel" title="' + youridrequest + '" value="examiner" class="ui feed">' + '<div class="event">' + '<div class="label">' +
                        '<img id="imguserrequestapprove" src="${contextPath}/resources/images/user.png" width="32px" height="30px"/>' +
                        '</div>' + '<div class="content">' + '<div class="date">' + '<a onclick=\'(approveNotificationRequestExaminer("examiner","' + youridrequest + '","' + roomidrequest + '","' + roomDescription + '","' + roomName + '"))\'><div class="ui tiny buttons">' + '<div class="ui green button">อนุญาต</div></a>' +
                        '<div class="or"></div>' + '<a onclick=\'(notApproveNotificationRequestExaminer("examiner","' + youridrequest + '","' + roomidrequest + '","' + roomDescription + '","' + roomName + '"))\'><div class="ui red button">ปฎิเสธ</div></a>' + '</div>' + '</div>' + '<div class="summary">' +
                        '<a><p id="fullnamerequestapprove">' + namerequest + ' ' + lastnamerequest + '</p></a>' +
                        '<span id="titlereqeustapprove">' + title + '</span>' + '</div>' + '</div>' + '</div>' + '</div>');
            }
            $("div[id=contentlistsubmitandcancel]").each(function (index, element) {
                if (index < 3) {
                    $(element).show();
                } else {
                    $(element).hide();
                }

            });
            if (countbadgenotificationsubmitandcalcel == "") {
                $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
            } else {
                $("#badgenotificationsubmitandcalcel").html(++countbadgenotificationsubmitandcalcel);
            }
        }
    }
});


////////////////////////////////On Click Menu Presenting///////////////////////
function presentingShow(){
    $("#formBoard").hide();
    $("#menuTopicList").removeClass("teal item active").addClass("teal item");
    $("#menuPresenting").removeClass("teal item").addClass("teal item active");
    if(elementModalPresentingNow != null){
        showModal(elementModalPresentingNow);
    }
}

////////////////////////////////On Click Menu Topic List///////////////////////
function topicListShow(){
    $("#formBoard").show();
    $("#menuTopicList").removeClass("teal item").addClass("teal item  active");
    $("#menuPresenting").removeClass("teal item active").addClass("teal item");
}

////////////////////////////////Set Standard Content And Menu After Open Page///////////////////////
$("#menuleftplus").hide();
$("#menuleftbtnCompleteExamination").hide();
$("#showbtnCompleteExamination").hide();
$("#btnCompleteExamination").hide();
var yourPosition='${yourPosition}';
var fullname = '${nameCommittee}'+'  '+'${lastNameCommittee}';
$("#fullname").html(fullname);
var checkModulatorId = $("#modulatorId").val();
var checkCommitteeId = $("#committeeId").attr('value');
if(checkModulatorId==checkCommitteeId){
    $("#menuleftbtnCompleteExamination").show();
    $("#showbtnCompleteExamination").show();
    $("#btnCompleteExamination").show();
    $("#headdropdownapprovepermission").show();
    $("#headdropdownsubmitandcancel").show();
    $("#menuleft").show();
    $("#imgmenuleft").mouseover(function(){
        $("#extendimgmenuleft").slideToggle(300);
    });
    $("#imgmenuleft").mouseout(function(){
        $("#extendimgmenuleft").slideToggle(300);
    });
    $("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    $("#confighistory").show();
    $("#configmanager").show();
}else{
    $("#headdropdownapprovepermission").hide();
    $("#headdropdownsubmitandcancel").hide();
    $("#menuleft").slideToggle(800);
    $("#imgmenuleft").mouseover(function(){
        $("#extendimgmenuleft").slideToggle(300);
    });
    $("#imgmenuleft").mouseout(function(){
        $("#extendimgmenuleft").slideToggle(300);
    });
    $("#confighome").show();
    $("#configroom").show();
    $("#confighistory").show();
    $("#configmanager").show();
    $("#configreport").show();
}

$("#showlistallapprove").mouseover(function(){
    $("div[id=contentlistapprove]").each(function(index,element){
        $(element).slideDown(1000);
    });
});
$("#showlistallsbmitandcancel").mouseover(function(){
    $("div[id=contentlistsubmitandcancel]").each(function(index,element){
        $(element).slideDown(1000);
    });
});

////////////////////////////////List Person with Role is Committee in Room///////////////////////
var idRoomInRoom=JSON.parse('${idRoom}');
var data={};
data.roomId=JSON.parse('${idRoom}');
var roomId=JSON.stringify(data);
$.ajax({
    url:"/EvaluateTool/application/getallPersonToApprove",
    type:"POST",
    data:{
        roomId:roomId
    },
    success:function(data){
        $.each(JSON.parse(data),function(index,item){
            item.forEach(function(person){
                var yourId=person.id;
                var name=person.name;
                var lastName=person.lastname;
                if(yourId!='${idCommittee}'){
                    $("#listrequestapprove").append('<div id="contentlistapprove" class="ui feed">'+'<div class="event"><div class="label">'+'<img id="imguserrequestapprove" src="${contextPath}/resources/images/user.png" width="32px" height="30px"/>'+'</div><div class="content"><div class="date">'+'<div onclick=\'(approve("'+yourId+'","'+idRoomInRoom+'","'+name+'","'+lastName+'"))\' class="ui teal tiny button">มอบสิทธิ</div>'+'</div><div class="summary">'+'<a><p id="fullnamerequestapprove">'+name+' '+lastName+'</p></a>'+'<span id="titlereqeustapprove">เข้าเป็นผู้ดูแลห้อง</span></div></div></div></div>');
                }
            });
        });

    },error:function() {
        swal({   title: "เกิดข้อผิดพลาดบางอย่าง กรุณาลองอีกครั้ง",
            type: "error",
            confirmButtonColor: "#8ACBE5",
            confirmButtonText: "OK",
            closeOnConfirm: true
        }, function (isConfirm) {
            if (isConfirm) {
                //location.reload();
            }
        });
    }
});

$("div[id=contentlistapprove]").each(function(index,element){
    if(index<3){
        $(element).show();
    }else{
        $(element).hide();
    }
});

////////////////////////////////On Click Approve Person is Modulator In Room///////////////////////
function approve(id,roomid,name,lastname){
    var data={};
    data.roomIdApprove=roomid;
    data.yourIdApprove=id;
    data.yourIdInRoom='${idModulator}';
    var dataApprove=JSON.stringify(data);
    var roomName='${roomName}';
    var roomDescription='${roomDescription}';
    swal({   title: "Are you sure?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, approve it!",
        cancelButtonText: "No, cancel pls!",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function(isConfirm){
        if (isConfirm) {
            swal({
                type:"success",
                title: "Approve Success....",
            }, function(isConfirm){
                $.ajax({
                    url:"/EvaluateTool/application/addModulatorAndUpdateCommittee",
                    data:{
                        dataApprove:dataApprove
                    },
                    type:"POST",
                    success:function(){
                        //location.reload();
                        stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'approveSubmitModulator','data': 'คุณได้รับสิทธิเป็น Modulator','roomId':roomid,'yourId':id,'roomName':roomName,'roomDescription':roomDescription,'name':name,'lastname':lastname}));
                        stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'updateMenuApproveAfterSubmit','roomId':roomid,'yourId':id}));
                    }
                });
            });

        } else {
            swal({
                type:"error",
                title: "Cancelled",
                text:"Click OK for Cancel",
                closeOnConfirm:false,
                confirmButtonText:"OK"
            });
        }
    });
}

////////////////////////////////On Click Approve Person with Request Committee///////////////////////
function approveNotificationRequestCommittee(type,yourid,roomid,roomDescription,roomName){
    var data={};
    data.yourId=yourid;
    data.roomId=roomid;
    data.role="committee";
    var paticipantId=JSON.stringify(data);
    $.ajax({
        url:"/EvaluateTool/application/setRoleInPaticipants",
        type:"POST",
        data:{
            paticipantId:paticipantId,
        },
        success:function(){
            $("div[title=" + yourid + "][value=committee]").fadeOut("slow",function(){
                $("div[title=" + yourid + "][value=committee]").remove();
                stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'approveSubmitCommittee','data': 'Modulator ได้ยอมรับให้คุณเป็น Committee แล้ว','yourId':yourid,'roomId':roomid,'examinerId':'${idExaminer}','modulatorId':'${idModulator}','roomDescription':roomDescription,'roomName':roomName}));
                stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'notificationRequestUpdate','type':type,'yourId':yourid,'roomId':roomid}));
            });
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

////////////////////////////////On Click Not Approve Person with Request Committee///////////////////////
function notApproveNotificationRequestCommittee(type,yourid,roomid,roomDescription,roomName){
    var data={};
    data.yourId=yourid;
    data.roomId=roomid;
    var dataPersonId=JSON.stringify(data);
    $.ajax({
        url:"/EvaluateTool/application/removeRequestCommittee",
        type:"POST",
        data:{
            dataPersonId:dataPersonId,
        },
        success:function(){
            $("div[title=" + yourid + "][value=committee]").fadeOut("slow",function(){
                $("div[title=" + yourid + "][value=committee]").remove();
            });
            stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'removeProcess','data': 'Modulator ได้ปฏิเสธ การร้องขอเป็น Comittee','yourId':yourid,'roomId':roomid,'roomDescription':roomDescription,'roomName':roomName}));
            stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'notificationRequestUpdate','type':type,'yourId':yourid,'roomId':roomid}));
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

////////////////////////////////On Click Approve Person with Request Examiner///////////////////////
function approveNotificationRequestExaminer(type,yourid,roomid,roomDescription,roomName){
    var data={};
    data.yourId=yourid;
    data.roomId=roomid;
    data.role="committee";
    var paticipantId=JSON.stringify(data);
    /*       $.ajax({
     url:"/EvaluateTool/application/setRoleInPaticipants",
     type:"POST",
     data:{
     paticipantId:paticipantId,
     },
     success:function(){*/
    $("div[value="+index+"]").fadeOut("slow",function(){
        $("div[value="+index+"]").remove();
        stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'approveSubmitExaminer','data': 'Modulator ได้ยอมรับให้คุณเป็น Examiner แล้ว','yourId':yourid,'roomId':roomid,'examinerId':'${idExaminer}','modulatorId':'${idModulator}','roomDescription':roomDescription,'roomName':roomName}));
        stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'notificationRequestUpdate','type':type,'yourId':yourid,'roomId':roomid}));
    });
    /*          },error:function() {
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
     });*/
}

////////////////////////////////On Click Not Approve Person with Request Examiner///////////////////////
function notApproveNotificationRequestExaminer(type,yourid,roomid,roomDescription,roomName){
    var data={};
    data.yourId=yourid;
    data.roomId=roomid;
    var dataPersonId=JSON.stringify(data);
    /*$.ajax({
     url:"/EvaluateTool/application/removeRequestCommittee",
     type:"POST",
     data:{
     dataPersonId:dataPersonId,
     },
     success:function(){*/
    $("div[value="+index+"]").fadeOut("slow",function(){
        $("div[value="+index+"]").remove();
    });
    stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'removeProcess','data': 'Modulator ได้ปฏิเสธการร้องขอเป็น Examiner','yourId':yourid,'roomId':roomid,'roomDescription':roomDescription,'roomName':roomName}));
    stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'notificationRequestUpdate','type':type,'yourId':yourid,'roomId':roomid}));
    /*   },error:function() {
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
     });*/
}

$("#anotificationapprove,#imgnotificationapprove,#badgenotificationapprove").click(function(){
    $("#badgenotificationapprove").html("");
    $("#dropdownsubmitandcancel").hide();
    $("#dropdownconfig").hide();
});
$("#imgnotificationsubmitandcalcel,#badgenotificationsubmitandcalcel").click(function(){
    $("#badgenotificationsubmitandcalcel").html("");
    $("#dropdownsubmitandcancel").slideToggle(400);
    $("#dropdownconfig").hide();
    var roomId='${idRoom}';
    var modulatorId='${idModulator}';
    var data=[];
    $("input[id=paticipantId]").each(function(){
        data.push($(this).val());
    });
    var paticipantId=JSON.stringify({"paticipantId":data,"role":"wait"});
    if(paticipantId!='{"paticipantId":[]}'){
        $.ajax({
            url:"/EvaluateTool/application/setRoleInPaticipants",
            type:"POST",
            data:{
                paticipantId:paticipantId
            },
            success:function(){
                stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head':'updateBadgeNotification','roomId':roomId,'modulatorId':modulatorId}));
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
$("#anotificationconfig,#imgnotificationapprove,#imgnotificationconfig").click(function(){
    $("#dropdownsubmitandcancel").hide();
});

var i=0
function openmenuleft(){
    if(i==0){
        $("#menuleft").hide();
        $("#contenthead").removeClass("col-md-10 column");
        $("#contenthead").addClass("col-md-12 column");
        i++;
    }else{
        $("#menuleft").slideDown(800);
        $("#contenthead").removeClass("col-md-12 column");
        $("#contenthead").addClass("col-md-10 column");
        i--;
    }

}
/*Pipe*/
var keepId
function showModal(element) {
    keepId = $('#' + element.id).parent().attr('id');
    $("#alertChooseScore").hide();
    count = (element.id).replace(/[^\d.]/g, '');
    if ($("#spanScore" + count).text() == '-') {
        $("#panelScoreMessage" + count).val('');
        $("#btnZero" + count).removeClass('active');
        $("#btnThree" + count).removeClass('active');
        $("#btnFive" + count).removeClass('active');
        $("#btnEight" + count).removeClass('active');
        $("#btnOne" + count).removeClass('active');
        $("#panelScoreBtnSubmit" + count).removeAttr("data-dismiss");
    } else {
        var checkScore = $("#spanScore" + count).text();
        if (checkScore == "0") {
            $("#btnThree" + count).removeClass('active');
            $("#btnFive" + count).removeClass('active');
            $("#btnEight" + count).removeClass('active');
            $("#btnOne" + count).removeClass('active');
            $("#btnZero" + count).addClass('active');
        } else if (checkScore == "0.3") {
            $("#btnZero" + count).removeClass('active');
            $("#btnFive" + count).removeClass('active');
            $("#btnEight" + count).removeClass('active');
            $("#btnOne" + count).removeClass('active');
            $("#btnThree" + count).addClass('active');
        } else if (checkScore == "0.5") {
            $("#btnZero" + count).removeClass('active');
            $("#btnThree" + count).removeClass('active');
            $("#btnEight" + count).removeClass('active');
            $("#btnOne" + count).removeClass('active');
            $("#btnFive" + count).addClass('active');
        } else if (checkScore == "0.8") {
            $("#btnZero" + count).removeClass('active');
            $("#btnThree" + count).removeClass('active');
            $("#btnFive" + count).removeClass('active');
            $("#btnOne" + count).removeClass('active');
            $("#btnEight" + count).addClass('active');
        } else {
            $("#btnZero" + count).removeClass('active');
            $("#btnThree" + count).removeClass('active');
            $("#btnFive" + count).removeClass('active');
            $("#btnEight" + count).removeClass('active');
            $("#btnOne" + count).addClass('active');
        }
    }
    $("#modalScore" + count).modal("show");
    var textSubject = $("#" + element.id).parent('ul').parent('div')
            .parent('div').parent('div').children('div').children('h4')
            .clone().children('span').remove().end().text();
    var textDescription = $("#" + element.id).children('a').clone()
            .children('span').remove().end().text();

    $(".textSubject").text(textSubject);
    $(".textDescription").text(textDescription);
}

function sendDetailScoreOfTopic(buttonSubmit) {
    var countOfId = (keepId).replace(/[^\d.]/g, '');
    count = (buttonSubmit.id).replace(/[^\d.]/g, '');
    var textMessage = $("textarea#panelScoreMessage" + count).val();
    var textScore = $("#panelScoreBtnGroup" + count).find(
            "button.active").prop('value');
    var textId = $("#dummyKeepIdTopic" + count).text();
    if (textScore == null) {
        $("#alertChooseScore").show().appendTo(
                $("#panelScoreBody" + count));
    } else {
        var detailScoreOfTopic = {};
        detailScoreOfTopic.roomId = $("#roomId").val();
        detailScoreOfTopic.examinerId = $("#examinerId").attr('value');
        detailScoreOfTopic.committeeId = $("#committeeId")
                .attr('value');
        detailScoreOfTopic.topicId = textId;
        detailScoreOfTopic.score = textScore;
        detailScoreOfTopic.comment = textMessage;

        var dataDetailScoreOfTopic = JSON.stringify(detailScoreOfTopic);
        $.ajax({
            url : "/EvaluateTool/application/scoring",
            type : 'POST',
            data : {
                dataDetailScoreOfTopic : dataDetailScoreOfTopic
            },
            success : function(data) {
                $("#modalScore" + count).modal("hide");
            },
            error : function(data, status, er) {
                alert("error: " + data + " status: " + status + " er:"
                        + er);
            }
        });

        if ($("#spanScore" + count).text() == '-') {
            var keepOriginalSubmitTopic = $("#submitTopic").text();
            keepOriginalSubmitTopic++;
            $("#submitTopic").text(keepOriginalSubmitTopic);
            var keepOriginalSubmitEachTopic = $(
                            "#submitEachTopic" + countOfId).text();
            keepOriginalSubmitEachTopic++;
            $("#submitEachTopic" + countOfId).text(
                    keepOriginalSubmitEachTopic);
        }
        $("#spanScore" + count).text(textScore);
        if('${idCommittee}'=='${idModulator}'){
            var totalPercentScoreInRoom=~~(($("#submitTopic").text()*100)/($("#totalTopic").text()));
            stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head': 'updatePercentCard','roomId':'${idRoom}','percent':totalPercentScoreInRoom}));
        }

    }


}

function setScore(btnScore, groupScore) {
    $("#" + groupScore + '>' + 'button').removeClass('active');
    $("#" + btnScore).addClass('active');
    $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');

}

function checkScoreFromBase(score, count) {
    var dummyBtnZero = count - 1;
    var dummyBtnThree = count - 1;
    var dummyBtnFive = count - 1;
    var dummyBtnEight = count - 1;
    var dummyBtnOne = count - 1;
    var dummyPanelScoreBtnSubmit = count - 1;
    var genIdBtnZero = $("#btnZero" + dummyBtnZero);
    var genIdBtnThree = $("#btnThree" + dummyBtnThree);
    var genIdBtnFive = $("#btnFive" + dummyBtnFive);
    var genIdBtnEight = $("#btnEight" + dummyBtnEight);
    var genIdBtnOne = $("#btnOne" + dummyBtnOne);
    var genIdPanelScoreBtnSubmit = $("#panelScoreBtnSubmit"
            + dummyPanelScoreBtnSubmit);

    $("#btnZero0").clone().attr('id', 'btnZero' + (++dummyBtnZero))
            .insertAfter(genIdBtnZero).show().appendTo(
            $("#panelScoreBtnGroup" + count));
    $("#btnThree0").clone().attr('id', 'btnThree' + (++dummyBtnThree))
            .insertAfter(genIdBtnThree).show().appendTo(
            $("#panelScoreBtnGroup" + count));
    $("#btnFive0").clone().attr('id', 'btnFive' + (++dummyBtnFive))
            .insertAfter(genIdBtnFive).show().appendTo(
            $("#panelScoreBtnGroup" + count));
    $("#btnEight0").clone().attr('id', 'btnEight' + (++dummyBtnEight))
            .insertAfter(genIdBtnEight).show().appendTo(
            $("#panelScoreBtnGroup" + count));
    $("#btnOne0").clone().attr('id', 'btnOne' + (++dummyBtnOne))
            .insertAfter(genIdBtnOne).show().appendTo(
            $("#panelScoreBtnGroup" + count));
    $("#panelScoreBtnSubmit0").clone().attr('id',
                    'panelScoreBtnSubmit' + (++dummyPanelScoreBtnSubmit))
            .insertAfter(genIdPanelScoreBtnSubmit).show().appendTo(
            $("#panelScoreBody" + count));

    if (score == 0) {
        $("#btnZero" + count).addClass('active');
        $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');

    } else if (score == 0.3) {
        $("#btnThree" + count).addClass('active');
        $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
    } else if (score == 0.5) {
        $("#btnFive" + count).addClass('active');
        $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
    } else if (score == 0.8) {
        $("#btnEight" + count).addClass('active');
        $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
    } else if (score == 1) {
        $("#btnOne" + count).addClass('active');
        $("#panelScoreBtnSubmit" + count).attr('data-dismiss', 'modal');
    } else {

    }
}
$( document ).on( "click", "#panelScoreBtnClose", function() {
    $("div[title=genModal]").each(function(){
       $(this).modal("hide");
    });
});

$(function() {
    var $loading = $('#loader').hide();
    $(document).ajaxStart(function() {
        $loading.show();
    }).ajaxStop(function() {
        $loading.hide();
    });
    $("#nameOfRequestToJoinRoom0").hide();
    $("#btnAccept").hide();
    $("#btnDecline").hide();
    $("#alertChooseScore").hide();
    $("#panelRealTime").hide();
    $("#submitOfAllTOpic").hide();
    $("#panelCollapse0").hide();
    $("#panelHeading0").hide();
    $("#panelTitle0").hide();
    $("#panelBody0").hide();
    $("#navpills0").hide();
    $("#listNavpills0").hide();
    $("#modalScoreDialog0").hide();
    $("#modalScoreContent0").hide();
    $("#panelScore0").hide();
    $("#panelScoreHead0").hide();
    $("#panelScoreSubject0").hide();
    $("#panelScoreBtnClose").hide();
    $("#panelScoreBody0").hide();
    $("#dummyKeepIdTopic0").hide();
    $("#panelScoreDescription0").hide();
    $("#panelScoreMessage0").hide();
    $("#panelScoreBtnGroup0").hide();
    $("#panelScoreBtnSubmit0").hide();
    $("#btnZero0").hide();
    $("#btnThree0").hide();
    $("#btnFive0").hide();
    $("#btnEight0").hide();
    $("#btnOne0").hide();
    $("#panelRealTime").hide();
    $("#accordion").empty();
    //$("#btnCompleteExamination").hide();

    var data = {};
    data.roomId = $("#roomId").val();
    data.examinerId = $("#examinerId").attr('value');
    data.committeeId = $("#committeeId").attr('value');
    data.courseId = $("#courseId").attr('value');

    var dataSend = JSON.stringify(data);
    $
            .ajax({
                url : "/EvaluateTool/application/evaluateBoardTopicList",
                type : 'POST',
                data : {
                    data : dataSend
                },
                success : function(data) {
                    var course = JSON.parse(data);
                    createCollapse(course);
                },
                error : function(data, status, er) {
                    alert("error: " + data + " status: " + status
                            + " er:" + er);
                }
            });

    function createCollapse(course) {
        var countOfSpanScore = 1;

        var dummyPanel = 0;
        var dummyHead = 0;
        var dummyCollapse = 0;
        var dummyTitle = 0;
        var dummyCountScoreEachTopic = 0;
        var dummySubmitEachTopic = 0;
        var dummyTotalEachTopic = 0;
        var dummyBody = 0;
        var dummyNavpills = 0;
        var dummyList = 0;
        var dummyScore = 0;
        var dummyLink = 0;
        var dummyModalScore = 0;
        var dummyModalScoreDialog = 0;
        var dummyModalScoreContent = 0;
        var dummyPanelScore = 0;
        var dummyPanelScoreHead = 0;
        var dummyPanelScoreSubject = 0;
        var dummyPanelScoreBody = 0;
        var dummyPanelScoreId = 0;
        var dummyPanelScoreDescription = 0;
        var dummyPanelScoreMessage = 0;
        var dummyPanelScoreBtnGroup = 0;

        var genIdPanel = $("#panelCollapse" + dummyPanel);
        var genIdHead = $("#panelHeading" + dummyHead);
        var genIdTitle = $("#panelTitle" + dummyTitle);
        var genIdCountScoreEachTopic = $("#spanTopic"
                + dummyCountScoreEachTopic);
        var genIdSubmitEachTopic = $("#submitEachTopic"
                + dummySubmitEachTopic);
        var genIdTotalEachTopic = $("#totalEachTopic"
                + dummyTotalEachTopic);
        var genIdCollapse = $("#collapse" + dummyCollapse);
        var genIdBody = $("#panelBody" + dummyBody);
        var genIdNavpills = $("#navpills" + dummyNavpills);
        var genIdListNav = $("#listNavpills" + dummyList);
        var genIdScore = $("#spanScore" + dummyScore);
        var genIdLink = $("#linkToScore" + dummyLink);
        var genIdModalScore = $("#modalScore" + dummyModalScore);
        var genIdModalScoreDialog = $("#modalScoreDialog"
                + dummyModalScoreDialog);
        var genIdModalScoreContent = $("#modalScoreContent"
                + dummyModalScoreContent);
        var genIdPanelScore = $("#panelScore" + dummyPanelScore);
        var genIdPanelScoreHead = $("#panelScoreHead"
                + dummyPanelScoreHead);
        var genIdPanelScoreSubject = $("#panelScoreSubject"
                + dummyPanelScoreSubject);
        var genIdPanelScoreBody = $("#panelScoreBody"
                + dummyPanelScoreBody);
        var genIdPanelScoreId = $("#dummyKeepIdTopic"
                + dummyPanelScoreId);
        var genIdPanelScoreDescription = $("#panelScoreDescription"
                + dummyPanelScoreDescription);
        var genIdPanelScoreMessage = $("#panelScoreMessage"
                + dummyPanelScoreMessage);
        var genIdPanelScoreBtnGroup = $("#panelScoreBtnGroup"
                + dummyPanelScoreBtnGroup);

        var sizeTopic = 0;
        var numberOfTopic = 0;
        var checkIndex = 1;
        var checkColor =1;

        $
                .each(
                course,
                function(i, item) {
                    item
                            .forEach(function(subject) {
                                var sendNameOfSubject = subject.name;
                                $("#panelCollapse0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'panelCollapse'
                                                + (++dummyPanel))
                                        .insertAfter(genIdPanel)
                                        .fadeIn('slow')
                                        .appendTo(
                                        $("#accordion"));
                                $("#panelHeading0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'panelHeading'
                                                + (++dummyHead))
                                        .attr(
                                        'href',
                                                '#collapse'
                                                + dummyHead)
                                        .attr(
                                        'data-target',
                                                '#collapse'
                                                + dummyHead)
                                        .insertAfter(genIdHead)
                                        .show()
                                        .appendTo(
                                        $("#panelCollapse"
                                                + dummyPanel));
                                $("#panelTitle0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'panelTitle'
                                                + (++dummyTitle))
                                        .text(sendNameOfSubject)
                                        .insertAfter(genIdTitle)
                                        .show()
                                        .appendTo(
                                        $("#panelHeading"
                                                + dummyHead));
                                $("#spanTopic0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'spanTopic'
                                                + (++dummyCountScoreEachTopic))
                                        .insertAfter(
                                        genIdCountScoreEachTopic)
                                        .show()
                                        .appendTo(
                                        $("#panelTitle"
                                                + dummyTitle));
                                $("#submitEachTopic0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'submitEachTopic'
                                                + (++dummySubmitEachTopic))
                                        .insertAfter(
                                        genIdSubmitEachTopic)
                                        .show()
                                        .appendTo(
                                        $("#spanTopic"
                                                + dummyCountScoreEachTopic));
                                $("#totalEachTopic0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'totalEachTopic'
                                                + (++dummyTotalEachTopic))
                                        .insertAfter(
                                        genIdTotalEachTopic)
                                        .show()
                                        .appendTo(
                                        $("#spanTopic"
                                                + dummyCountScoreEachTopic));
                                $("#collapse0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'collapse'
                                                + (++dummyCollapse))
                                        .insertAfter(
                                        genIdCollapse)
                                        .appendTo(
                                        $("#panelCollapse"
                                                + dummyPanel));
                                $("#panelBody0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'panelBody'
                                                + (++dummyBody))
                                        .show()
                                        .appendTo(
                                        $("#collapse"
                                                + dummyCollapse));
                                $("#navpills0")
                                        .clone()
                                        .attr(
                                        'id',
                                                'navpills'
                                                + (++dummyNavpills))
                                        .insertAfter(
                                        genIdNavpills)
                                        .show()
                                        .appendTo(
                                        $("#panelBody"
                                                + dummyBody));

                                var numberEachOfTopic = 0;
                                var index = 0;
                                var keepTopic = item[sizeTopic].topic;
                                if(typeof keepTopic != "undefined"){
                                for (index; index < keepTopic.length; ++index) {
                                    var sendId = keepTopic[index].id;
                                    var sendTitle = keepTopic[index].name;
                                    var sendDescription = keepTopic[index].description;
                                    var sendComment = keepTopic[index].comment;
                                    var sendScore = keepTopic[index].score;

                                    $("#listNavpills0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'listNavpills'
                                                    + (++dummyList))
                                            .attr(
                                            'title',
                                            sendTitle)
                                            .insertAfter(
                                            genIdListNav)
                                            .show()
                                            .appendTo(
                                            $("#navpills"
                                                    + dummyNavpills));
                                    $("#linkToScore0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'linkToScore'
                                                    + (++dummyLink))
                                            .text(
                                                    sendTitle
                                                    + " : "
                                                    + sendDescription)
                                            .insertAfter(
                                            genIdLink)
                                            .show()
                                            .appendTo(
                                            $("#listNavpills"
                                                    + dummyList));
                                    $("#dummyKeepIdTopic0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'dummyKeepIdTopic'
                                                    + (++dummyPanelScoreId))
                                            .text(sendId)
                                            .insertAfter(
                                            genIdPanelScoreId)
                                            .hide()
                                            .appendTo(
                                            $("#linkToScore"
                                                    + dummyLink));
                                    $("#spanScore0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'spanScore'
                                                    + (++dummyScore))
                                            .text(sendScore)
                                            .insertAfter(
                                            genIdLink)
                                            .appendTo(
                                            $("#linkToScore"
                                                    + dummyLink));

                                    $("#modalScore0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'modalScore'
                                                    + (++dummyModalScore))
                                            .insertAfter(
                                            genIdModalScore);
                                    $("#modalScoreDialog0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'modalScoreDialog'
                                                    + (++dummyModalScoreDialog))
                                            .insertAfter(
                                            genIdModalScoreDialog)
                                            .show()
                                            .appendTo(
                                            $("#modalScore"
                                                    + dummyModalScore));
                                    $("#panelScore0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScore'
                                                    + (++dummyPanelScore))
                                            .insertAfter(
                                            genIdPanelScore)
                                            .show()
                                            .appendTo(
                                            $("#modalScoreDialog"
                                                    + dummyModalScoreDialog));
                                    $("#panelScoreHead0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreHead'
                                                    + (++dummyPanelScoreHead))
                                            .insertAfter(
                                            genIdPanelScoreHead)
                                            .show()
                                            .appendTo(
                                            $("#panelScore"
                                                    + dummyPanelScore));
                                    $("#panelScoreSubject0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreSubject'
                                                    + (++dummyPanelScoreSubject))
                                            .insertAfter(
                                            genIdPanelScoreSubject)
                                            .show()
                                            .appendTo(
                                            $("#panelScoreHead"
                                                    + dummyPanelScoreHead));
                                    $("#panelScoreBtnClose")
                                            .clone()
                                            .show()
                                            .appendTo(
                                            $("#panelScoreHead"
                                                    + dummyPanelScoreHead));
                                    $("#panelScoreBody0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreBody'
                                                    + (++dummyPanelScoreBody))
                                            .insertAfter(
                                            genIdPanelScoreBody)
                                            .show()
                                            .appendTo(
                                            $("#panelScore"
                                                    + dummyPanelScore));
                                    $("#panelScoreDescription0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreDescription'
                                                    + (++dummyPanelScoreDescription))
                                            .insertAfter(
                                            genIdPanelScoreDescription)
                                            .show()
                                            .appendTo(
                                            $("#panelScoreBody"
                                                    + dummyPanelScoreBody));
                                    $("#panelScoreMessage0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreMessage'
                                                    + (++dummyPanelScoreMessage))
                                            .text(sendComment)
                                            .insertAfter(
                                            genIdPanelScoreMessage)
                                            .show()
                                            .appendTo(
                                            $("#panelScoreBody"
                                                    + dummyPanelScoreBody));
                                    $("#panelScoreBtnGroup0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelScoreBtnGroup'
                                                    + (++dummyPanelScoreBtnGroup))
                                            .insertAfter(
                                            genIdPanelScoreBtnGroup)
                                            .show()
                                            .appendTo(
                                            $("#panelScoreBody"
                                                    + dummyPanelScoreBody));

                                    checkScoreFromBase(
                                            sendScore,
                                            dummyPanelScoreBtnGroup);

                                    numberOfTopic++;
                                    numberEachOfTopic++;
                                }
                                }
                                sizeTopic++;
                                var indexCheckTopic = 0;
                                var keepEachTopicOfSubmit = 0;
                                for (indexCheckTopic; indexCheckTopic < numberEachOfTopic; indexCheckTopic++) {
                                    if ($(
                                                    "#spanScore"
                                                    + countOfSpanScore)
                                            .text() != '-') {
                                        keepEachTopicOfSubmit++;
                                    }
                                    countOfSpanScore++;
                                }

                                $(
                                                "#submitEachTopic"
                                                + sizeTopic)
                                        .text(
                                        keepEachTopicOfSubmit);
                                $("#totalEachTopic" + sizeTopic)
                                        .text(
                                                "/"
                                                + " "
                                                + numberEachOfTopic);

                                var setColor = "panelHeading"+checkIndex;
                                var changeColor = document.getElementById(setColor);
                                switch (checkColor){
                                    case 1: changeColor.style.backgroundColor = "#FF6347";
                                        break;
                                    case 2: changeColor.style.backgroundColor = "#FFA600";
                                        break;
                                    case 3: changeColor.style.backgroundColor = "#FFFF00";
                                        break;
                                    case 4: changeColor.style.backgroundColor = "#92D050";
                                        break;
                                    case 5: changeColor.style.backgroundColor = "#00BFFF";
                                        break;
                                    case 6:	changeColor.style.backgroundColor = "#DA70D6";
                                        break;
                                    case 7:	changeColor.style.backgroundColor = "#FF69B4";
                                        break;

                                }
                                checkColor++
                                checkIndex++;

                                if(checkColor == 8){
                                    checkColor = 1;
                                }
                            });

                });
        var keepTopicOfSubmit = 0;
        $("#submitOfAllTOpic").show();
        var indexCheck = 1
        for (indexCheck; indexCheck <= numberOfTopic; indexCheck++) {
            if ($("#spanScore" + indexCheck).text() != '-') {
                keepTopicOfSubmit++;
            }
        }
        $("#submitTopic").text(keepTopicOfSubmit);
        $("#totalTopic").text(numberOfTopic);
        var checkModulatorId = $("#modulatorId").val();
        var checkCommitteeId = $("#committeeId").attr('value');
        /*if (checkModulatorId == checkCommitteeId) {
         $("#btnCompleteExamination").hide();
         }*/
    }

    //$("#topicList").click(function() {

    //});
    //$("#presenting").click(function() {
    //	$("#submitOfAllTOpic").hide();
    //	$("#accordion").empty();
    //	$("#panelRealTime").fadeIn('slow').appendTo($("#formBoard"));
    //});

    $("#room")
            .click(
            function() {
                var yourId = $("#committeeId").attr('value');
                var yourPosition = $("#yourPosition").val();
                location.href = "/EvaluateTool/application/examinationRoom"
                        + "?yourId="
                        + encodeURIComponent(yourId)
                        + "&yourPosition="
                        + encodeURIComponent(yourPosition)
                        + "&yourName="
                        + encodeURIComponent('${nameCommittee}')
                        + "&yourLastName="
                        + encodeURIComponent('${lastNameCommittee}');
            });
    $("#nameproject")
            .click(
            function() {
                var yourId = $("#committeeId").attr('value');
                var yourPosition = $("#yourPosition").val();
                location.href = "/EvaluateTool/application/examinationRoom"
                + "?yourId="
                + encodeURIComponent(yourId)
                + "&yourPosition="
                + encodeURIComponent(yourPosition)
                + "&yourName="
                + encodeURIComponent('${nameCommittee}')
                + "&yourLastName="
                + encodeURIComponent('${lastNameCommittee}');
            });
    $("#configmanager").click(
            function() {
                var yourId = $("#committeeId").attr('value');
                var yourPosition = $("#yourPosition").val();
                location.href = "/EvaluateTool/application/managerCourse"
                        + "?yourId="
                        + encodeURIComponent(yourId)
                        + "&yourPosition="
                        + encodeURIComponent(yourPosition)
                        + "&yourName="
                        + encodeURIComponent('${nameCommittee}')
                        + "&yourLastName="
                        + encodeURIComponent('${lastNameCommittee}');
            });
    $("#logOut").click(function() {
        location.href = "/EvaluateTool/application/logIn";
    });
    $("#report").click(
            function() {
                var yourId = $("#committeeId").attr('value');
                location.href = "/EvaluateTool/application/report"
                        + "?yourId="
                        + encodeURIComponent(yourId)
                        + "&yourPosition="
                        + encodeURIComponent(yourPosition)
                        + "&yourName="
                        + encodeURIComponent('${nameCommittee}')
                        + "&yourLastName="
                        + encodeURIComponent('${lastNameCommittee}');
            });
    $("#notificationModulator").click(function() {
        $("#notificationContainer").hide();
        $("#notificationContainerModulator").fadeToggle(300);
        return false;
    });

    $("#notificationLink")
            .click(
            function() {
                $("#notificationsBody").empty();
                var person = {
                    "person" : [ {
                        "name" : "Anuchit",
                        "lastName" : "Prasertsang"
                    }, {
                        "name" : "Apichat",
                        "lastName" : "Eakwongsa"
                    }, {
                        "name" : "Sirirad",
                        "lastName" : "Chaiyaphom"
                    } ]
                };
                var dummyNameOfRequestToJoinRoom = 0;
                var genNameOfRequestToJoinRoom = $("#nameOfRequestToJoinRoom"
                        + dummyNameOfRequestToJoinRoom);

                $
                        .each(
                        person,
                        function(i, item) {
                            item
                                    .forEach(function(
                                            person) {

                                        var fullName = person.name
                                                + " "
                                                + person.lastName;
                                        $(
                                                "#nameOfRequestToJoinRoom0")
                                                .clone()
                                                .attr(
                                                'id',
                                                        'nameOfRequestToJoinRoom'
                                                        + (++dummyNameOfRequestToJoinRoom))
                                                .text(
                                                fullName)
                                                .insertAfter(
                                                genNameOfRequestToJoinRoom)
                                                .show()
                                                .appendTo(
                                                $("#notificationsBody"));
                                        $("#btnAccept")
                                                .clone()
                                                .show()
                                                .appendTo(
                                                $("#nameOfRequestToJoinRoom"
                                                        + dummyNameOfRequestToJoinRoom));
                                        $("#btnDecline")
                                                .clone()
                                                .show()
                                                .appendTo(
                                                $("#nameOfRequestToJoinRoom"
                                                        + dummyNameOfRequestToJoinRoom));
                                    });
                        });
                $("#notificationContainerModulator").hide();
                $("#notificationContainer").fadeToggle(300);
                //$("#notification_count").fadeOut("slow");
                //return false;
            });

    $("#btnCompleteExamination,#menuleftbtnCompleteExamination").click(
            function() {
                var data = {};
                data.roomId = $("#roomId").val();
                var roomId = JSON.stringify(data);
                $.ajax({
                    url : "/EvaluateTool/application/setStatus",
                    type : 'POST',
                    data : {
                        roomId : roomId
                    },
                    success : function(data) {
                        stompClient.send("/app/requestandapprove", {"content-type": "application/json;charset=UTF-8"}, JSON.stringify({ 'head': 'updateStatusCard','roomId':'${idRoom}','status':'Complete' }));
                        swal({
                            type:"success",
                            title: "Success",
                            closeOnConfirm:false,
                            confirmButtonText:"OK"
                        });
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
                    }/*,
                     error : function(data, status, er) {
                     alert("error: " + data + " status: " + status
                     + " er:" + er);
                     }*/
                });
            });
    //Document Click hiding the popup
    $(document).click(function() {
        $("#notificationContainerModulator").hide();
        $("#notificationContainer").hide();
    });

    $("#notificationContainerModulator").click(function() {
        return false;
    });

    //Popup on click
    $("#notificationContainer").click(function() {
        return false;
    });

    $(".lialert").click(function() {
        $("#accordion").empty();
        $("#panelScore").fadeIn('slow').appendTo($("#formBoard"));
    });
    $("#btn0").click(function() {
        $('button').removeClass('active');
        $(this).addClass('active');
    });
    $("#btn03").click(function() {
        $('button').removeClass('active');
        $(this).addClass('active');
    });
    $("#btn05").click(function() {
        $('button').removeClass('active');
        $(this).addClass('active');
    });
    $("#btn08").click(function() {
        $('button').removeClass('active');
        $(this).addClass('active');
    });
    $("#btn1").click(function() {
        $('button').removeClass('active');
        $(this).addClass('active');
    });

    $("#buttonSubmit").click(
            function() {
                var dataForm = {};
                dataForm.message = $("textarea#message").val();
                dataForm.btnGroup = $("#panelButtonScore").find(
                        "button.active").prop('value');
                ;
                alert(dataForm.message + " " + dataForm.btnGroup);

                //var dataSend = JSON.stringify(dataForm);

                //console.info(dataSend);
                //$.ajax({
                //url : "/EvaluateTool/evaluateboard",
                //type : 'GET',
                //data : {
                //dataForm : dataSend
                //},
                //success : function(data) {
                //alert(data);
                //},
                //error : function(data, status, er) {
                //alert("error: " + data + " status: " + status
                //	+ " er:" + er);
                //}
                //});

            });
});

</script>
</body>
</html>