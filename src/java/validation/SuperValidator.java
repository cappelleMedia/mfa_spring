package validation;

import org.springframework.stereotype.Component;
import service.DBDrivenMFASystem;

@Component
public class SuperValidator {
    
    private DBDrivenMFASystem sysAdmin;
    
    public SuperValidator(DBDrivenMFASystem sysAdmin) {
        this.sysAdmin = sysAdmin;
    }

    public DBDrivenMFASystem getSysAdmin() {
        return sysAdmin;
    }
    
    
}
