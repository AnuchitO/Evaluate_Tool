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
    	System.out.println(map.get("head"));
    	JSONObject jsonData=new JSONObject();
    	if(map.get("head").equals("sendRequestCommittee")){
    		jsonData.put("name",map.get("name"));
	    	jsonData.put("lastname",map.get("lastname"));
	    	jsonData.put("yourId",map.get("yourId"));
	    	jsonData.put("modulator",map.get("moulator"));
	    	jsonData.put("role",map.get("role"));
	    	jsonData.put("title",map.get("title"));
	    	jsonData.put("roomId",map.get("roomId"));
            jsonData.put("count",map.get("count"));
            jsonData.put("modulatorId",map.get("modulatorId"));
	    	jsonData.put("function","notificationRequestCommittee");
    	}else if(map.get("head").equals("removeProcess")){
    		jsonData.put("data",map.get("data"));
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("roomId",map.get("roomId"));
    		jsonData.put("function","removeProcess");
    	}else if(map.get("head").equals("approveProcess")){
            System.out.println("approveProcess");
        }else if(map.get("head").equals("approveSubmitModulator")){
            jsonData.put("data",map.get("data"));
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("roomId",map.get("roomId"));
            jsonData.put("function","approveSubmitModulator");
        }else if(map.get("head").equals("approveSubmitCommittee")){
            jsonData.put("data",map.get("data"));
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("roomId",map.get("roomId"));
            jsonData.put("count",map.get("count"));
            jsonData.put("function","approveSubmitCommittee");
        }else if(map.get("head").equals("updateStatusCard")){
            jsonData.put("name",map.get("name"));
            jsonData.put("lastname",map.get("lastname"));
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("roomId",map.get("roomId"));
            jsonData.put("count",map.get("count"));
            jsonData.put("modulatorId",map.get("modulatorId"));
            jsonData.put("function","updateStatusCard");
        }else if(map.get("head").equals("cancelRequestCommittee")){
            jsonData.put("name",map.get("name"));
            jsonData.put("lastname",map.get("lastname"));
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("modulator",map.get("moulator"));
            jsonData.put("role",map.get("role"));
            jsonData.put("title",map.get("title"));
            jsonData.put("roomId",map.get("roomId"));
            jsonData.put("count",map.get("count"));
            jsonData.put("modulatorId",map.get("modulatorId"));
            jsonData.put("function","removeNotificationRequestCommittee");
        }else if(map.get("head").equals("notificationRequestUpdate")){
            jsonData.put("yourId",map.get("yourId"));
            jsonData.put("roomId",map.get("roomId"));
            jsonData.put("function","notificationRequestUpdate");
        }

    	System.out.println(jsonData.toString());
    	
     //  Thread.sleep(800); // simulated delay
        return jsonData.toString();
    }
}