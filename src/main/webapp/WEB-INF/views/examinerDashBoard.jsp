<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Examiner Board</title>
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

        .bs-sidebar {
            background-color: #f7d49e;
        }

        .panel-default>.panel-heading {
            text-align: center;
            background-color: #FF8C00;
            color: #000000;
        }

        .panel-default>.panel-body {
            text-align: center;
        }

        .highlight {
            background: yellow;
        }

        a {
            cursor: pointer;
            color:black;
        }

        .btn {
            background-color: #FF8C00;
        }
        div.ui:hover{
            cursor: default;
        }
    </style>
</head>
<body>
<input type="hidden" id="roomId" value="${idRoom}" />
<input type="hidden" id="yourId" value="${yourId}" />
<input type="hidden" id="yourPosition" value="${yourPosition}" />
<label id="examinerId" value="${idExaminer}"></label>
<br>
<label id="courseId" value="${idCourse}"></label>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div id="container" class="row">
            <div class="col-md-2 col-sm-2">
                <div class="bs-sidebar">
                    <ul id="allSubjectList" class="nav bs-sidenav">
                    </ul>
                </div>
            </div>
            <div id="cardSpace" class="col-md-10 col-sm-10"></div>
        </div>
    </div>
</div>
<li id="eachSubject0" onClick="javascript:showTopic(this);"></li>
<a id="subject0"></a>
<div align="center" id="card0" class="col-md-6 col-sm-6 col-xs-6"></div>
<div id="panel0" class="panel panel-default" style="background-color: #fdf4e6"></div>
<div id="panelHead0" class="ui orange tiny button" style="width:100%"></div>
<h3 id="topicName0" class="panel-title"></h3>
<div id="panelBody0" class="panel-body"></div>
<button id="btnPresent" type="button" class="ui teal tiny  button"
        onClick="javascript:requestController($(this).parent().attr('id'),this.value);">
    <i class="glyphicon glyphicon-play"></i>Present</button>
<script type="text/javascript"
        src="${contextPath}/resources/stomp.js"></script>
<script type="text/javascript"
        src="${contextPath}/resources/sockjs-0.3.4.js"></script>

<script>

var stompClient = null;
$(function() {
    ////////////////////////////////Web Socket ///////////////////////
    setConnect();
    function setConnect(){
        var socket = new SockJS('/EvaluateTool/webSocket/requestandapprove');
        stompClient = Stomp.over(socket);
        stompClient.heartbeat.outgoing = 20000;
        stompClient.heartbeat.incoming = 20000;
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/examinationroomandevaluateboard/requestandapprove', function(data){
                data.ack
                //accessMethod(JSON.parse(data.body));
            },{ack: 'client'});
        });
        socket.onclose = function() {
            console.log('close');
            stompClient.disconnect();
            setConnect();
            console.log("socket fail");
        };
    }
    ///////////////////////////////Subject List///////////////////////
    $("#eachSubject0").hide();
    $("#card0").hide();
    $("#panel0").hide();
    $("#panelHead0").hide();
    $("#topicName0").hide();
    $("#panelBody0").hide();
    $("#btnPresent").hide();
    var data = {};
    data.roomId = $("#roomId").val();
    data.examinerId = $("#examinerId").attr('value');
    data.courseId = $("#courseId").attr('value');

    var dataSend = JSON.stringify(data);
    $
            .ajax({
                url : "/EvaluateTool/application/examinerDashBoardTopicList",
                type : 'POST',
                data : {
                    data : dataSend
                },
                success : function(data) {
                    var course = JSON.parse(data);
                    createToggle(course);
                },
                error : function(data, status, er) {
                    alert("error: " + data + " status: " + status
                            + " er:" + er);
                }
            });
    function createToggle(course) {
        var dummyEachSubject = 0;
        var dummySubject = 0;
        var genEachSubject = $("#eachSubject" + dummyEachSubject);
        var genSubject = $("#subject" + dummySubject);
        $.each(course, function(i, item) {
            item
                    .forEach(function(subject) {
                        var sendNameOfSubject = subject.name;
                        $("#eachSubject0").clone().attr('id',
                                        'eachSubject' + (++dummyEachSubject))
                                .insertAfter(genEachSubject).show()
                                .appendTo($("#allSubjectList"));
                        $("#subject0").clone().attr('id',
                                        'subject' + (++dummySubject)).text(
                                sendNameOfSubject).insertAfter(
                                genSubject).appendTo(
                                $("#eachSubject" + dummyEachSubject));
                    });
        });
    }
});

////////////////////////////////Set Standard Content And Menu After Open Page///////////////////////
var yourPosition='${yourPosition}';
var name='${name}';
var lastname='${lastName}';
$("#fullname").html(name+"  "+lastname);
$("#loader").hide();
$("#menuleftplus").hide();
    $("#btnnotificationsubmitandcalcel").show();
    $("#headdropdownapprovepermission").hide();
    $("#headdropdownsubmitandcancel").hide();
    $("#menuleft").hide();
    $("#imgmenuleft").hide();
    $("#contenthead").removeClass("col-md-10 column");
    $("#contenthead").addClass("col-md-12 column");
if(yourPosition=="Software Analyst"){
    //$("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    //$("#confighistory").show();
    $("#configmanager").show();
}else if(yourPosition=="Manager"){
    //$("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    //$("#confighistory").show();
    $("#configmanager").show();
}else if(yourPosition=="Software Development Trainee"){
    //$("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    //$("#confighistory").hide();
    $("#configmanager").hide();
}else{
    //$("#confighome").show();
    $("#configroom").show();
    $("#configreport").show();
    //$("#confighistory").show();
    $("#configmanager").hide();
}

////////////////////////////////Show Topic Each Subject///////////////////////
function showTopic(element) {
    var sizeTopic = (element.id).replace(/[^\d.]/g, '') - 1;
    var data = {};
    //data.roomId = $("#roomId").val();
    //data.examinerId = $("#examinerId").attr('value');
    data.courseId = $("#courseId").attr('value');

    var dataSend = JSON.stringify(data);
    $
            .ajax({
                url : "/EvaluateTool/application/examinerDashBoardTopicList",
                type : 'POST',
                data : {
                    data : dataSend
                },
                success : function(data) {
                    $("#cardSpace").empty();
                    var course = JSON.parse(data);
                    var dummyCard = 0;
                    var dummyPanel = 0;
                    var dummyPanelHead = 0;
                    var dummyTopicName = 0;
                    var dummyPanelBody = 0;

                    var genCard = $("#card" + dummyCard);
                    var genPanel = $("#panel" + dummyPanel);
                    var genPanelHead = $("#panelHead" + dummyPanelHead);
                    var genTopicName = $("#topicName" + dummyTopicName);
                    var genPanelBody = $("#panelBody" + dummyPanelBody);
                    $
                            .each(
                            course,
                            function(i, item) {
                                var index = 0;

                                var keepTopic = item[sizeTopic].topic;
                                for (index; index < keepTopic.length; ++index) {
                                    var sendTitle = keepTopic[index].name;
                                    var sendDescription = keepTopic[index].description;
                                    $("#card0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'card'
                                                    + (++dummyCard))
                                            .insertAfter(
                                            genCard)
                                            .fadeIn('slow')
                                            .appendTo(
                                            $("#cardSpace"));
                                    $("#panel0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panel'
                                                    + (++dummyPanel))
                                            .insertAfter(
                                            genPanel)
                                            .show()
                                            .appendTo(
                                            $("#card"
                                                    + dummyCard));
                                    $("#panelHead0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelHead'
                                                    + (++dummyPanelHead))
                                            .insertAfter(
                                            genPanelHead)
                                            .show()
                                            .appendTo(
                                            $("#panel"
                                                    + dummyPanel));
                                    $("#topicName0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'topicName'
                                                    + (++dummyTopicName))
                                            .text(sendTitle)
                                            .insertAfter(
                                            genTopicName)
                                            .show()
                                            .appendTo(
                                            $("#panelHead"
                                                    + dummyPanelHead));
                                    $("#panelBody0")
                                            .clone()
                                            .attr(
                                            'id',
                                                    'panelBody'
                                                    + (++dummyPanelBody))
                                            .text(
                                            sendDescription)
                                            .insertAfter(
                                            genPanelBody)
                                            .show()
                                            .appendTo(
                                            $("#panel"
                                                    + dummyPanel));
                                    $("#btnPresent")
                                            .clone()
                                            .attr(
                                            'value',
                                            sendTitle)
                                            .show()
                                            .appendTo(
                                            $("#panel"
                                                    + dummyPanel));
                                }
                            });
                },
                error : function(data, status, er) {
                    alert("error: " + data + " status: " + status
                            + " er:" + er);
                }
            });
}

////////////////////////////////Event Presenting Now On Websocket Page EvaluateBoard///////////////////////
function requestController(element,topic) {
    var panelHead=$("#"+element+" div").attr("id");
    $("div[class='ui green tiny button']").each(function(){
        $(this).removeClass('ui green tiny button').addClass('ui orange tiny button');
    });
    $("#" + panelHead).removeClass('ui orange tiny button').addClass('ui green tiny button');
    stompClient.send("/app/requestandapprove", {}, JSON.stringify({ 'head': 'presentingShow','topic': topic,'yourIdExaminer': '${yourId}','roomId':'${idRoom}'}));
    /*	var data = {};
     data.examinerId = $("#examinerId").attr('value');

     var dataSend = JSON.stringify(data);
     $
     .ajax({
     url : "/EvaluateTool/application/test",
     type : 'POST',
     data : {
     data : dataSend
     },
     success : function(data) {

     },
     error : function(data, status, er) {
     alert("error: " + data + " status: " + status
     + " er:" + er);
     }
     });*/
}
$("#room").click(
        function() {
            var yourId = $("#yourId").attr('value');
            var yourPosition = $("#yourPosition").val();
            location.href = "/EvaluateTool/application/examinationRoom"
                    + "?yourId=" + encodeURIComponent(yourId)
                    + "&yourPosition="
                    + encodeURIComponent(yourPosition)+ "&yourName="
                    + encodeURIComponent('${name}')+ "&yourLastName="
                    + encodeURIComponent('${lastName}');
            ;
        });
$("#logOut").click(function() {
    location.href = "/EvaluateTool/application/logIn";
});
$("#report").click(
        function() {
            location.href = "/EvaluateTool/application/report"
                    + "?yourId="
                    + encodeURIComponent('${yourId}')
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastName}');
        });
$("#nameproject").click(function(){
    location.href = "/EvaluateTool/application/examinationRoom"
            + "?yourId="
            + encodeURIComponent('${yourId}')
            + "&yourPosition="
            + encodeURIComponent('${yourPosition}')
            + "&yourName="
            + encodeURIComponent('${name}')
            + "&yourLastName="
            + encodeURIComponent('${lastName}');
});
</script>
</body>
</html>