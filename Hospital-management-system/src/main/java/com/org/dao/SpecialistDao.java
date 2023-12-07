package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.Specialist;

public class SpecialistDao {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	public List<Specialist> getAllSpecialist(){
		EntityManager em=emf.createEntityManager();
		String jpql="Select s from Specialist s";
		Query query = em.createQuery(jpql);
		List<Specialist> list = query.getResultList();
		
		
		
		return list;
	}
	public int countSpecialist() {
		int count=0;
		EntityManager em=emf.createEntityManager();
		String jpql="Select s from Specialist s";
		Query query = em.createQuery(jpql);
		List<Specialist> list = query.getResultList();
		for(int i=0;i<list.size();i++) {
			count++;
		}
		return count;
	}
}
