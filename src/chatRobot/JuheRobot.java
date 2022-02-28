package chatRobot;
/**
 * 聚合机器人类
 * @author 刘昌兴
 * @date 2022/2/28 11:53
 */
public class JuheRobot extends Robot{
	public String beforeChat(String msg)
	{
		return "info="+msg+"&key="+apiKey;
	}
	public String afterChat(String mgs)
	{
		int start=mgs.indexOf("text")+7;
		int end=mgs.indexOf("error")-4;
		return mgs.substring(start, end);
	}
}
