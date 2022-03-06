package com.thangnnc.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.thangnnc.dto.Report;
import com.thangnnc.entities.Videos;
import com.thangnnc.utils.JpaUtils;

public class VideosDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public VideosDao() {
	}

	@Override
	protected void finalize() throws Throwable {
		em.close(); // Close stream when ending Dao
	}

	public boolean create(Videos video) {
		try {
			em.getTransaction().begin();
			em.persist(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Videos video) {
		try {
			em.getTransaction().begin();
			em.merge(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(String href) {
		try {
			Videos video = findById(href);
			em.getTransaction().begin();
			video.setActive(false);
			em.merge(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean active(String href) {
		try {
			Videos video = findById(href);
			em.getTransaction().begin();
			video.setActive(true);
			em.merge(video);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Videos findById(String href) {
		Videos video = em.find(Videos.class, href);
		return video;
	}

	public List<Videos> findInActive() {
		String jpql = "select o from Videos o where o.active = 0";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		return list;
	}

	public List<Videos> findActive() {
		String jpql = "select o from Videos o where o.active = 1";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		return list;
	}

	public List<Videos> findAll() {
		String jpql = "select o from Videos o";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		return list;
	}

	public List<Videos> findByKeywordInActive(String keyword) {
		String jpql = "select o from Videos o where o.title like ?0 and o.active = 0 order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		query.setParameter(0, "%" + keyword + "%");
		List<Videos> list = query.getResultList();
		return list;
	}

	public List<Videos> findByKeywordActive(String keyword) {
		String jpql = "select o from Videos o where o.title like ?0 and o.active = 1 order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		query.setParameter(0, "%" + keyword + "%");
		List<Videos> list = query.getResultList();
		return list;
	}

	public List<Videos> findByKeyword(String keyword) {
		String jpql = "select o from Videos o where o.title like ?0 order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		query.setParameter(0, "%" + keyword + "%");
		List<Videos> list = query.getResultList();
		return list;
	}
	
	public Videos findByTitle(String title) {
		String jpql = "select o from Videos o where o.title = ?0 order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		query.setParameter(0, title);
		if(query.getResultList().isEmpty()) {
			return null;
		}else return query.getResultList().get(0);
	}

	public List<Videos> findVideoFavorite(String username) {
		String jpql = "select o.videoF from Favorites o where o.userF.username = ?0 and o.videoF.active = 1 order by favoriteDate desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		query.setParameter(0, username);
		List<Videos> list = query.getResultList();
		return list;
	}
	
	public List<Videos> findTop8Feature() {
		String jpql = "select o from Videos o where o.active = 1 order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		List<Videos> result = new ArrayList<Videos>();
		for (int i = 0; i < list.size(); i++) {
			if (i > 7)
				break;
			else
				result.add(list.get(i));
		}
		return result;
	}

	public List<Videos> findTop8New() {
		String jpql = "select o from Videos o where o.active = 1 order by dateUpload desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		List<Videos> result = new ArrayList<Videos>();
		for (int i = 0; i < list.size(); i++) {
			if (i > 7)
				break;
			else
				result.add(list.get(i));
		}
		return result;
	}

	public List<Videos> findTop8Popular() {
		String jpql = "select o.videoL.href from Likes o where o.like = 1 and o.videoL.active = 1  group by o.videoL.href order by count(o.like) desc";
		TypedQuery<String> query = em.createQuery(jpql, String.class);
		List<String> list = query.getResultList();
		
//		List<Videos> list = query.getResultList();
		List<Videos> result = new ArrayList<Videos>();
		int count = 1;
		for (String id : list) {
			if(count > 8) break;
			count++;
			result.add(findById(id));
		}
		return result;
	}
	
	public List<Videos> findTop16Trending() {
		String jpql = "select o from Videos o where o.active = 1  order by views desc";
		TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
		List<Videos> list = query.getResultList();
		List<Videos> result = new ArrayList<Videos>();
		for (int i = 0; i < list.size(); i++) {
			if (i > 15)
				break;
			else
				result.add(list.get(i));
		}
		return result;
	}
	
	public Long findLikeById(String id) {
		String jpql = "select count(o.like) from Likes o where o.like = 1 and o.videoL.href = ?0 group by o.videoL.href";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter(0, id);
		if(query.getResultList().isEmpty()) return 0L;
		else return query.getResultList().get(0);
	}

	public Long findUnlikeById(String id) {
		String jpql = "select count(o.like) from Likes o where o.like = 0 and o.videoL.href = ?0 group by o.videoL.href";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter(0, id);
		if(query.getResultList().isEmpty()) return 0L;
		else return query.getResultList().get(0);
	}

	public List<Report> findFavoriteVideo() {
		String jpql = "select new Report(o.videoF.href, o.videoF.title, count(o.videoF.title), min(o.favoriteDate), max(o.favoriteDate)) from Favorites o "
							+ "group by o.videoF.href, o.videoF.title order by count(o.videoF.title) desc";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		List<Report> list = query.getResultList();
		return list;
	}
	
	
}
