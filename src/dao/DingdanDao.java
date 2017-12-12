package dao;

import java.util.List;

import model.Dingdan;



public interface DingdanDao {

	
	//插入新纪录
	public void insertBean(Dingdan bean);
	
	//根据id删除纪录
	public void deleteBean(Dingdan bean);
	
	//根据id更新纪录
	public void updateBean(Dingdan bean);

	//获取信息列表,带查询功能，start 表示当前页，limit表示每页显示的条数 start=1,lmit=10
	public List<Dingdan> selectBeanList(final int start,final int limit,final String where);
	
	
	//查询记录的总的条数
	public long selectBeanCount(final String where);
	
	//查询信息
	public Dingdan selectBean(String where);
	
	public List<Dingdan> selectBeanList2(final int start,final int limit,final String where);
	
	
}
