package validation;

import domain.newsfeed.NewsfeedItem;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import service.DBDrivenMFASystem;
import service.ServiceException;

@Component
public class NewsfeedValidator extends SuperValidator implements Validator {

    public NewsfeedValidator(DBDrivenMFASystem systemAdmin) {
        super(systemAdmin);
    }

    @Override
    public boolean supports(Class<?> paramClass) {
        return NewsfeedItem.class.equals(paramClass);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "valid.subject.empty");
        ValidationUtils.rejectIfEmpty(errors, "text", "valid.text.empty");
        NewsfeedItem newsfeed = (NewsfeedItem) obj;
        try {
            //This check is to allow update without changing the subject field -> update text only
            if (getSysAdmin().containsNewsfeedItem(newsfeed.getSubject())) {
                if (getSysAdmin().getNewsfeedId(newsfeed.getSubject()) != newsfeed.getId()) {
                    errors.rejectValue("subject", "valid.subject.double");
                }
            }
        } catch (ServiceException serEx) {
            errors.reject("valid.service.notAvail");
        }
    }

}
