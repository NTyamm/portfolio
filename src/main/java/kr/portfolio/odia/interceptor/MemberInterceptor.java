package kr.portfolio.odia.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object Handler)throws Exception{
		//세션에 있는 회원정보를 가져옴. 세션에 user로 저장했다면 user로
		Object user = request.getSession().getAttribute("user");
		if(user == null) {
			String str = request.getServletPath();
			request.getSession().setAttribute("prevURL", str);
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		return true;
	}
}
