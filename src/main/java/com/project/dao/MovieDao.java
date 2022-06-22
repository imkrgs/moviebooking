package com.project.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import static org.jsoup.Jsoup.connect;

import com.google.gson.Gson;
import com.project.entity.Movie;
import com.project.entity.MovieInShow;

@Component
public class MovieDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	public List<Movie> getMovieInTheather(){
		List<Movie> movielist = new ArrayList<>();
		try {
		Document doc = connect("https://www.imdb.com/showtimes/location?ref_=inth_mny_sm").get();
		List<String> movie_id;
		Elements temp = doc.select("a").select("img");
		movie_id = temp.eachAttr("data-tconst");
		for (String s : movie_id) {
			String url = "http://www.omdbapi.com/?i=" + s + "&apikey=852159f0";
			Document doc_temp = connect(url).ignoreContentType(true).get();
			String split = doc_temp.getElementsByTag("body").text().replace("\\s+", "+");
	        Map<String, String> map = new Gson().fromJson(split, new HashMap<>().getClass());
			Movie m = new Movie();
			m.setActors(map.get("Actors"));
			m.setBoxOffice(map.get("BoxOffice"));
			m.setDirector(map.get("Director"));
			m.setGenre(map.get("Genre"));
			m.setImdbID(map.get("imdbID"));
			m.setImdbRating(map.get("imdbRating"));
			m.setImdbVotes(map.get("imdbVotes"));
			m.setLanguage(map.get("Language"));
			m.setPlot(map.get("Plot"));
			m.setPoster(map.get("Poster"));
			m.setRated(map.get("Rated"));
			m.setReleased(map.get("Released"));
			m.setRuntime(map.get("Runtime"));
			m.setTitle(map.get("Title"));
			m.setWriter(map.get("Writer"));
			m.setYear(map.get("Year"));
			m.setType("in_theater");
			movielist.add(m);
		}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return movielist;
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> getUpcomingMovie() {
		List<Movie> movielist = new ArrayList<>();
		try {
		 Document doc = connect("https://www.imdb.com/trailers/?ref_=hm_hp_sm").get();
	        List<String> movie_id = new ArrayList<>();
	        for (Element img : doc.select("a.ipc-poster-card__title")) {
	            String loc = img.attr("href").split("\\/", -1)[2].split("\\?")[0];
	            movie_id.add(loc);
	        }
		for (String s : movie_id) {
			String url = "http://www.omdbapi.com/?i=" + s + "&apikey=852159f0";
			Document doc_temp = connect(url).ignoreContentType(true).get();
			String split = doc_temp.getElementsByTag("body").text().replace("\\s+", "+");
	        Map<String, String> map = new Gson().fromJson(split, new HashMap<>().getClass());
			Movie m = new Movie();
			m.setActors(map.get("Actors"));
			m.setBoxOffice(map.get("BoxOffice"));
			m.setDirector(map.get("Director"));
			m.setGenre(map.get("Genre"));
			m.setImdbID(map.get("imdbID"));
			m.setImdbRating(map.get("imdbRating"));
			m.setImdbVotes(map.get("imdbVotes"));
			m.setLanguage(map.get("Language"));
			m.setPlot(map.get("Plot"));
			m.setPoster(map.get("Poster"));
			m.setRated(map.get("Rated"));
			m.setReleased(map.get("Released"));
			m.setRuntime(map.get("Runtime"));
			m.setTitle(map.get("Title"));
			m.setWriter(map.get("Writer"));
			m.setYear(map.get("Year"));
			m.setType("upcoming");
			movielist.add(m);
		}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return movielist;
	}
	
	public List<MovieInShow> getInTheater(){
		List<MovieInShow> list = new ArrayList<MovieInShow>();
		for(MovieInShow m :hibernateTemplate.loadAll(MovieInShow.class)) {
			if (m.getPoster().equals("N/A")) continue;
			if (m.getStatus().equals("enable"))list.add(m);
		}
		return list;
	}
	
	public List<Movie> getupcoming(){
		List<Movie> list = new ArrayList<Movie>();
		for(Movie m :hibernateTemplate.loadAll(Movie.class)) {
			if (m.getPoster().equals("N/A")) continue;
			else if (m.getType().equals("upcoming"))
				list.add(m);
		}
		return list;
	}
	
    public Map<String, String> getmovie(String movie_id) throws IOException {
        Document doc = connect("http://www.omdbapi.com/?i=" + movie_id + "&apikey=852159f0").ignoreContentType(true).get();
        String split = "";
        for (Element img : doc.getElementsByTag("body")) {
            split = img.text().replace("\\s+", "+");
        }
        @SuppressWarnings("unchecked")
		Map<String, String> map = new Gson().fromJson(split, new HashMap<>().getClass());
        return map;
    }
	
    public HashMap<String, String> getsimilarmovie(String movie_id) throws IOException {
        Document doc = connect("https://www.imdb.com/title/" + movie_id + "/?ref_=nv_sr_srsg_0").get();
        HashMap<String, String> movie = new HashMap<>();
        int count = 0;
        for (Element e : doc.getElementsByAttributeValueContaining("aria-label", "View title page for")) {
            if (count == 1) {
                count--;
                continue;
            }
            String tmn = e.attr("aria-label").replaceAll("View title page for", "");
            String tmi = doc.getElementsByAttributeValueContaining("alt", tmn).attr("src");
            movie.put(tmn, tmi);
            count++;
        }
        return movie;
    }
    
    public ArrayList<Map<String, String>> searchresult(String movie_name) throws IOException {
        Document doc = connect("http://www.omdbapi.com/?s=" + movie_name + "&apikey=852159f0").ignoreContentType(true).get();
        String split = "";
        for (Element img : doc.getElementsByTag("body")) {
            split = img.text().replace("\\s+", "+").split("\\:", 2)[1].split(",\"totalResults\"", -1)[0];
        }
        @SuppressWarnings("unchecked")
		ArrayList<Map<String, String>> list = new Gson().fromJson(split, new ArrayList<>().getClass());
        return list;
    }
    
    public int rlen(String movie_name) throws IOException {
        String url = "http://www.omdbapi.com/?s=" + movie_name + "&apikey=852159f0";
        Document doc = connect(url).ignoreContentType(true).get();
        int movie_id_list = 0;
        String[] split;
        for (Element img : doc.select("body")) {
            if (!img.text().contains("Error")) {
                split = img.text().split("\"imdbID\":");
                movie_id_list = split.length;
            }
        }
        return movie_id_list;
    }
    
    @Transactional
	public MovieInShow bookMovie(String id){
		MovieInShow movie = hibernateTemplate.getSessionFactory().getCurrentSession().get(MovieInShow.class,id);
		return movie;
	}
}
