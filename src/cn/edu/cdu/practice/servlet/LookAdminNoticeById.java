package cn.edu.cdu.practice.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.cdu.practice.model.NoticeAdmin;
import cn.edu.cdu.practice.model.NoticeCompany;
import cn.edu.cdu.practice.service.NoticeService;
import cn.edu.cdu.practice.service.impl.NoticeServiceImpl;
import cn.edu.cdu.practice.utils.Log4jUtils;
import cn.edu.cdu.practice.utils.ValidateUtils;

/**
 * Servlet implementation class LookNoticeById
 */
@WebServlet("/SystemsManagement/LookAdminNoticeById")
public class LookAdminNoticeById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LookAdminNoticeById() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post解码方式
				request.setCharacterEncoding("UTF-8");
				String Id = request.getParameter("Id");
				HttpSession session = request.getSession();
				//参数校验，如果有非法字符，那么就跳转到404
				if (ValidateUtils.validate(Id) || Id == null) {
					response.sendRedirect("http://202.115.82.8:8080/404.jsp");
					//request.getRequestDispatcher("/404.html").forward(request, response);
					return ;
				}
				try {
					Integer adminNoticeId = Integer.parseInt(Id);
					NoticeService noticeService = new NoticeServiceImpl();
					NoticeAdmin noticeCompany = noticeService.queryNoticeAdminById(adminNoticeId);
					session.setAttribute("oneAdminNotice", noticeCompany);
					request.getRequestDispatcher("/SystemsManagement/adminAnnuncement-detail.jsp").forward(request, response);
				}catch(Exception e) {
					Log4jUtils.info(e.getMessage());
					response.sendRedirect("http://202.115.82.8:8080/404.jsp");
					//request.getRequestDispatcher("/404.html").forward(request, response);
				}
				
	}

}
