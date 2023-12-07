package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.Doctor;

public class Edit_Doctor_Dao {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	public List<Doctor> fetchDoctor(int id) {
		
		EntityManager em=emf.createEntityManager();
		String jpql="select s from Doctor s where s.id=?1";
		Query query = em.createQuery(jpql);
		query.setParameter(1, id);
		List<Doctor> list = query.getResultList();
		
		
		return list;
	}
}
