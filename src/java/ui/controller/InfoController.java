package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController extends SuperController{
    
    @RequestMapping("/info")
    public ModelAndView getInfoPage() {
        return new ModelAndView("info");
    }
}
