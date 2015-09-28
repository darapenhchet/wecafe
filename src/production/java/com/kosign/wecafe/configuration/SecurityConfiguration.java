package com.kosign.wecafe.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

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
	public void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/","/home","/admin/logout").permitAll()
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				.antMatchers("/seller/**").access("hasRole('SELLER')")
				.and().formLogin()
				.and().exceptionHandling().accessDeniedPage("/admin/access_denied");
	}
}
