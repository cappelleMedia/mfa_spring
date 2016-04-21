package ui.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import service.MenuItem;

@Controller 
@SessionAttributes("menuItems")
public class MenuController extends SuperController{
    
    @RequestMapping("/includers/menu")
    public ModelAndView getMenu(){
        List<MenuItem> menuItems = this.getSystemAdmin().getMenu();
        ModelAndView mav = new ModelAndView("includers/menu");
        mav.addObject("menuItems", menuItems);
        return mav;
    }
    
    
}
