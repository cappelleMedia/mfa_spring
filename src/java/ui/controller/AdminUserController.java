package ui.controller;

import domain.user.User;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.ServiceException;
import validation.UserValidator;

@Controller
@SessionAttributes("adminSection")
public class AdminUserController extends SuperController {

    @ModelAttribute("user")
    public User getUser() {
        return new User();
    }

    @InitBinder("user")
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new UserValidator(getSystemAdmin()));
    }

    @RequestMapping("/addUserPage")
    public String getAddUserPage(ModelMap map) {
        User userTmp = new User();
        userTmp.setAdminState(true);
        map.addAttribute("user", userTmp);
        map.addAttribute("formStyle", "add");
        this.setSection(map);
        return "userForm";
    }

    @RequestMapping("/updateUserPage")
    public String getUpdateUserPage(@RequestParam("userID") long userId,
            ModelMap modelMap) {
        this.setSection(modelMap);
        try {
            User user = getSystemAdmin().getUser(userId);
            modelMap.addAttribute("user", user);
            modelMap.addAttribute("formStyle", "update");
            return "userForm";
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Not able to find the user", serEx.getMessage(), "the id of the user was: " + userId);
        }
    }

    @RequestMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user,
            BindingResult result,
            @RequestParam("pwc") String password2,
            ModelMap modelMap) {
        modelMap.addAttribute("user", user);
        this.passwordCheck(user.getPw(), password2, result, modelMap);
        if (result.hasGlobalErrors()) {
            return toServerErrorPage(modelMap, "Not able to start mfa service", result.getGlobalError().getCode(), "the id of the user was: " + user.getId());
        }
        if (result.hasFieldErrors()) {
            this.setSuccessStateClass(modelMap, result);
            modelMap.addAttribute("section", "register");
            return "account";
        } else {
            try {
                getSystemAdmin().addUser(user);
            } catch (ServiceException serEx) {
                return toServerErrorPage(modelMap, "Not able to add user", serEx.getMessage(), "the id of the user was: " + user.getId());
            }
        }
        return "forward:adminAccount.htm";//make the new user log in when everything okay
    }

    @RequestMapping("/addAdmin")
    public String addAdmin(@Valid @ModelAttribute("user") User user,
            BindingResult result, @RequestParam("pwc") String password2, ModelMap modelMap) {
        this.setSection(modelMap);
        modelMap.addAttribute("user", user);
        this.passwordCheck(user.getPw(), password2, result, modelMap);
        if (result.hasGlobalErrors()) {
            return toServerErrorPage(modelMap, "Not able to start mfa service", result.getGlobalError().getCode(), "the id of the user was: " + user.getId());
        }
        if (result.hasFieldErrors()) {
            this.setSuccessStateClass(modelMap, result);
            modelMap.addAttribute("formStyle", "add");
            return "userForm";
        }
        try {
            getSystemAdmin().addUser(user);
            return "redirect:adminAccount.htm";
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Not able to add the user", serEx.getMessage(), "the id of the user was: " + user.getId());
        }
    }

    @RequestMapping("/updateUser")
    public String updateUser(@Valid @ModelAttribute("user") User user,
            BindingResult result, @RequestParam("pwc") String password2,
            @RequestParam("pwOld") String pwOld,
            @RequestParam("pwAd") String pwAd, ModelMap modelMap) {
        this.setSection(modelMap);
        modelMap.addAttribute("formStyle", "update");
        String destination = "redirect:adminAccount.htm";
        try {
            if (!this.checkOldPw(user, pwOld, result, modelMap) || !this.checkAdPw(pwAd, modelMap)) {
                destination = "userForm";
            }
            if (result.hasGlobalErrors()) {
                return toServerErrorPage(modelMap, "Not able to start mfa service", result.getGlobalError().getCode(), "thie id of the user was: " + user.getId());
            }
            if (result.hasFieldErrors() || modelMap.containsValue("has-error")) {
                this.setSuccessStateClass(modelMap, result);
                return "userForm";
            }
            if (!getSystemAdmin().getUser(user.getId()).equals(user)) {
                getSystemAdmin().updateUser(user.getId(), pwOld, user.getUsername(), user.getPw(), user.getAdminState());
            }
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Not able to update the user", serEx.getMessage(), "the id of the user was: " + user.getId());
        }
        return destination;
    }

    @RequestMapping("/deleteUser")
    public String removeUser(@RequestParam("userID") long userId, ModelMap modelMap) {
        this.setSection(modelMap);
        try {
            getSystemAdmin().removeUser(userId);
            return "redirect:adminAccount.htm";
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Deleting user was unsuccessful", serEx.getMessage(), "the user id was: " + userId);
        }
    }

    private void setSection(ModelMap modelMap) {
        modelMap.addAttribute("adminSection", "users");
    }

    private void setSuccessStateClass(ModelMap modelMap, BindingResult result) {
        if (result.hasFieldErrors("username")) {
            modelMap.addAttribute("usernameClass", "has-error");
        } else {
            modelMap.addAttribute("usernameClass", "has-success");
        }
    }

    private boolean checkOldPw(User user, String pwOld, BindingResult result, ModelMap modelMap) throws ServiceException {
        if (user != null) { // technically this can not be null
            if (pwOld == null || pwOld.trim().isEmpty()) {
                modelMap.addAttribute("pwOldError", "The old password needs to be filled in to change it to a new one");
            } else if (!getSystemAdmin().getUser(user.getId()).getPw().equals(pwOld)) {
                modelMap.addAttribute("pwOldError", "The password is incorrect for this user");
            }
            if (modelMap.containsKey("pwOldError")) {
                modelMap.addAttribute("pwOldClass", "has-error");
                return false;
            }
            return true;
        }
        result.reject("User was null");
        return false;
    }

    private boolean checkAdPw(String pwAd, ModelMap modelMap) {
        if (!getSystemAdmin().checkAdminPW(pwAd)) {
            modelMap.addAttribute("pwAdClass", "has-error");
            modelMap.addAttribute("pwAdError", "Incorrect admin password! Make sure you have sufficient privileges to access this function");
            return false;
        }
        return true;
    }

    private void passwordCheck(String password1, String password2, BindingResult result, ModelMap modelMap) {
        if (!password1.equals(password2)) {
            modelMap.addAttribute("pwClass", "has-error");
            modelMap.addAttribute("section", "register");
            result.rejectValue("pw", "valid.passwords.notEqual");
        }
    }
}
