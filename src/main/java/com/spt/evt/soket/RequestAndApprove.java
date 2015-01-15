package com.spt.evt.soket;

import java.util.Map;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.json.JSONObject;


@Controller
public class RequestAndApprove{
	public RequestAndApprove(){

	}

	@MessageMapping("/requestandapprove")
    @SendTo("/examinationroomandevaluateboard/requestandapprove")
    public String requestandapprove(Map map) throws Exception {
    	JSONObject jsonData=new JSONObject();
    	if(map.get("head").equals("sendRequestCommittee")){
    		jsonData.put("name",map.get("name").toString());
	    	jsonData.put("lastname",map.get("lastname").toString());
	    	jsonData.put("yourId",map.get("yourId").toString());
	    	jsonData.put("modulator",map.get("moulator").toString());
	    	jsonData.put("role",map.get("role").toString());
	    	jsonData.put("title",map.get("title").toString());
	    	jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("count",map.get("count").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
	    	jsonData.put("function","notificationRequestCommittee");
    	}else if(map.get("head").equals("sendRequestExaminer")){
            jsonData.put("name",map.get("name").toString());
            jsonData.put("lastname",map.get("lastname").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("modulator",map.get("moulator").toString());
            jsonData.put("role",map.get("role").toString());
            jsonData.put("title",map.get("title").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("count",map.get("count").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
            jsonData.put("function","notificationRequestExaminer");
        }else if(map.get("head").equals("removeProcess")){
    		jsonData.put("data",map.get("data").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
    		jsonData.put("function","removeProcess");
    	}else if(map.get("head").equals("approveProcess")){
        }else if(map.get("head").equals("approveSubmitModulator")){
            jsonData.put("data",map.get("data").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("name",map.get("name").toString());
            jsonData.put("lastname",map.get("lastname").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("function","approveSubmitModulator");
        }else if(map.get("head").equals("approveSubmitCommittee")){
            jsonData.put("data",map.get("data").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("examinerId",map.get("examinerId").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
            //jsonData.put("count",map.get("count"));
            jsonData.put("function","approveSubmitCommittee");
        }else if(map.get("head").equals("approveSubmitExaminer")){
            jsonData.put("data",map.get("data").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("examinerId",map.get("examinerId").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
            //jsonData.put("count",map.get("count"));
            jsonData.put("function","approveSubmitExaminer");
        }else if(map.get("head").equals("updateStatusCard")){
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("status",map.get("status").toString());
            //jsonData.put("count",map.get("count"));
            jsonData.put("function","updateStatusCard");
        }else if(map.get("head").equals("cancelRequestCommittee")){
            jsonData.put("name",map.get("name").toString());
            jsonData.put("lastname",map.get("lastname").toString());
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("modulator",map.get("moulator").toString());
            jsonData.put("role",map.get("role").toString());
            jsonData.put("title",map.get("title").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("count",map.get("count").toString());
            jsonData.put("participantId",map.get("participantId").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
            jsonData.put("function","removeNotificationRequestCommittee");
        }else if(map.get("head").equals("notificationRequestUpdate")){
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("type",map.get("type").toString());
            jsonData.put("function","notificationRequestUpdate");
        }else if(map.get("head").equals("updateBadgeNotification")){
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("modulatorId",map.get("modulatorId").toString());
            jsonData.put("function","updateBadgeNotification");
        }else if(map.get("head").equals("alertRequestSame")){
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomDescription",map.get("roomDescription").toString());
            jsonData.put("roomName",map.get("roomName").toString());
            jsonData.put("function","alertRequestSame");
        }else if(map.get("head").equals("updateMenuApproveAfterSubmit")){
            jsonData.put("yourId",map.get("yourId").toString());
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("function","updateMenuApproveAfterSubmit");
        }else if(map.get("head").equals("updateMenuApproveModulatorAfterSubmitCommittee")){
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("function","updateMenuApproveModulatorAfterSubmitCommittee");
        }else if(map.get("head").equals("updatePercentCard")){
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("percent",map.get("percent").toString());
            jsonData.put("function","processPercent");
        }else if(map.get("head").equals("presentingShow")){
            jsonData.put("roomId",map.get("roomId").toString());
            jsonData.put("yourIdExaminer",map.get("yourIdExaminer").toString());
            jsonData.put("topic",map.get("topic").toString());
            jsonData.put("function","presentingShow");
        }

     //  Thread.sleep(800); // simulated delay
        return jsonData.toString();
    }
}