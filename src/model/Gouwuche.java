package model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//购物车
@Entity
@Table(name="t_Gouwuche")
public class Gouwuche {
	
	@Id
	@GeneratedValue
	private int id;//主键
    
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//用户 关联用户的ID 外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;//商品 关联商品的ID 外键

	
	private String orderid;//订购号
	
	
	private String content;//评价内容
	
	
    private Date createtime;//添加时间

     private int deletestatus;//删除状态 0表示未删除 1表示删除
     
     
    private int number;//数量
    
    
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
    
    
	
}
