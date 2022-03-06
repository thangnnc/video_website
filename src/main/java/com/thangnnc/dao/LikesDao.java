package com.thangnnc.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.entities.Likes;
import com.thangnnc.entities.Users;
import com.thangnnc.entities.Videos;
import com.thangnnc.utils.JpaUtils;

public class LikesDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public LikesDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Likes like) {
		try {
			em.getTransaction().begin();
			em.persist(like);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Likes like) {
		try {
			em.getTransaction().begin();
			em.merge(like);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(Long likeId) {
		try {
			Likes like = findById(likeId);
			em.getTransaction().begin();
			em.remove(like);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Likes findById(Long likeId) {
		Likes like = em.find(Likes.class, likeId);
		return like;
	}

	public List<Likes> findAll() {
		String jpql = "select o from Likes o";
		TypedQuery<Likes> query = em.createQuery(jpql, Likes.class);
		List<Likes> list = query.getResultList();
		return list;
	}

	public Likes findByUsernameAndVideoId(String username, String videoId) {
		String jpql = "select o from Likes o where o.userL.username = ?0 and o.videoL.href = ?1";
		TypedQuery<Likes> query = em.createQuery(jpql, Likes.class);
		query.setParameter(0, username);
		query.setParameter(1, videoId);
		Likes list = query.getResultList().get(0);
		return list;
	}

	public void updateLike(Videos video, Users user, boolean like) {
		String jpql = "select o.like from Likes o where o.userL.username = ?0 and o.videoL.href = ?1";
		TypedQuery<Boolean> query = em.createQuery(jpql, Boolean.class);
		query.setParameter(0, user.getUsername());
		query.setParameter(1, video.getHref());
		if (query.getResultList().isEmpty()) {
			create(new Likes(user, video, like, new Date()));
		} else {
			Likes likes = findByUsernameAndVideoId(user.getUsername(),video.getHref());
			if(query.getResultList().get(0) == null) {
				likes.setLike(like);
				likes.setLikeDate(new Date());
			}else if (query.getResultList().get(0) != like) {
				likes.setLike(like);
				likes.setLikeDate(new Date());
			} else if (query.getResultList().get(0) == like) {
				likes.setLike(null);
				likes.setLikeDate(null);
			}
			update(likes);
		}
	}

	public Boolean checkLike(String username, String videoId) {
		String jpql = "select o.like from Likes o where o.userL.username = ?0 and o.videoL.href = ?1";
		TypedQuery<Boolean> query = em.createQuery(jpql, Boolean.class);
		query.setParameter(0, username);
		query.setParameter(1, videoId);

		if (query.getResultList().isEmpty()) {
			return null;
		} else
			return query.getResultList().get(0);
	}
}
