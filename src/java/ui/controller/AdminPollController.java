package ui.controller;

import domain.poll.PollItem;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.ServiceException;

@Controller
@SessionAttributes("adminSection")
public class AdminPollController extends SuperController {

    @RequestMapping("/addPollPage")
    public String getAddPollPage(ModelMap modelMap) {        
        this.setSection(modelMap);
        return "addPollPage";
    }

    @RequestMapping("/updatePollPage")
    public String getUpdatePollPage(@RequestParam("pollID") long pollID,
            ModelMap modelMap) {
        this.setSection(modelMap);
        String destination = "updatePollPage";
        try {
            PollItem poll = getSystemAdmin().getPollItem(pollID);
            modelMap.addAttribute("poll", poll);
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Not able to find the poll", serEx.getMessage(), "the id of the poll was: " + pollID);
        }
        return destination;
    }

    @RequestMapping("/updatePoll")
    public String updatePoll(@ModelAttribute("poll") PollItem poll,
            ModelMap modelMap) {
        this.setSection(modelMap);
        String destination = "redirect:adminAccount.htm";
        List<String> errorMessages = new ArrayList<>();
        try {
            getSystemAdmin().updatePollItem(poll.getId(), poll.getQuestion(), poll.getAnswers());
        } catch (ServiceException serEx) {
            errorMessages.add(serEx.getMessage());
            modelMap.addAttribute("result", errorMessages);

            destination = "forward:updatePollPage.htm?pollID=" + poll.getId();
        }
        return destination;
    }

    @RequestMapping("/addPoll")//TODO need to handle domain exception from poll!
    public String addPoll(@ModelAttribute("poll") PollItem poll,
            ModelMap modelMap) {
        this.setSection(modelMap);
        String destination = "redirect:adminAccount.htm";
        List<String> errorMessages = new ArrayList<>();
        try {
            getSystemAdmin().addPollItem(poll);
        } catch (ServiceException serEx) {
            errorMessages.add(serEx.getMessage());
            modelMap.addAttribute("result", errorMessages);
            destination = "forward:addPollPage.htm";
        }
        return destination;
    }

    @RequestMapping("/deletePoll")
    public String removePoll(@RequestParam("pollID") long pollID,
            ModelMap modelMap) {
        this.setSection(modelMap);
        String destination = "redirect:adminAccount.htm";
        try {
            getSystemAdmin().removePollItem(pollID);
        } catch (ServiceException serEx) {
            return toServerErrorPage(modelMap, "Deleting poll was not successful", serEx.getMessage(), serEx.getMessage());
        }
        return destination;
    }
    
    private void setSection(ModelMap modelMap) {
        modelMap.addAttribute("adminSection", "polls");
    }
}
