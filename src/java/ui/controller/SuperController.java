package ui.controller;

import controller.ControllerException;
import domain.newsfeed.NewsfeedItem;
import domain.poll.PollItem;
import domain.user.User;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import service.DBDrivenMFASystem;
import service.ServiceException;

@Controller
public class SuperController {

    private DBDrivenMFASystem systemAdmin;

    public DBDrivenMFASystem getSystemAdmin() {
        return systemAdmin;
    }

    @Autowired
    public void setSystemAdmin(DBDrivenMFASystem systemAdmin) {
        this.systemAdmin = systemAdmin;
    }

    protected String toServerErrorPage(ModelMap modelMap, String cause, String errorMessage, String extraInfo) {
        String destination = "forward:serverError.htm";
        modelMap.addAttribute("cause", cause);
        modelMap.addAttribute("errorMessage", errorMessage);
        modelMap.addAttribute("extraInfo", extraInfo);
        return destination;
    }

    protected List<PollItem> getPollItems() throws ControllerException {
        try {
            return new LinkedList<>(getSystemAdmin().getPollItems());
        } catch (ServiceException serEx) {
            throw new ControllerException(serEx.getMessage(), serEx);
        }
    }

    protected List<NewsfeedItem> getNewsfeedItems() throws ControllerException {
        try {
            return new LinkedList<>(getSystemAdmin().getNewsfeedItems());
        } catch (ServiceException serEx) {
            throw new ControllerException(serEx.getMessage(), serEx);
        }
    }

    protected List<User> getUsers() throws ControllerException {
        try {
            return new LinkedList<>(getSystemAdmin().getUsers());
        } catch (ServiceException serEx) {
            throw new ControllerException(serEx.getMessage(), serEx);
        }
    }
}
