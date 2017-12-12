package dao.impl;

import java.sql.SQLException;
import java.util.List;


import model.Gouwuche;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.GouwucheDao;



public class GouwucheDaoImpl extends HibernateDaoSupport implements GouwucheDao {

	

	public void deleteBean(Gouwuche bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Gouwuche bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Gouwuche selectBean(String where) {
		List<Gouwuche> list = this.getHibernateTemplate().find("from Gouwuche "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Gouwuche  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Gouwuche> selectBeanList(final int start,final int limit,final String where) {
		return (List<Gouwuche>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Gouwuche> list = session.createQuery(" from Gouwuche"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Gouwuche bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
