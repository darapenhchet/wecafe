package com.kosign.wecafe.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception{
		auth.inMemoryAuthentication().withUser("customer")
									 .password("customer")
									 .roles("CUSTOMER");
		auth.inMemoryAuthentication().withUser("seller")
									 .password("seller")
									 .roles("SELLER");
		auth.inMemoryAuthentication().withUser("admin")
		                             .password("admin")
		                             .roles("SELLER" ,"ADMIN");
	}
	
	@Override
	public void configure(WebSecurity webSecurity) throws Exception {
		webSecurity.ignoring().antMatchers("/resources/**");
	}
	
	
	
	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/","/home","/admin/logout","/admin/login").permitAll()
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				.antMatchers("/seller/**").access("hasRole('SELLER')")
				.and()
					.formLogin()
					.loginPage("/admin/login")
					.failureUrl("/admin/login?error")
					.defaultSuccessUrl("/admin/")
					.usernameParameter("username")
					.passwordParameter("password")
					.permitAll()
				.and()
					.exceptionHandling()
					.accessDeniedPage("/admin/access_denied")
				.and()					
					.sessionManagement()
					.sessionAuthenticationErrorUrl("/admin/login")
					.invalidSessionUrl("/admin/login")
					.sessionFixation()
					.changeSessionId()
					.maximumSessions(1)
					.maxSessionsPreventsLogin(true)
					.expiredUrl("/admin/login?maxSessions")
					.sessionRegistry(sessionRegistryImpl())
				.and().and().csrf().disable()
					.rememberMe().key("SpringSecurityAppName");
		
		http.logout()
			.invalidateHttpSession(true).deleteCookies("JSESSIONID")
			.permitAll();
	}
	
	@Bean
    protected SessionRegistry sessionRegistryImpl()
    {
        return new SessionRegistryImpl();
    }
}
