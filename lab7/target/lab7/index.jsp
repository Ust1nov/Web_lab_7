<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Ввод параметров</title></head>
<body>
    <h2>Настройки сеанса</h2>
    <form method="POST" action="DataProcessor">
        Введите ваше имя: <br>
        <input type="text" name="username"
        <%
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(int i = 0; i < cookies.length; i++) {
                if("user.name".equals(cookies[i].getName())) {
                    out.print(" value='" + java.net.URLDecoder.decode(cookies[i].getValue(), "UTF-8") + "' ");
                }
            }
        }
        %>
        ><br><br>
        Выберите цвет фона страницы результатов:<br>
        <select name="bgcolor">
            <option value="white">Белый</option>
            <option value="lightblue">Светло-синий</option>
            <option value="lightgreen">Светло-зеленый</option>
            <option value="pink">Розовый</option>
        </select><br><br>
        <input type="submit" value="Отправить">
    </form>
</body>
</html>