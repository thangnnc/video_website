package com.thangnnc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.entities.Comments;
import com.thangnnc.utils.JpaUtils;

public class CommentsDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public CommentsDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Comments cmt) {
		try {
			em.getTransaction().begin();
			em.persist(cmt);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Comments cmt) {
		try {
			em.getTransaction().begin();
			em.merge(cmt);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(Long cmtId) {
		try {
			Comments cmt = findById(cmtId);
			em.getTransaction().begin();
			em.remove(cmt);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Comments findById(Long cmtId) {
		Comments share = em.find(Comments.class, cmtId);
		return share;
	}

	public List<Comments> findAll() {
		String jpql = "select o from Comments o";
		TypedQuery<Comments> query = em.createQuery(jpql, Comments.class);
		List<Comments> list = query.getResultList();
		return list;
	}
	
}
