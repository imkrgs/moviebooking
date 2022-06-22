package com.project.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.project.entity.*;

@Component
public class UserDao {
	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public int verifyUser(user u) {
		user a = hibernateTemplate.getSessionFactory().getCurrentSession().get(user.class, u.getUserid());
		if (a == null ) return 0;
		else if (a.equals(u))
			return 1;
		return 0;
	}
	
	@Transactional
	public void bookingConfirmed(MovieInShow m , String userid) {
		userBooking u = new userBooking();
		u.setGenre(m.getGenre());
		u.setImdbID(m.getImdbID());
		u.setLanguage(m.getLanguage());
		u.setPlot(m.getPlot());
		u.setPoster(m.getPoster());
		u.setPrice(m.getPrice());
		u.setShowTime(m.getShowTime());
		u.setTitle(m.getTitle());
		u.setUser(userid);
		u.setDate(new Date());
		hibernateTemplate.save(u);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Transactional
	public List<userBooking> bookedMovie(String user){
		return (List<userBooking>) hibernateTemplate.find("from userBooking b where b.user='"+user+"'");
	}
	
	@Transactional
	public int saveUser(user u) {
		user u1 = hibernateTemplate.getSessionFactory().getCurrentSession().find(user.class,u.getUserid());
		if (u1 == null ) {
			hibernateTemplate.save(u);
			return 0;
		}
		return 1 ;
	}
}
