<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// Инициализация переменных значениями по умолчанию
String bgColor = "white";
String userName = "Гость";

// Извлечение массива Cookie для применения настроек интерфейса
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        // Поиск Cookie с выбранным цветом фона
        if ("user.color".equals(c.getName())) {
            bgColor = c.getValue();
        }
        // Поиск Cookie с именем пользователя и декодирование русских символов
        if ("user.name".equals(c.getName())) {
            userName = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
        }
    }
}
%>
<html>
<head>
    <title>Результаты сеанса</title>
</head>
<!-- Применение цвета, прочитанного из файла Cookie, к стилю фона HTML-страницы -->
<body style="background-color: <%= bgColor %>;">
    
    <!-- Вывод приветствия с именем пользователя -->
    <h1>Добро пожаловать, <%= userName %>!</h1>
    
    <!-- Чтение и отображение счетчика обращений текущего пользователя из объекта HttpSession -->
    <p><b>Количество ваших обращений за сеанс:</b> <%= session.getAttribute("visitCount") %></p>
    
    <!-- Чтение и отображение даты последнего запроса из объекта HttpSession -->
    <p><b>Дата и время последнего обращения:</b> <%= session.getAttribute("lastVisit") %></p>
    
    <br><br>
    <a href="index.jsp">Вернуться на стартовую страницу</a>
</body>
</html>