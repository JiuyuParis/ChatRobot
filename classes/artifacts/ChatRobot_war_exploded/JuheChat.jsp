<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="chatRobot.*" %>
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
		JuheRobot robot1=new JuheRobot();
		String question=request.getParameter("text");
		robot1.setUrl("http://v.juhe.cn/todayOnhistory/queryEvent.php");
		robot1.setApiKey("换成自己申请的历史上的今天的key");
		//返回结果
		String result=robot1.doTalk(question);
		response.getWriter().write(result);
	%>
</body>
</html>