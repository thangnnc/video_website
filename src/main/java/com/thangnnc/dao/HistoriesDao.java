package com.thangnnc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.entities.Histories;
import com.thangnnc.utils.JpaUtils;

public class HistoriesDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public HistoriesDao() {
	}
	
	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}


	public boolean create(Histories history) {
		try {
			em.getTransaction().begin();
			em.persist(history);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public List<Histories>  findByUsername(String username) {
		String jpql = "select o from Histories o where o.userH.username = ?0 order by o.loginDate desc";
		TypedQuery<Histories> query = em.createQuery(jpql, Histories.class);
		query.setParameter(0, username);
		List<Histories> list = query.getResultList();
		return list;
	}

	public List<Histories> findAll(){
		String jpql = "select o from Histories o order by o.loginDate desc";
		TypedQuery<Histories> query = em.createQuery(jpql, Histories.class);
		List<Histories> list = query.getResultList();
		return list;
	}
	
//	public static void main(String[] args) {
//		HistoriesDao dao = new HistoriesDao();
//		UsersDao d = new UsersDao();
//		Users user = d.findById("thangnnc");
//		Histories h = new Histories(user,new Date(), "http://localhost:8080/thangnnc_lab7/edit-user");
//		dao.create(h);
//		for (Histories his : dao.findAll()) {
//			System.out.println(his.getUserH().getFullname() +" | "+ his.getLoginDate().toString() +" | "+ his.getLoginPage());
//		}
//	}
}
