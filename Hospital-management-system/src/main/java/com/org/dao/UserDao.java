package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.User;

public class UserDao {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	public void saveUser(User user) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(user);
		et.commit();
	}
	public User loginUser(String email,String password) {
		User u=null;
		EntityManager em=emf.createEntityManager();
		
		String jpql="Select s from User s where s.email=?1 and s.password=?2";
		Query query = em.createQuery(jpql);
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<User> list = query.getResultList();
		if(list.size() != 0) {
			u=list.get(0);
		}
		
		return u;
	}
	public User fetchById(int id) {
		EntityManager em=emf.createEntityManager();
		User user = em.find(User.class, id);
		return user;
	}
	public List<User> fetchAllUser(){
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from User s");
		List<User> list = query.getResultList();
		return list;
	}
	public User fetchByPassword(String password) {
		User u=null;
		EntityManager em=emf.createEntityManager();
		
		String jpql="Select s from User s where s.password=?2";
		Query query = em.createQuery(jpql);
		query.setParameter(2, password);
		
		List<User> list = query.getResultList();
		if(list.size() != 0) {
			u=list.get(0);
		}
		
		return u;
	}
}
