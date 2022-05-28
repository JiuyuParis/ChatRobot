<%@page import="cn.hutool.http.HttpUtil"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图灵机器人</title>
</head>
<body>
	<%
	//设置网页编码格式
	request.setCharacterEncoding("UTF-8");
	//准备请求数据
	String question=request.getParameter("information");
	String apiKey="换成自己申请的图灵机器人的key";
	String userID="123456789";
	String param="{\"reqType\":0,\"perception\": {\"inputText\": {\"text\": \""+question+"\"}},\"userInfo\": {\"apiKey\": \""+apiKey+"\",\"userId\": \""+userID+"\"}}";
	//向图灵接口发送请求数据
	String s=HttpUtil.post("http://openapi.tuling123.com/openapi/api/v2",param);
	System.out.println(s);
	//处理响应数据
	int i=s.lastIndexOf("text");
	int start=i+7;
	int end=s.lastIndexOf("\"");
	String result=s.substring(start,end);
	response.getWriter().write(result);
	%>
</body>
</html>