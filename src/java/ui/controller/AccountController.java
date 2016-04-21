package ui.controller;

import controller.ControllerException;
import domain.newsfeed.NewsfeedItem;
import domain.poll.PollItem;
import domain.user.User;
import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController extends SuperController {

    @ModelAttribute("user")
    public User getUser() {
        return new User();
    }

    @RequestMapping("/account")
    public String getAccountPage(ModelMap modelMap,
            HttpSession session) {
        String destination = "account";
        if (this.isAdmin(session)) {
            try {
                Collection<PollItem> pollItems = this.getPollItems();
                Collection<NewsfeedItem> newsfeedItems = this.getNewsfeedItems();
                Collection<User> users = this.getUsers();
                modelMap.addAttribute("pollItems", pollItems);
                modelMap.addAttribute("newsfeedItems", newsfeedItems);
                modelMap.addAttribute("users", users);
            } catch (ControllerException contEx) {
                return toServerErrorPage(modelMap, "Not able to get items from database", contEx.getMessage(), "");
            }
        }
        return destination;
    }

    @RequestMapping("/adminAccount")
    public String getAdminAccountPage() {
        return "redirect:account.htm";
    }

    private boolean isAdmin(HttpSession session) {
        if (session.getAttribute("loggedOnUser") != null) {
            if (session.getAttribute("loggedOnUser") instanceof User) {
                User user = (User) session.getAttribute("loggedOnUser");
                return user.getAdminState();
            }
        }
        return false;
    }
}
