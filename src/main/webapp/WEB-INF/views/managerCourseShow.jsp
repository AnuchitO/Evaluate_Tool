<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Evaluate Tool</title>
    <style>
        .btn {
            background-color: #FF8C00;
            margin-left: 20px;
        }
        a:hover{
            cursor: pointer;
        }
        div.ui:hover{
            cursor: default;
        }
        .header{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="test">
        <select class="ui dropdown" id="courseAllEdit"></select>
        <button type="button" class="ui orange tiny  button" id="btnshowDetail">Show</button>
        <label id="showAll"></label>
    </div>
    <option id="option"></option>
    <option id="option0"></option>
    <div id="showCourse">
    </div>
    <div style="width:100px;position:fixed;top:50%;left:0px;z-index:2" id="menulefthover">
        <img width="32px" height="30px" onclick="openmenuleftCourse()" src="/EvaluateTool/resources/images/menu.png" id="imgmenuleft" class="glyphicon">
        <b hidden="" id="extendimgmenuleft" style="display: none;">Menu</b>
    </div>

    <script>

        var dataForm = {};
        dataForm.id = $("#courseAllEdit").val();
        var dataSend = JSON.stringify(dataForm);
        console.info(dataSend);
        $
                .ajax({
                    url: "/EvaluateTool/application/courseGetAll",
                    type: 'POST',
                    data: {
                        dataForm: null
                    },
                    success: function (data) {
                        $("#courseAllEdit").empty();

                        var addTopic = JSON.parse(data);
                        var dummyOption = 0;
                        var dummyRoomId = 0;
                        var genOptionId = ("#option" + dummyOption);

                        $.each(addTopic, function (i, item) {
                            item.forEach(function (data) {
                                var topicId = data.courseId;
                                var name = data.courseName;


                                $("#option").clone()
                                        .attr('id', 'option' + (++dummyOption)).text(
                                        name).val(topicId)
                                        .insertAfter(genOptionId).show().appendTo(
                                        $("#courseAllEdit"));
                            });
                        });
                    }
                });

        $("#btnshowDetail").click(
            function() {
                $("ul[class=list-group]").each(function(){
                    $(this).remove();
                });
                var dataForm = {};
                dataForm.id = $("#courseAllEdit").val();
                var dataSend = JSON.stringify(dataForm);
                console.info(dataSend);

                $
                        .ajax({
                            url : "/EvaluateTool/application/showDetail",
                            type : 'POST',
                            data : {
                                dataForm : dataSend
                            },success : function(data) {
                                var allShow = JSON.parse(data);
                                $.each(allShow, function (i, item) {
                                    item.forEach(function (data) {
                                        var nameSubject = data.nameSubject;
                                        var idSubject = data.id;
                                        $('#showCourse').append("<ul class='list-group' id='"+idSubject+"'><div class='ui icon message' style='background-color:#ffa100'><div class='content' style='float: left'><div class='header' style='color:white' onclick='hideTopic("+idSubject+")'>"+data.nameSubject+"</div></div></div></ul>");
                                        for(var j in data.topicPack){
                                            $("ul[id="+idSubject+"]").append("<div class='ui green large button' style='margin:5px;width:100%'>"+data.topicPack[j].nameTopic+"</div>");
                                        }
                                    });
                                });

                            },
                            error : function(data) {

                            }
                });
            }
        );
        function hideTopic(idSubject){
            $("ul[id="+idSubject+"] div[class='ui green large button']").each(function(){
                $(this).slideToggle(400);
            });
        }
        var fullname = '${name}'+'  '+'${lastName}';
        $("#fullname").html(fullname);
        $("#anotificationapprove").hide();
        $("#anotificationsubmitandcalcel").hide();
        $("#menuReSize").hide();
        $("#menulefthead").hide();
        $("#menulefthover").hide();
        $("#menuleftplus").hide();
        $("#configmanager").hide();
        $("#anotificationapprove").hide();
        $("#anotificationsubmitandcalcel").hide();
        $("#menuReSizeCourse").show();
        var i=0
        function openmenuleftCourse(){
            if(i==0){
                $("#contenthead").removeClass("col-md-10 column").addClass("col-md-12 column");
                $("#contentcol2").removeClass("col-md-2 column").addClass("col-md-3 column");
                $("#menuleftCourse").hide();
                i++;
            }else{
                $("#contentcol2").removeClass("col-md-3 column").addClass("col-md-2 column");
                $("#contenthead").removeClass("col-md-12 column").addClass("col-md-10 column");
                $("#menuleftCourse").slideDown(400);
                i--;
            }
        }
        $("#imgmenuleft").mouseover(function(){
            $("#extendimgmenuleft").slideToggle(300);
        });
        $("#imgmenuleft").mouseout(function(){
            $("#extendimgmenuleft").slideToggle(300);
        });

        $("#managerCourse").click(
                function() {
                    //var yourId = $("#committeeId").attr('value');
                    location.href = "/EvaluateTool/application/managerCourse"
                    + "?yourId="
                    + encodeURIComponent('${yourId}')
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastName}');
                });
        $("#managerShowCourse").click(
                function() {
                    //var yourId = $("#committeeId").attr('value');
                    location.href = "/EvaluateTool/application/managerCourseShow"
                    + "?yourId="
                    + encodeURIComponent('${yourId}')
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastName}');
                });

        $("#room").click(
                function() {
                    location.href = "/EvaluateTool/application/examinationRoom"
                    + "?yourId=" + encodeURIComponent(('${yourId}'))
                    + "&yourPosition="
                    + encodeURIComponent('${yourPosition}')
                    + "&yourName="
                    + encodeURIComponent('${name}')
                    + "&yourLastName="
                    + encodeURIComponent('${lastName}');
                    ;
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
