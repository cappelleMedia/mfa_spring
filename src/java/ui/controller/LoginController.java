package ui.controller;

import domain.user.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.ServiceException;

@Controller
@SessionAttributes("loggedOnUser")
public class LoginController extends SuperController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String logIn(@RequestParam("loginName") String username,
            @RequestParam("loginPassword") String password,
            @RequestParam("loginRememberMe") boolean remember,
            HttpServletResponse response,
            HttpServletRequest request,
            ModelMap modelMap) {
        List<String> errorMessages = new ArrayList<>();
        User userTmp = null;
        try {
            userTmp = this.getSystemAdmin().getAuthenticatedUser(username, password);
        } catch (ServiceException serEx) {
            errorMessages.add(serEx.getMessage());
            System.out.println(serEx.getMessage());
        }
        if (userTmp == null) {
            errorMessages.add("Unknown username and password combination");
            modelMap.addAttribute("loginNameClass", "has-error");
            modelMap.addAttribute("loginPasswordClass", "has-error");
            modelMap.addAttribute("loginName", username);
            modelMap.addAttribute("messages", errorMessages);
            modelMap.addAttribute("loginRemember", remember);
            return "forward:account.htm";
        } else {
            this.remember(request, response, username, remember);
            modelMap.addAttribute("loggedOnUser", userTmp);
            modelMap.addAttribute("account");
        }
        return "forward:adminAccount.htm";
    }

    private Cookie getCookie(HttpServletRequest request, String cookieName) {
        Cookie cookieSearched = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    cookieSearched = cookie;
                    return cookieSearched;
                }
            }
        }
        return null;
    }

    private void remember(HttpServletRequest request, HttpServletResponse response, String username, boolean remember) {
        if (remember) {
            Cookie cookie = new Cookie("username", username);
            response.addCookie(cookie);
        } else {
            Cookie cookie = getCookie(request, "username");
            if (cookie != null) {
                cookie.setMaxAge(0);
            }
        }
    }
    
}
