package com.spt.evt.service;

import org.json.JSONObject;

public interface LogInService {
	public JSONObject checkUserNamePassword(String userName,String password);
}
