<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String bgColor = "white";
String userName = "Гость";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        if ("user.color".equals(c.getName())) {
            bgColor = c.getValue();
        }
        if ("user.name".equals(c.getName())) {
            userName = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
        }
    }
}
%>
<html>
<head><title>Результаты сеанса</title></head>
<!-- Применяем цвет из Cookie к фону страницы -->
<body style="background-color: <%= bgColor %>;">
    <h1>Добро пожаловать, <%= userName %>!</h1>
    
    <!-- Извлекаем данные напрямую из сессионного объекта -->
    <p><b>Количество ваших обращений за сеанс:</b> <%= session.getAttribute("visitCount") %></p>
    <p><b>Дата и время последнего обращения:</b> <%= session.getAttribute("lastVisit") %></p>
    
    <br><br>
    <a href="index.jsp">Вернуться на стартовую страницу</a>
</body>
</html>