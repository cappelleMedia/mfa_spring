package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController extends SuperController{
    
    //TODO handle page not fond and other exceptions by handler
    
    @RequestMapping("/serverError")
    public String getServerErrorPage(ModelMap modelMap) {
        return "errorPages/serverError";
    }
    
}
