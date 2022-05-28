<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="chatRobot.TulingRobot" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//设置网页编码格式
		request.setCharacterEncoding("UTF-8");
		//建立机器人
		TulingRobot robot=new TulingRobot();
		//设定参数
		String question=request.getParameter("information");
		robot.setUrl("http://openapi.tuling123.com/openapi/api/v2");
		robot.setApiKey("换成自己申请的图灵机器人的key");
		robot.setUserId("123456789");
		//返回结果
		String result=robot.doTalk(question);
		response.getWriter().write(result);
	%>
</body>
</html>