package model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//分类
@Entity
@Table(name="t_Fenlei")
public class Fenlei {
	
	@Id
	@GeneratedValue
	private int id;//主键
	
	private String name;//分类名称
	
	private int deletestatus;//删除状态  0表示未删除 1表示已删除
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	
	
	
}
