package chatRobot;

import cn.hutool.http.HttpUtil;
/**
 * 机器人接口抽象类
 * @author 刘昌兴
 * @date 2022/2/28 11:41
 */
public abstract class Robot {
	//api url
	private String url;
	//apiKey
	private String apiKey;
	//userId
	private String userId;

	/**
	 * 封装请求数据
	 * @author 刘昌兴
	 * @date 2022/2/28 11:43
	 * @param msg 要发送的文本消息
	 * @return
	 */
	public abstract String beforeChat(String msg);
	/**
	 * 使用Hutool工具包发送请求，接受响应
	 * @author 刘昌兴
	 * @date 2022/2/28 11:43
	 * @param msg 要发送的文本消息
	 * @return
	 */
	public String doTalk(String msg)
	{
		//处理请求参数
		String sendMsg=beforeChat(msg);
		//发送请求，获取结果
		String receiveMsg=HttpUtil.post(url, sendMsg);
		//处理响应数据，并返回调用处
		return afterChat(receiveMsg);
	}
	/**
	 * 处理响应数据
	 * @author 刘昌兴
	 * @date 2022/2/28 11:43
	 */
	public abstract String afterChat(String msg);

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getApiKey() {
		return apiKey;
	}
	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
