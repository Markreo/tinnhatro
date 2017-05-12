package tinnhatro

import com.tinnhatro.Role
import com.tinnhatro.User
import com.tinnhatro.UserRole

class BootStrap {

    def init = { servletContext ->
        //ROLE_CHOTHUE
        //ROLE_CANTHUE
        //ROLE_ADMIN
        //ROLE_SYSADMIN
        if(!Role.count()) {
            new Role(authority: 'ROLE_CHOTHUE').save(flush: true)
            new Role(authority: 'ROLE_CANTHUE').save(flush: true)
            new Role(authority: 'ROLE_ADMIN').save(flush: true)
            def role = new Role(authority: 'ROLE_SYSADMIN').save(flush: true)
            def admin = new User(username: 'admin', password: '123456', name: "System Admin", phone: '01676112012')
            if(admin.hasErrors() || !admin.save(flush: true)) {
                println admin.errors
            }
            def roleAdmin = UserRole.findOrCreateWhere(user: admin, role: role)
            roleAdmin.save(flush: true)
        }
    }
    def destroy = {
    }
}
