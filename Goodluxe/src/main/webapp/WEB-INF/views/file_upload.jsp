<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="submitReport1" method="POST" enctype="multipart/form-data">
            학번 : <input type="text" name="studentNumber" /><br/>
            리포트 파일 : <input type="file" name="reportFile" /><br/>
              <input type="submit" />
</form>
		

</body>
</html>