package cn.edu.cdu.practice.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.cdu.practice.dao.impl.ProjectDaoImpl;
import cn.edu.cdu.practice.model.Project;
import cn.edu.cdu.practice.service.impl.ProjectServiceImpl;
import cn.edu.cdu.practice.utils.Log4jUtils;

/**
 * Servlet implementation class UpdatePracticeServlet
 */
@WebServlet("/PracticeManagement/UpdatePracticeServlet")
public class UpdatePracticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePracticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 得到方案号跳转到修改方案界面
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		request.setAttribute("updateProjectNo", no);
		/**
		 * 未设置身份判断
		 */
		request.getRequestDispatcher("/PracticeManagement/updatePractice.jsp").forward(request, response);
	}

	/**
	 * 修改方案基本信息
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 未设置身份判断
		 */
		request.setCharacterEncoding("utf-8");
		String majors[]=request.getParameterValues("major");
		String company_username=request.getParameter("company_username");
		String no=request.getParameter("no");
		String name=request.getParameter("name");
		String introduction=request.getParameter("introduction");
		int students_num=Integer.parseInt(request.getParameter("students_num"));
		String category=request.getParameter("category");
		int grade=Integer.parseInt(request.getParameter("grade"));
		String company_teacher=request.getParameter("company_teacher");
		String company_teacher_title=request.getParameter("company_teacher_title");
		//对得到的majors数组进行连接处理
		String major="";
		for(int i=0;i<majors.length;i++)
			major+=majors[i]+" ";
		ProjectServiceImpl projectServiceImpl=new ProjectServiceImpl();
		grade=projectServiceImpl.getStuGrade(grade);
		
		Log4jUtils.info("修改方案表单数据:"+no+" "+major+" "+company_username+" "+name+" "+introduction
				+" "+students_num+" "+category+" "+grade+" "+company_teacher+" "+company_teacher_title);
		//根据表单数据新建project对象
		Project project=new Project();
		project.setNo(no);
		project.setName(name);
		project.setMajor(major);
		project.setCompanyUsername(company_username);
		project.setIntroduction(introduction);
		project.setStudentsNum(students_num);
		project.setCategory(category);
		project.setGrade(grade);
		project.setCompanyTeacher(company_teacher);
		project.setCompanyTeacherTitle(company_teacher_title);
		
		ProjectDaoImpl projectDaoImpl=new ProjectDaoImpl();
		if(projectDaoImpl.updateProject(project))
			request.getRequestDispatcher("/PracticeManagement/programManagement.jsp").forward(request, response);
	}

}