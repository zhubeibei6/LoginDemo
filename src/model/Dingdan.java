package model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//订购表
@Entity
@Table(name="t_Dingdan")
public class Dingdan {
	
	@Id
	@GeneratedValue
	private int id;//主键

	private String status;// 订购状态 (已付款,已发货，已收货)
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联用户的id 外键
	

	private  String  xiangqing;//订购详情
	
	private String orderid;//订购号

	private Date createtime;//添加时间
	
	private double zongjia;//总价
	
	private int zt;//评价状态

	private int deletestatus;//订购是否删除状态 0表示未删除 1表示删除  
	
	
	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public double getZongjia() {
		return zongjia;
	}

	public void setZongjia(double zongjia) {
		this.zongjia = zongjia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getXiangqing() {
		return xiangqing;
	}

	public void setXiangqing(String xiangqing) {
		this.xiangqing = xiangqing;
	}

	

	public int getZt() {
		return zt;
	}

	public void setZt(int zt) {
		this.zt = zt;
	}


	
}
