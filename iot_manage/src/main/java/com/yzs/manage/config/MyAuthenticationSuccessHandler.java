package com.yzs.manage.config;

import com.yzs.manage.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.ForwardAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyAuthenticationSuccessHandler extends ForwardAuthenticationSuccessHandler {
    @Autowired
    private IUserService userService;


    /**
     * @param forwardUrl
     */
    public MyAuthenticationSuccessHandler(String forwardUrl) {
        super(forwardUrl);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String unitId = userService.getConcurrentUnitId();
        request.getSession().setAttribute("unitId",unitId==null?"":unitId);
        System.out.println("==================="+unitId);
        super.onAuthenticationSuccess(request,response,authentication);
    }
}
