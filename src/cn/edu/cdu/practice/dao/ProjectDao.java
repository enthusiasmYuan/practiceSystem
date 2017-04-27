package cn.edu.cdu.practice.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import cn.edu.cdu.practice.model.Project;
import cn.edu.cdu.practice.model.ProjectSelect;
import cn.edu.cdu.practice.model.Student;
import cn.edu.cdu.practice.utils.PageUtils;

/** 
* @Copyright (C), 2017, 成都大学信息科学与工程学院JavaWeb教材编写组.
* @date 创建时间：2017年4月15日 下午4:05:28 
* @FileName:ProjectDao.java
* @version 1.0 
* @Description:  
* @Author:杨永浩
* @Modification User:
* @Modification Date:下午4:05:28
*/
public interface ProjectDao {

	/**
	 * 添加实训方案
	 * @param p 方案对象
	 * @return
	 */
	public boolean addProject(Project p);
	
	/**
	 * 修改方案，已通过审核方案不能修改
	 * @param p
	 * @return
	 */
	public boolean updateProject(Project p);
	
	/**
	 * 根据角色查询所有方案,分页
	 * @param role 角色    1-企业 9-管理员
	 * @param company_username 如果是企业查询，需传入company_username
	 * @param pageUtils 传入的该对象应设置pageNow和pageSize
	 * @return 
	 */
	public ArrayList<Project> findAllProject(int role,String company_username,PageUtils pageUtils);
	
	/**
	 * 删除方案，已通过审核无法删除
	 * @param p_no 方案号
	 * @return
	 */
	public boolean deleteProject(int p_no);
	
	/**
	 * 审核退审实训方案
	 * @param p_no
	 * @param  check true表示审核通过，false表示退审
	 * @return
	 */
	public boolean checkProject(int p_no,boolean check);
	
	/**
	 * 方案总结
	 * @param p_no 方案号
	 * @param content 总结内容
	 * @return
	 */
	public boolean summaryProject(int p_no,String content);
	
	/**
	 * 实训结束，结束部分
	 * @param p_nos
	 */
	public boolean endProjects(int p_nos[]);
	
	/**
	 * 学生查询所有正进行方案
	 * @param grade 年级
	 * @return
	 */
	public ArrayList<Project> findAllProject(int grade);
	
	/**
	 * 学生选择可选方案，不超过系统预设上限
	 * @param company_name  企业名称
	 * @param p_no  方案号
	 * @param stu_no  学生学号
	 * @param reason  选题理由
	 * @return
	 */
	public boolean chooseProject(String company_name,int p_no,int stu_no,String reason);
	
	/**
	 * 学生退选方案
	 * @param p_no
	 * @param stu_no  学生学号
	 * @return
	 */
	public boolean unChooseProject(int p_no,int stu_no);
	
	/**
	 * 企业查询学生选择本企业方案情况
	 * @param p_no 方案号
	 * @return 学生学号
	 */
	public ArrayList<Integer> findAllStudentChoice(int p_no);
	
	/**
	 * 企业选择学生   学生已有确定方案不能被选择
	 * @param stu_no  学生学号
	 * @param p_no   方案号
	 * @return 
	 */
	public boolean chooseStudent(int stu_no,int p_no);
	
	/**
	 * 企业退选学生
	 * @param stu_nos 学生学号
	 * @param p_no  方案号
	 * @return 
	 */
	public boolean unChooseStudent(int stu_nos[],int p_no);
	
	/**
	 * 企业查询选题理由
	 * @param type 1-已确定 2-没有确定  3-按方案
	 * @param p_no 按方案查询时，该参数必填，按其他查询时填null
	 * @return 
	 */
	public ArrayList<ProjectSelect> findReason(int type,int p_no);
	
	/**
	 * 企业录入成绩，按方案号录入
	 * @param stu_nos 学生学号  与成绩一一对应
	 * @param scores 成绩
	 * @param p_no  方案号
	 * @return 
	 */
	public boolean inputScore(int stu_nos[],int scores[],int p_no);
	
	/**
	 * 按方案号查询学生成绩
	 * @param p_no
	 * @return
	 */
	public ArrayList<ProjectSelect> findScore(int p_no);
	
	/**
	 * 统计所有方案数量
	 * @return
	 */
	public int countProject();
	
	/**
	 * 统计单个企业的方案数量
	 * @return
	 */
	public int countCompanyProject(String company_username);
}

