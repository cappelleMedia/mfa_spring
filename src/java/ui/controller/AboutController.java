package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController extends SuperController{
    
    @RequestMapping("/about")
    public ModelAndView getAboutPage() {
        return new ModelAndView("about");
    }
}
