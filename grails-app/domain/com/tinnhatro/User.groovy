package com.tinnhatro

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	String name
	String phone
	String email
	Photo avatar

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService', 'isAdmin']

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		name nullable:false
		phone nullable: false, unique: true
		email nullable: true, unique: true
		avatar nullable: true
	}

	static mapping = {
		table('auth_user')
		password column: '`password`'
	}

	boolean isAdmin() {
		return this.authorities.any {it.authority == 'ROLE_ADMIN' || it.authority == 'ROLE_SYSADMIN'}
	}
}
