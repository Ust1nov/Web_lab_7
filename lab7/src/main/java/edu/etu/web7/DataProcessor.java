package edu.etu.web7;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DataProcessor")
public class DataProcessor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("username");
        String color = request.getParameter("bgcolor");

        // 1. Сохранение имени и цвета в Cookie
        Cookie nameCookie = new Cookie("user.name", URLEncoder.encode(name, "UTF-8"));
        Cookie colorCookie = new Cookie("user.color", color);
        nameCookie.setMaxAge(60 * 60 * 24); // Время жизни Cookie в секундах (1 день)
        colorCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(nameCookie);
        response.addCookie(colorCookie);

        // 2. Работа с сессионным объектом
        HttpSession session = request.getSession(true);
        Integer count = (Integer) session.getAttribute("visitCount");
        if (count == null) {
            count = 1;
        } else {
            count++;
        }
        session.setAttribute("visitCount", count);
        session.setAttribute("lastVisit", new Date().toString());

        // 3. Перенаправление на страницу вывода
        response.sendRedirect(request.getContextPath() + "/result.jsp");
    }
}