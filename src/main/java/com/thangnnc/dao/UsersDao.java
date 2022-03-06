package com.thangnnc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.dto.Report2;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.JpaUtils;

public class UsersDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public UsersDao() {
	}
	
	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}
	
	public boolean create(Users user) {
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean update(Users user) {
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(String username) {
		try {
			Users user = findById(username);
			em.getTransaction().begin();
			em.remove(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Users findById(String username) {
		Users user = em.find(Users.class, username);
		return user;
	}

	public List<Users> findAll(){
		String jpql = "select o from Users o";
		TypedQuery<Users> query = em.createQuery(jpql, Users.class);
		List<Users> list = query.getResultList();
		return list;
	}

	public List<Users> findToKeyword(String keyword){
		String jpql = "select o from Users o where o.username like ?0 or o.fullname like ?1 or o.email like ?2";
		TypedQuery<Users> query = em.createQuery(jpql, Users.class);
		query.setParameter(0, "%"+keyword+"%");
		query.setParameter(1, "%"+keyword+"%");
		query.setParameter(2, "%"+keyword+"%");
		List<Users> list = query.getResultList();
		return list;
	}


	public List<Report2> findUserByFavoriteVideo(String title) {
		String jpql = "select new Report2(o.userF.username, o.userF.fullname, o.userF.email, o.favoriteDate, o.userF.admin) from Favorites o where o.videoF.title like ?0";
		TypedQuery<Report2> query = em.createQuery(jpql, Report2.class);
		query.setParameter(0, title);
		List<Report2> list = query.getResultList();
		return list;
	}
	
}
