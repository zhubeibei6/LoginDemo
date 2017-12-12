package action;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dingdan;
import model.Gonggao;
import model.Gouwuche;
import model.Product;
import model.User;

import org.apache.struts2.ServletActionContext;

import util.Pager;

import com.opensymphony.xwork2.ActionSupport;

import dao.DingdanDao;
import dao.FenleiDao;
import dao.GonggaoDao;
import dao.GouwucheDao;
import dao.ProductDao;
import dao.UserDao;

public class IndexAction extends ActionSupport {
 
	private static final long serialVersionUID = 1L;

	private String url = "./";
    private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}

	
	
	//首页
	public  String  index(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String fenlei = request.getParameter("fenlei");
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
		sb.append(" fenlei.deletestatus=0 and deletestatus=0  order by id desc  ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 6;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list1 = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("productlist1", list1);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!index", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl("index.jsp");
		return SUCCESS;
	
	}
	
	

	// 用户注册操作
	public void register() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String truename = request.getParameter("truename");
		String sex = request.getParameter("sex");
		User bean = userDao.selectBean("  where deletestatus=0 and username='"+ username + "'");
		if (bean == null) {
			bean = new User();
			bean.setAddress(address);
			bean.setCreatetime(new Date());
			bean.setEmail(email);
			bean.setPassword(password);
			bean.setPhone(phone);
			bean.setTruename(truename);
			bean.setUsername(username);
			bean.setSex(sex);
			userDao.insertBean(bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("注册成功,当前用户名："+bean.getUsername()+"");
		} else {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("用户名已经存在，注册失败！");
			writer.print("<script  language='javascript'>alert('用户名已经存在，注册失败！');window.location.href='register.jsp'; </script>");
		}

	}
	
	// 用户登录操作
	public void login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User bean = userDao.selectBean("  where deletestatus=0 and username='"+ username + "' and password='" + password + "'   ");
		if (bean != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('登录成功！');window.location.href='indexmethod!index'; </script>");
		} else {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('用户名或者密码错误！登录失败');window.location.href='indexmethod!index'; </script>");
		}

	}

	// 用户退出操作
	public void loginout() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('退出成功！');window.location.href='index'; </script>");

	}
	
	
	//个人信息查询
	public String useradd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		if (user == null) {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
			return  null;
		}
		User bean =userDao.selectBean(" where id= "+user.getId());
		request.setAttribute("bean", bean);
		this.setUrl("useradd.jsp");
		return SUCCESS;
	}
	
	
	//跳转到更新用户页面
	public String userupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		User bean =userDao.selectBean(" where id= "+user.getId());
		request.setAttribute("bean", bean);
		this.setUrl("userupdate.jsp");
		return SUCCESS;
	}
	
	
	//更新用户操作
	public void userupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String truename = request.getParameter("truename");
		String sex = request.getParameter("sex");
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		bean.setAddress(address);
		bean.setCreatetime(new Date());
		bean.setEmail(email);
		bean.setPassword(password);
		bean.setPhone(phone);
		bean.setTruename(truename);
		bean.setSex(sex);
		bean.setCreatetime(new Date());
		userDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('个人信息修改成功');window.location.href='indexmethod!userupdate'; </script>");
	}
	
	
	
	/**
	 * 将fenleiDao注入到MangeAction当中
	 **/
	private FenleiDao fenleiDao;

	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}

	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	/**
	 *  将productDao注入到MangeAction当中
	 **/
	private ProductDao productDao;
    
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	//按类型查看商品列表 
	public String productlist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		String fenlei = request.getParameter("fenlei");
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
		sb.append(" fenlei.deletestatus=0 and deletestatus=0  order by xiaoliang desc  ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 99, " where deletestatus=0 "));
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!productlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("productlist.jsp");
		return SUCCESS;
	}
	

	

	//跳转到查看商品页面
	public String xq_productupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		productDao.updateBean(bean);
		request.setAttribute("bean", bean);
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 99, " where content!=null and product="+bean.getId());
		request.setAttribute("list", list);
		this.setUrl("xq_productupdate.jsp");
		return SUCCESS;
	}
	
	

	
	/**
	 * 购物车功能
	 * @throws IOException
	 */
	private GouwucheDao gouwucheDao;
	
	public GouwucheDao getGouwucheDao() {
		return gouwucheDao;
	}

	public void setGouwucheDao(GouwucheDao gouwucheDao) {
		this.gouwucheDao = gouwucheDao;
	}
	

	// 添加商品到购物车操作
	public void  gouwucheadd() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
			return  ;
		}
		Product product = productDao.selectBean(" where id= "+request.getParameter("productid"));
		Gouwuche bean  = gouwucheDao.selectBean(" where user.id= "+user.getId()+" and product.id= "+product.getId()+"and deletestatus=0");
		if(bean!=null){
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('该商品已经添加到购物车，请勿重复添加');window.location.href='index'; </script>");
			return  ;
		}
		bean = new Gouwuche();
		bean.setCreatetime(new Date());
		bean.setNumber(1);
		bean.setProduct(product);
		bean.setUser(user);
		gouwucheDao.insertBean(bean);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('添加成功');window.location.href='indexmethod!gouwuchelist'; </script>");
			
		
		
	}
	
	
	//购物车列表
	public String  gouwuchelist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
			return null ;
		}
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 9999, " where user.id= "+user.getId()+" and deletestatus=0");
		double zongjia = 0;
		for(Gouwuche bean:list){
			double jiage1 = bean.getNumber()*bean.getProduct().getJiage();
			zongjia  = zongjia + jiage1;
		}
		request.setAttribute("zongjia", zongjia);
		request.setAttribute("list", list);
		this.setUrl("gouwuchelist.jsp");
		return SUCCESS;
	}
	
	//修改购物车的商品数量的操作
	public void gouwucheupdate() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String number = request.getParameter("number");
		Gouwuche gouwuche = gouwucheDao.selectBean(" where id= "+request.getParameter("id"));
		gouwuche.setNumber(Integer.parseInt(number));
		gouwucheDao.updateBean(gouwuche);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('操作成功');window.location.href='indexmethod!gouwuchelist'; </script>");
			
		
	}
	
	//删除购物车商品的操作
	public void gouwuchedelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		Gouwuche gouwuche = gouwucheDao.selectBean(" where id= "+request.getParameter("id"));
	    gouwucheDao.deleteBean(gouwuche);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');" +
						"window.location.href='indexmethod!gouwuchelist'; </script>");
			
		
	}

	/**
	 *订购功能
	 */
	private DingdanDao dingdanDao;

	public DingdanDao getDingdanDao() {
		return dingdanDao;
	}

	public void setDingdanDao(DingdanDao dingdanDao) {
		this.dingdanDao = dingdanDao;
	}
	
	
	
	
	
	//添加订购操作
	public void dingdanadd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String s=new Date().getTime()+"";
		s=s.substring(0,9);
		Dingdan bean = new Dingdan();
		bean.setCreatetime(new Date());
		bean.setOrderid(s);
		bean.setStatus("已付款");
		bean.setUser(user);
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 9999, " where user.id="+user.getId()+" and deletestatus=0");
		StringBuffer sb = new StringBuffer();
		double zongjia = 0;
		for(Gouwuche g:list){
			sb.append(" 商品名:"+g.getProduct().getName() +"，购买数量:"+g.getNumber()  +"，单价:"+g.getProduct().getJiage()  
					+"，￥小计:"+ (g.getNumber()*g.getProduct().getJiage())+"。\r" );
			g.setDeletestatus(1);
			Product product = g.getProduct();
			product.setXiaoliang(product.getXiaoliang()+g.getNumber());
			productDao.updateBean(product);
			g.setOrderid(s);
			gouwucheDao.updateBean(g);
			zongjia = zongjia+(g.getNumber()*g.getProduct().getJiage());
		}
		bean.setXiangqing(sb.toString());
		bean.setZongjia(zongjia);
		dingdanDao.insertBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('操作成功');window.location.href='indexmethod!dingdanlist'; </script>");
		
	}
	
	//查看订购列表
	public String dingdanlist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
			return null ;
		}
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		sb.append(" user.id="+user.getId()+" and deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		long total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Dingdan> list = dingdanDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!dingdanlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("list", list);
		Date date = new Date();
		String time = new SimpleDateFormat("yyyy-MM-dd").format(date);
		request.setAttribute("time", time);
		this.setUrl("dingdanlist.jsp");
		return SUCCESS;
	}
	
	//跳转到订购详细信息页面
	public String dingdanupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Dingdan bean =dingdanDao.selectBean(" where id= "+id );
		request.setAttribute("bean", bean);
		this.setUrl("dingdanupdate3.jsp");
		return SUCCESS;
	}
	
	//删除订购的操作
	public void dingdandelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setAttribute("url","indexmethod!dingdandelete");
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		Dingdan dingdan = dingdanDao.selectBean(" where id= "+request.getParameter("id"));
	    dingdan.setDeletestatus(1);
	    dingdanDao.updateBean(dingdan);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('删除成功');window.location.href='indexmethod!dingdanlist'; </script>");
			
	}
	
	
	//订单收货操作
	public void dingdanupdate() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setAttribute("url","indexmethod!dingdandelete");
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		Dingdan bean = dingdanDao.selectBean(" where id= "+request.getParameter("id"));
	    bean.setStatus("已收货");
	    dingdanDao.updateBean(bean);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('收货成功');window.location.href='indexmethod!dingdanlist'; </script>");
			
	}
	
	
	
	
	
	private GonggaoDao gonggaoDao;

	

	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}
	
	//跳转到查看公告页面
	//公告列表(首页)
	public String sy_gonggaolist(){
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
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!sy_gonggaolist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		this.setUrl("sy_gonggaolist.jsp");
		return SUCCESS;
	}
	
	//跳转到查看公告页面(首页)
	public String xq_gonggao(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Gonggao bean =gonggaoDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("xq_gonggao.jsp");
		return SUCCESS;
	}
	
	//个人信息查询
	public String hy_user() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");	
		if (user == null) {
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
			return  null;
		}
		User bean =userDao.selectBean(" where id= "+user.getId());
		request.setAttribute("bean", bean);
		this.setUrl("hy_user.jsp");
		return SUCCESS;
	}
	
	
	//评价列表
	public String pjlist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Dingdan bean =dingdanDao.selectBean(" where id= "+id);
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 99, " where content is null and orderid ='"+bean.getOrderid()+"' ");
		request.setAttribute("bean", bean);
		request.setAttribute("list", list);
		this.setUrl("pjlist.jsp");
		return SUCCESS;
	}
	
	
	//添加评价操作
	public void pjadd() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String id = request.getParameter("id");
		Dingdan bean =dingdanDao.selectBean(" where id="+id);
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 99, " where   orderid ='"+bean.getOrderid()+"' ");
			for(int i=0;i<list.size();i++){ //循环是为了确定编号
			String content = request.getParameter("content"+i);  //获取的内容加上编号
			Gouwuche h=gouwucheDao.selectBean(" where id= "+request.getParameter("ct"+i)); //获取LIST 固定IP 
			h.setContent(content);
			gouwucheDao.updateBean(h);
		}
		bean.setZt(1);
		dingdanDao.updateBean(bean);
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('评价成功');window.location.href='indexmethod!dingdanlist'; </script>");
		
	}
	
	
	
	
	
	
	
}
