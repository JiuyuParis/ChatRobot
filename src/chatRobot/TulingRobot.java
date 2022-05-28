package chatRobot;
/**
 * 图灵机器人类
 * @author 刘昌兴
 * @date 2022/2/28 11:37
 */
public class TulingRobot extends Robot{
	public String beforeChat(String msg)
	{
		return "{\"reqType\":0,\"perception\": {\"inputText\": {\"text\": \""+msg+"\"}},\"userInfo\": {\"apiKey\": \""+getApiKey()+"\",\"userId\": \""+getUserId()+"\"}}";
	}
	public String afterChat(String msg)
	{
		int start=msg.lastIndexOf("text")+7;
		int end=msg.lastIndexOf("\"");
		return msg.substring(start, end);
	}
}
