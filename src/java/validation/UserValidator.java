package validation;

import domain.user.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import service.DBDrivenMFASystem;
import service.ServiceException;

@Component
public class UserValidator extends SuperValidator implements Validator {

    public UserValidator(DBDrivenMFASystem sysAdmin) {
        super(sysAdmin);
    }

    @Override
    public boolean supports(Class<?> paramClass) {
        return User.class.equals(paramClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "vali.username.empty");
        ValidationUtils.rejectIfEmpty(errors, "pw", "valid.password.empty");        
        User user = (User) o;
        try {
            //This check is to allow update without changing the username field -> update text only
            if (getSysAdmin().containsUser(user.getUsername())) {
                if (getSysAdmin().getUserId(user.getUsername()) != user.getId()) {
                    errors.rejectValue("username", "valid.username.double");                    
                }
            }
        } catch (ServiceException serEx) {
            errors.reject("valid.service.notAvail");
        }
    }
}
