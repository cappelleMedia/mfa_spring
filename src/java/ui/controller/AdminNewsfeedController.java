package ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import domain.newsfeed.*;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.ServiceException;
import validation.NewsfeedValidator;

@Controller
@SessionAttributes("adminSection")
public class AdminNewsfeedController extends SuperController {

    @InitBinder("newsfeed")
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new NewsfeedValidator(getSystemAdmin()));
    }

    @RequestMapping("/addNewsfeedPage")
    public String getAddNewsfeedPage(ModelMap map) {
        this.setSection(map);
        map.addAttribute("newsfeed", new NewsfeedItem());
        map.addAttribute("formStyle", "add");
        return "newsfeedForm";
    }

    @RequestMapping("/updateNewsfeedPage")
    public String getUpdateNewsfeedPage(@RequestParam("newsfeedID") long newsfeedID,
            ModelMap modelMap) {
        this.setSection(modelMap);
        try {
            NewsfeedItem newsfeed = getSystemAdmin().getNewsfeedItem(newsfeedID);
            modelMap.addAttribute("newsfeed", newsfeed);
            modelMap.addAttribute("formStyle", "update");
            return "newsfeedForm";
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Not able to find the newsfeed item", serEx.getMessage(), "the id of the newsfeed item was: " + newsfeedID);
        }
    }

    @RequestMapping("/addNewsfeed")
    public String addNewsfeed(@Valid @ModelAttribute("newsfeed") NewsfeedItem newsfeed,
            BindingResult result,
            ModelMap modelMap) {
        this.setSection(modelMap);
        modelMap.addAttribute("newsfeed", newsfeed);
        String destination = "redirect:adminAccount.htm";
        if (result.hasGlobalErrors()) {
            return toServerErrorPage(modelMap, "Not able to start mfa service", result.getGlobalError().getCode(), "thie id of the newsfeed item was: " + newsfeed.getId());
        }
        if (result.hasFieldErrors()) {
            this.setSuccessStateClass(modelMap, result);
            modelMap.addAttribute("formStyle", "add");
            destination = "newsfeedForm";
        } else {
            try {
                getSystemAdmin().addNewsfeedItem(newsfeed);
            } catch (ServiceException serEx) {
                return toServerErrorPage(modelMap, "Not able to add the newsfeed item", serEx.getMessage(), "the id of the newsfeed item was: " + newsfeed.getId());
            }
        }
        return destination;
    }

    @RequestMapping("/updateNewsfeed")
    public String updateNewsfeed(@Valid @ModelAttribute("newsfeed") NewsfeedItem newsfeed,
            BindingResult result,
            ModelMap modelMap) {
        this.setSection(modelMap);
        modelMap.addAttribute("newsfeed", newsfeed);
        String destination = "redirect:adminAccount.htm";
        if (result.hasGlobalErrors()) {
            return toServerErrorPage(modelMap, "Not able to start mfa service", result.getGlobalError().getCode(), "thie id of the newsfeed item was: " + newsfeed.getId());
        }
        if (result.hasFieldErrors()) {
            this.setSuccessStateClass(modelMap, result);
            modelMap.addAttribute("formStyle", "update");
            destination = "newsfeedForm";
        } else {
            try {
                if (!getSystemAdmin().getNewsfeedItem(newsfeed.getId()).equals(newsfeed)) {
                    //This check is for when nothing is changed
                    getSystemAdmin().updateNewsfeedItem(newsfeed.getId(), newsfeed.getSubject(), newsfeed.getText());
                }
            } catch (ServiceException serEx) {
                return toServerErrorPage(modelMap, "Not able to update the newsfeed item", serEx.getMessage(), "the id of the newsfeed item was: " + newsfeed.getId());
            }
        }
        return destination;
    }

    @RequestMapping("/deleteNewsfeed")
    public String removeNewsfeed(@RequestParam("newsfeedID") long newsfeedID,
            ModelMap modelMap) {
        this.setSection(modelMap);
        String destination = "redirect:adminAccount.htm";
        try {
            getSystemAdmin().removeNewsfeedItem(newsfeedID);
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Deleting newsfeed was unsuccessful", serEx.getMessage(), "the newsfeedID was: " + newsfeedID);
        }
        return destination;
    }

    private void setSection(ModelMap modelMap) {
        modelMap.addAttribute("adminSection", "newsfeeds");
    }

    private void setSuccessStateClass(ModelMap modelMap,
            BindingResult result) {
        if (result.hasFieldErrors("subject")) {
            modelMap.addAttribute("newsfeedSubjectClass", "has-error");
        } else {
            modelMap.addAttribute("newsfeedSubjectClass", "has-success");
        }
        if (result.hasFieldErrors("text")) {
            modelMap.addAttribute("newsfeedTextClass", "has-error");
        } else {
            modelMap.addAttribute("newsfeedTextClass", "has-success");
        }
    }    
}
