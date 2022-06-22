package com.project.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.project.entity.Movie;
import com.project.entity.MovieInShow;
import com.project.entity.admin;

@Component
public class AdminDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Autowired
	MovieDao moviedao;

	@Transactional
	public void updateDB() throws IOException {

		List<Movie> mdao1 = moviedao.getMovieInTheather();
		for (Movie m : mdao1) {
			if (!(m.getImdbID() == null)) {
				hibernateTemplate.merge(m);
			}
		}
		List<Movie> mdao2 = moviedao.getUpcomingMovie();
		for (Movie m : mdao2) {
			if (!(m.getImdbID() == null)) {
				hibernateTemplate.merge(m);
			}
		}
	}

	@Transactional
	public int verifyAdmin(admin admin) {
		admin a = hibernateTemplate.getSessionFactory().getCurrentSession().get(admin.class, admin.getUserid());
		if (a == null ) return 0;
		else if (a.equals(admin))
			return 1;
		return 0;
	}

	public List<MovieInShow> getMovieStatus() {
		return hibernateTemplate.loadAll(MovieInShow.class);
	}

	@Transactional
	public void changeStatus(String id) {
		MovieInShow m = moviedao.bookMovie(id);
		String status = m.getStatus();
		if (status.equals("enable"))
			m.setStatus("disable");
		else
			m.setStatus("enable");
		hibernateTemplate.saveOrUpdate(m);
	}

	@Transactional
	public void removeGenre(String id) {
		MovieInShow m = moviedao.bookMovie(id);
		hibernateTemplate.delete(m);
	}

	
	@SuppressWarnings("deprecation")
	@Transactional
	public List<Movie> genreToAdd() {
		@SuppressWarnings("unchecked")
		List<Movie> m1 = (List<Movie>) hibernateTemplate.find("from Movie m where m.type='"+"in_theater'");
		List<MovieInShow> m2 = hibernateTemplate.loadAll(MovieInShow.class);
		List<Movie> result = new ArrayList<Movie>();
		boolean flag = false;
		for (Movie m : m1) {
			for (MovieInShow t : m2) {
				if (m.getImdbID().equals(t.getImdbID())) {
					flag = true;
				}
			}
			if(!flag) result.add(m);
		}
		return result;
	}
	
	@Transactional
	public void addGenre(String id) {
		Movie m = hibernateTemplate.load(Movie.class,id);
		MovieInShow nmovie = new MovieInShow();
		nmovie.setImdbID(m.getImdbID());
		nmovie.setGenre(m.getGenre());
		nmovie.setLanguage(m.getLanguage());
		nmovie.setPlot(m.getPlot());
		nmovie.setPoster(m.getPoster());
		nmovie.setPrice(320);
		nmovie.setShowTime("1645");
		nmovie.setStatus("enable");
		nmovie.setTitle(m.getTitle());
		hibernateTemplate.saveOrUpdate(nmovie);
	}
	
	@Transactional
	public void updateMovie(MovieInShow movie) {
		hibernateTemplate.update(movie);
	}

}
