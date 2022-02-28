<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//HttpURLConnection:网络请求的工具,可以向指定URl路径发送信息，并且获取响应信息
		
		//1.建立网络连接
		URL httpurl = new URL("http://openapi.tuling123.com/openapi/api/v2");//URL,网络资源请求路径
		HttpURLConnection conn = (HttpURLConnection) httpurl.openConnection();//获取网络请求工具HttpURLConnection,创建网络连接
		conn.setConnectTimeout(3000);//网络连接超时
		conn.setReadTimeout(3000);//读取超时
		conn.setDoInput(true);//输出
		conn.setDoOutput(true);//输入
		conn.setRequestMethod("POST");//请求方式
		conn.setRequestProperty("Content-type", 
				"application/x-www-form-urlencoded;charset=UTF-8");//请求头，post请求必须设置
		conn.connect();//建立连接
		//2.发送请求
		//准备请求数据
		String question=request.getParameter("text");//请求文本
		String apiKey="b0cf84b4a62b4387be2800768ce2cea5";//机器人识别码
		String UserId="123456789";//用户ID
		//图灵机器人所需JSON字符串
		String param = "{\"reqType\":0,\"perception\": {\"inputText\": {\"text\": \""+question+"\"}},\"userInfo\": {\"apiKey\": \""+apiKey+"\",\"userId\": \""+UserId+"\"}}";
		OutputStream os = conn.getOutputStream();//获取JVM--->网络流的输出流
		PrintWriter pw = new PrintWriter(os);//获取输出缓冲流
		pw.print(param);//将请求参数通过输出流，装配到请求中
		pw.flush();//清空缓冲区
		pw.close();//关闭流资源
		//3.获取响应数据
		String s = "";//设置空字符串，准备接收相应数据
		if (HttpURLConnection.HTTP_OK == conn.getResponseCode()) {//HTTP_OK=200;状态200代表请求成功
			InputStream is = conn.getInputStream();//获取JVM--->网络流的输入流
			BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));//创建桥转换流，同时设置编码格式
			while (true) {
				String line = br.readLine();//一次读取一行响应文本
				if (line == null)
					break;
				line += "\n";//一行响应文本
				s += line;//拼接所有响应数据
			}
			br.close();//关闭流资源
		}
		//4.获取响应数据
		System.out.println(s);
		//5.5.获取有效数据-->数据处理
		response.getWriter().write(s);

	%>
</body>
</html>