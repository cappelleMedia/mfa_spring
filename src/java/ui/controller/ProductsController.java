package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductsController extends SuperController{
    
    @RequestMapping("/products") 
    public ModelAndView getProductsPage() {
        return new ModelAndView("products");
    }
}
