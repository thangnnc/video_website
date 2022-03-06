package com.thangnnc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.entities.Shares;
import com.thangnnc.utils.JpaUtils;

public class SharesDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public SharesDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Shares share) {
		try {
			em.getTransaction().begin();
			em.persist(share);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Shares share) {
		try {
			em.getTransaction().begin();
			em.merge(share);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(Long shareId) {
		try {
			Shares share = findById(shareId);
			em.getTransaction().begin();
			em.remove(share);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Shares findById(Long shareId) {
		Shares share = em.find(Shares.class, shareId);
		return share;
	}

	public List<Shares> findAll() {
		String jpql = "select o from Shares o";
		TypedQuery<Shares> query = em.createQuery(jpql, Shares.class);
		List<Shares> list = query.getResultList();
		return list;
	}
	
	public List<Shares> findShareByTitle(String title) {
		String jpql = "select o from Shares o where o.videoS.title = ?0";
		TypedQuery<Shares> query = em.createQuery(jpql, Shares.class);
		query.setParameter(0, title);
		List<Shares> list = query.getResultList();
		return list;
	}

}
