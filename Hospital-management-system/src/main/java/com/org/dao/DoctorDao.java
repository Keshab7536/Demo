package com.org.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.Appointment;
import com.org.dto.Doctor;
import com.org.dto.User;

public class DoctorDao {
	
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	public Doctor addDoctor(Doctor d) {
		
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.merge(d);
		et.commit();
		
		return d;
	}
	public List<Doctor> getAllDetails(){
//		List<Doctor>list=new ArrayList<Doctor>();
//		Doctor dr=null;
		EntityManager em=emf.createEntityManager();
		String jpql="select s from Doctor s";
		Query query = em.createQuery(jpql);
		List<Doctor> list = query.getResultList();
		
//		for(Doctor d:list) {
//			dr=new Doctor();
//			dr.setId(d.getId());
//			dr.setName(d.getName());
//			dr.setDob(d.getDob());
//			dr.setQal(d.getSpecialist());
//			dr.setSpecialist(d.getSpecialist());
//			dr.setEmail(d.getEmail());
//			dr.setMobile(d.getMobile());
//			dr.setPassword(d.getPassword());
//			list.add(dr);
//		}
		
		return list;
	}
	public Doctor loginDoctor(String email,String password) {
		Doctor d=null;
		EntityManager em=emf.createEntityManager();
		
		String jpql="Select s from Doctor s where s.email=?1 and s.password=?2";
		Query query = em.createQuery(jpql);
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<Doctor> list = query.getResultList();
		if(list.size() != 0) {
			d=list.get(0);
		}
		
		return d;
	}
	public Doctor fetchById(int id){
		EntityManager em=emf.createEntityManager();
		Doctor doctor = em.find(Doctor.class, id);
		
		
		
		return doctor;
	}
         public Doctor updateDoctor(Doctor dr) {
		
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		
		
		et.begin();
		em.merge(dr);
		et.commit();
		
		return dr;
	}
	public boolean deleteById(int id) {
		boolean f=false;
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		String jpql="select s from Appointment s where doctor_id=?1";
		Query query = em.createQuery(jpql);
		query.setParameter(1, id);
		Doctor doctor = em.find(Doctor.class, id);
		List<Appointment> list = query.getResultList();
		et.begin();
		for(Appointment ap:list) {
			
			em.remove(ap);
			
			f=true;
		}
		em.remove(doctor);
		et.commit();
		
		return f;
	}
	
	
}
