package ui.controller;

import controller.ControllerException;
import domain.newsfeed.NewsfeedItem;
import domain.poll.PollItem;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ServiceException;

@Controller
public class HomeController extends SuperController {

    @RequestMapping("/index")
    public String getIndexPage(ModelMap modelMap) {
        String destination = "index";
        try {
            Collection<PollItem> pollItems = this.getPollItems();
            Collection<NewsfeedItem> newsfeedItems = this.getNewsfeedItems();
            modelMap.addAttribute("pollItems", pollItems);
            modelMap.addAttribute("newsfeedItems", newsfeedItems);
        } catch (ControllerException contEx) {
            return toServerErrorPage(modelMap, "Not able to get database items", contEx.getMessage(), "");
        }
        return destination;
    }

    @RequestMapping(value = "/addPollAnswerVote", method = RequestMethod.POST)
    public String addPollAnswerVote(@RequestParam(value = "answerId") long answerId, @RequestParam(value = "poll") long poll) throws ControllerException {
        try {
            this.getSystemAdmin().addAVoteToAnswerOfPollItem(poll, answerId);
        } catch (ServiceException serEx) {
            throw new ControllerException(serEx.getMessage(), serEx);
        }
        return "redirect:index.htm";
    }
}
