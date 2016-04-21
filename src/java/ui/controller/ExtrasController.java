package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExtrasController extends SuperController{
    @RequestMapping("/extras")
    public ModelAndView getExtrasPage() {
        return new ModelAndView("extras");
    }
}
