package cn.edu.cdu.practice.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.cdu.practice.model.SystemParameter;
import cn.edu.cdu.practice.service.SystemParameterService;
import cn.edu.cdu.practice.service.impl.SystemParameterServiceImpl;
import cn.edu.cdu.practice.utils.DateUtil;
import cn.edu.cdu.practice.utils.Log4jUtils;
import cn.edu.cdu.practice.utils.MdPwdUtil;

/**
 * Servlet implementation class SystemConfig
 */
@WebServlet("/SystemsManagement/MyConfigServlet")
public class SystemConfigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SystemConfigServlet() {
        super();
    }
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//POST解码
		System.out.println("进入1");
		request.setCharacterEncoding("UTF-8");
		SystemParameterService  systemParameterService = new SystemParameterServiceImpl();
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		String code = request.getParameter("code");
		String releaseProjectStartDate = request.getParameter("releaseProjectStartDate");
		String releaseProjectEndDate = request.getParameter("releaseProjectEndDate");
		String studentSelStartDate = request.getParameter("studentSelStartDate");
		String studentSelEndDate = request.getParameter("studentSelEndDate");
		String studentSelMaxnum = request.getParameter("studentSelMaxnum");
		System.out.println(releaseProjectEndDate+studentSelStartDate+studentSelEndDate);
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("account");
		try {
			System.out.println("进入2");
			//如果更新成功则跳转到查询参数的servlet
			if (systemParameterService.setOrUpdateSystemConfig( account, pwd, code,
					 releaseProjectStartDate, releaseProjectEndDate,
					 studentSelStartDate, studentSelEndDate, studentSelMaxnum,
					 user)) {
				session.setAttribute("account", account);
				request.getRequestDispatcher("/SystemsManagement/SelectSystemConfigServlet").forward(request, response);
				return;
			} 
			else {
				System.out.println("无效1");
				request.getRequestDispatcher("../404.jsp").forward(request, response);
				return ;
			}
		} catch(Exception e) {
			System.out.println("无效2");
			Log4jUtils.info(e.getMessage());
			request.getRequestDispatcher("../404.jsp").forward(request, response);
			return ;
		}
	}

}
