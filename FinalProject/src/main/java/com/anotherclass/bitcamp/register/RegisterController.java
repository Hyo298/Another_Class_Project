package com.anotherclass.bitcamp.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
	
	@RequestMapping("/register")
	public String register() {
		return "register/userRegister";
	}
}
