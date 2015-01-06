<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
        .btn {
            background-color: #FF8C00;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="col-md-11 column">
            <div>
                <select id="courseAllEdit"></select>
                <button type="button" class="btn" id="btnshowDetail">Show</button>
                <label id="showAll"></label>
            </div>
            <option id="option"></option>
            <option id="option0"></option>
        </div>



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
                                        var topicId = data.nameSubject;
                                        console.log(data.nameSubject);
                                        for(var j in data.topicPack){
                                            console.log(data.topicPack[j].nameTopic);
                                        }



                                    });
                                });
                            },
                            error : function(data) {

                            }
                });
            }
        );


    </script>
</body>
</html>
