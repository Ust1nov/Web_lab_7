<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ввод параметров</title>
</head>
<body>
    <h2>Настройки сеанса</h2>
    
    <!-- Форма для передачи данных на серверный обработчик DataProcessor -->
    <form method="POST" action="DataProcessor">
        Введите ваше имя: <br>
        <input type="text" name="username"
        <%
        // Извлечение массива файлов Cookie из HTTP-запроса клиента
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            // Перебор всех Cookie для поиска ранее сохраненного имени
            for(int i = 0; i < cookies.length; i++) {
                if("user.name".equals(cookies[i].getName())) {
                    // Декодирование текста из UTF-8 и автоматическая подстановка значения в поле ввода
                    out.print(" value='" + java.net.URLDecoder.decode(cookies[i].getValue(), "UTF-8") + "' ");
                }
            }
        }
        %>
        ><br><br>
        
        Выберите цвет фона страницы результатов:<br>
        <!-- Выпадающий список для выбора цвета, который будет сохранен в Cookie -->
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