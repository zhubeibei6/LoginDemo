package action;





import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dingdan;
import model.Fenlei;
import model.Gonggao;
import model.Manage;
import model.Product;
import model.User;

import org.apache.struts2.ServletActionContext;

import util.Pager;
import util.Util;


import com.opensymphony.xwork2.ActionSupport;

import dao.DingdanDao;
import dao.FenleiDao;
import dao.GonggaoDao;
import dao.ManageDao;
import dao.ProductDao;
import dao.UserDao;



public class ManageAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	
	
	private String url="./";
	
	private GonggaoDao gonggaoDao;
	

	
	
	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}
	
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}
	
	private ManageDao manageDao;


	public ManageDao getManageDao() {
		return manageDao;
	}


	public void setManageDao(ManageDao manageDao) {
		this.manageDao = manageDao;
	}
	
	
	//管理员后台登陆
	public void login() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Manage bean = manageDao.selectBean(" where username='"+username+"' and password ='"+password+"' ");
		if(bean!=null){
			HttpSession session = request.getSession();
			session.setAttribute("manage", bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('登陆成功');window.location.href='index.jsp'; </script>");
		}else{
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('用户名或者密码错误');window.location.href='login.jsp'; </script>");
		}
		
		
	}
	
	//用户退出操作
	public void loginout() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("manage");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('退出成功');window.location.href='login.jsp'; </script>");
	}
	
	
	public String changepwd(){
		this.setUrl("user/password.jsp");
		return SUCCESS;
		
	}
	
	
	//修改密码
	public void changepwd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		HttpSession session = request.getSession();
		Manage manage = (Manage)session.getAttribute("manage");
		
		Manage bean = manageDao.selectBean(" where username='"+manage.getUsername()+"' and password ='"+password1+"' ");
		if(bean!=null){
			bean.setPassword(password2);
			manageDao.updateBean(bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('操作成功');</script>");
		}else{
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('原密码错误');window.location.href='method!changepwd'; </script>");
		}
		
		
	}
	
	
	
	//用户列表
	public String userlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(username !=null &&!"".equals(username)){
			sb.append(" username like '%"+username+"%' ");
			sb.append(" and ");
			request.setAttribute("username", username);
		}
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = userDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<User> list = userDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!userlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("user/userlist.jsp");
		return SUCCESS;
	}
	
	
	
	private UserDao userDao;


	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	
	//用户删除操作
	public void userdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		userDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');window.location.href='method!userlist'; </script>");
		
	}
	
	
	
	
	/**
	 * 管理员分类管理
	 */
	//将FenleiDao注入到ManageAction中
	private FenleiDao fenleiDao;


	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}


	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	
	//分类信息列表
	public String fenleilist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");
			request.setAttribute("name", name);
		}
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = fenleiDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Fenlei> list = fenleiDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!fenleilist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("fenlei/fenleilist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加分类页面
	public String fenleiadd(){
		this.setUrl("fenlei/fenleiadd.jsp");
		return SUCCESS;
	}
	
	
	//添加分类操作
	public void fenleiadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		Fenlei bean = new Fenlei();
		bean.setName(name);
		fenleiDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	
	
	//删除分类操作
	public void fenleidelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		fenleiDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	//跳转到更新分类页面
	public String fenleiupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("fenlei/fenleiupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新分类操作
	public void fenleiupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		bean.setName(name);
		fenleiDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!fenleilist'; </script>");
		
	}
	
	//跳转到查看分类页面
	public String fenleiupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Fenlei bean =fenleiDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("fenlei/fenleiupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	 * 管理员后台商品管理
	 * 将productDao注入到ManageAction中
	 */
	private ProductDao  productDao;


	public ProductDao getProductDao() {
		return productDao;
	}


	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	 private File uploadfile;
		
		
	 public File getUploadfile() {
			return uploadfile;
		}

		
	 public void setUploadfile(File uploadfile) {
			this.uploadfile = uploadfile;
		}
	
	
	//商品信息列表
	public String productlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fenlei = request.getParameter("fenlei");
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");
			request.setAttribute("name", name);
		}
		if(fenlei !=null &&!"".equals(fenlei)){
			sb.append(" fenlei.id= "+fenlei+" ");
			sb.append(" and ");
			request.setAttribute("fenlei", fenlei);
		}
		sb.append(" fenlei.deletestatus=0 and deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 5;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!productlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("product/productlist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加商品页面
	public String productadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl("product/productadd.jsp");
		return SUCCESS;
	}
	
	
	//添加商品操作
	public void productadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String fenlei = request.getParameter("fenlei");
		String maoshu = request.getParameter("maoshu");
		//上传商品图片
		String savapath = "C:/temp/";
		String time = Util.getTime2();
		String imgpath = time+".jpg";
		File file = new File(savapath+imgpath);
		Util.copyFile(uploadfile, file);
		
		Product bean = new Product();
		bean.setCreatetime(new Date());
		bean.setDeletestatus(0);
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setImgpath(imgpath);
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setXiaoliang(0);
		bean.setMaoshu(maoshu);
		productDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	
	
	//删除商品操作
	public void productdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	//跳转到更新商品页面
	public String productupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("product/productupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新商品操作
	public void productupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String id = request.getParameter("id");
		String maoshu = request.getParameter("maoshu");
		String fenlei = request.getParameter("fenlei");

		Product bean =productDao.selectBean(" where id= "+id);
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fenlei));
		bean.setJiage(Double.parseDouble(jiage));
		bean.setMaoshu(maoshu);
		bean.setName(name);
		productDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	//跳转到查看商品页面
	public String productupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("product/productupdate3.jsp");
		return SUCCESS;
	}
	


	
	
	
	
	
	/**
	 * 将dingdanDao注入到MangeAction当中
	 */
	private DingdanDao dingdanDao;


	public DingdanDao getDingdanDao() {
		return dingdanDao;
	}


	public void setDingdanDao(DingdanDao dingdanDao) {
		this.dingdanDao = dingdanDao;
	}
	
	//查看订购列表
	public String dingdanlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderid = request.getParameter("orderid");
		String status = request.getParameter("status");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(orderid !=null &&!"".equals(orderid)){
			sb.append(" orderid like '%"+orderid+"%' ");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		if(status !=null &&!"".equals(status)){
			sb.append(" status like '%"+status+"%' ");
			sb.append(" and ");
			request.setAttribute("status", status);
		}
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Dingdan> list = dingdanDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!dingdanlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("dingdan/dingdanlist.jsp");
		return SUCCESS;
	}
	
	//跳转到订购详细信息页面
	public String dingdanupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Dingdan bean =dingdanDao.selectBean(" where id= "+id );
		request.setAttribute("bean", bean);
		this.setUrl("dingdan/dingdanupdate3.jsp");
		return SUCCESS;
	}
	
	
	//删除订购的操作
	public void dingdandelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		Dingdan dingdan = dingdanDao.selectBean(" where id= "+request.getParameter("id"));
	    dingdan.setDeletestatus(1);
	    dingdanDao.updateBean(dingdan);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');window.location.href='method!dingdanlist'; </script>");
			
	}
	
	
	//发货的操作
	public void fh_dingdanupdate() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		Dingdan dingdan = dingdanDao.selectBean(" where id= "+request.getParameter("id"));
	    dingdan.setStatus("已发货");
	    dingdanDao.updateBean(dingdan);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('发货成功');window.location.href='method!dingdanlist'; </script>");
			
	}
	
	
	
	//公告列表
	public String gonggaolist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(biaoti !=null &&!"".equals(biaoti)){
			sb.append(" biaoti like '%"+biaoti+"%' ");
			sb.append(" and ");
			request.setAttribute("biaoti", biaoti);
		}
		
		sb.append(" deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = gonggaoDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Gonggao> list = gonggaoDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!gonggaolist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("gonggao/gonggaolist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到添加公告页面
	public String gonggaoadd(){
		this.setUrl("gonggao/gonggaoadd.jsp");
		return SUCCESS;
	}
	
	
	//添加公告操作
	public void gonggaoadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		Gonggao bean = new Gonggao();
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		bean.setCreatetime(new Date());
		gonggaoDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	
	
	
	//删除公告操作
	public void gonggaodelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		gonggaoDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	
	//跳转到更新公告页面
	public String gonggaoupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("gonggao/gonggaoupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新公告操作
	public void gonggaoupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		gonggaoDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('提交成功');window.location.href='method!gonggaolist'; </script>");
		
	}
	

	/********************统计*******************/
	//日营业统计(后台) dingdan
	public String tj_dingdanlist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String time = request.getParameter("time");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(time !=null &&!"".equals(time)){
			sb.append(" createtime like '%"+time+"%' ");
			sb.append(" and ");
			request.setAttribute("time", time);
		}
		sb.append(" deletestatus=0 and status='已收货' group by substring(createtime,1,10) ");
		String where = sb.toString();
		List<Dingdan> list = dingdanDao.selectBeanList2(0, 99, where);
		request.setAttribute("list", list);
		this.setUrl("dingdan/tj_dingdanlist.jsp");
		return SUCCESS;
	}
	
	
	
	
}
