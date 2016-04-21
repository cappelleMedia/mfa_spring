package ui.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LogOutController extends SuperController{
    
    
    @RequestMapping("/logout")
    public String logOut(HttpSession session, @RequestParam("page")String page) {
        session.invalidate();
        return "redirect:" + page + ".htm";
    }
}
