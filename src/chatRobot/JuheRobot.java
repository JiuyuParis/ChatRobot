package chatRobot;

import cn.hutool.http.HttpUtil;
import com.google.gson.Gson;

/**
 * 聚合机器人类
 * @author 刘昌兴
 * @date 2022/2/28 11:53
 */
public class JuheRobot extends Robot{
	public String beforeChat(String msg)
	{
		return "?key="+getApiKey()+"&date="+msg;
	}

	@Override
	public String doTalk(String msg) {
		String result = HttpUtil.get(getUrl() + beforeChat(msg));
		System.out.println(result);
		return afterChat(result);
	}

	public String afterChat(String mgs)
	{
		 History history = new Gson().fromJson(mgs,History.class);
		 StringBuilder historyBuilder=new StringBuilder();
		 history.getResult().forEach(historyBuilder::append);
		 return historyBuilder.toString();
	}
}
