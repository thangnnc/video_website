package com.thangnnc.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.entities.Favorites;
import com.thangnnc.entities.Users;
import com.thangnnc.entities.Videos;
import com.thangnnc.utils.JpaUtils;

public class FavoritesDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public FavoritesDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Favorites favorite) {
		try {
			em.getTransaction().begin();
			em.persist(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Favorites favorite) {
		try {
			em.getTransaction().begin();
			em.merge(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(Long favoriteId) {
		try {
			Favorites favorite = findById(favoriteId);
			em.getTransaction().begin();
			em.remove(favorite);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Favorites findById(Long favoriteId) {
		Favorites favorite = em.find(Favorites.class, favoriteId);
		return favorite;
	}

	public List<Favorites> findAll() {
		String jpql = "select o from Favorites o";
		TypedQuery<Favorites> query = em.createQuery(jpql, Favorites.class);
		List<Favorites> list = query.getResultList();
		return list;
	}

	public void updateFavorite(Videos video, Users user) {
		String jpql = "select o.id from Favorites o where o.userF.username = ?0 and o.videoF.href = ?1";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter(0, user.getUsername());
		query.setParameter(1, video.getHref());
		
		if(query.getResultList().isEmpty()) {
			create(new Favorites(user,video,new Date()));
		}else delete(query.getResultList().get(0));
	}

	public boolean checkFavorite(String username, String videoId) {
		String jpql = "select o.id from Favorites o where o.userF.username = ?0 and o.videoF.href = ?1";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter(0, username);
		query.setParameter(1, videoId);
		
		if(query.getResultList().isEmpty()) {
			return false;
		}else return true;
	}
	
	public Long countFavorite(String href) {
		String jpql = "select count(o) from Favorites o where o.videoF.href = ?0";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter(0, href);
		return query.getResultList().get(0);
	}
}
