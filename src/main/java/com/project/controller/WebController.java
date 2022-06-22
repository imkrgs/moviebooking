package com.project.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.*;
import com.project.entity.*;

@Controller
public class WebController {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Autowired
	AdminDao admindao;

	@Autowired
	UserDao userdao;

	@Autowired
	MovieDao moviedao;

	@RequestMapping("/")
	public String index(Model m) {
		return "home";
	}

	@RequestMapping("/home")
	public String home(Model m) {
		m.addAttribute("inTheaterMovie", moviedao.getInTheater());
		m.addAttribute("upcoming", moviedao.getupcoming());
		return "home";
	}

	@RequestMapping("/updateDB")
	public String updateDB() {

		try {
			admindao.updateDB();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "updateDB";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/adminloginresponse")
	public String adminloginresponse(HttpServletRequest request, HttpServletResponse response) {

		admin admin = new admin(request.getParameter("username"), request.getParameter("password"));
		System.out.println(admin);

		int result = admindao.verifyAdmin(admin);
		System.out.println(result);
		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("current-admin", admin);
			return "adminloginresponse";
		} else {
			HttpSession session = request.getSession();
			message m = new message();
			m.setContent("Please check your admin password or admin Id  !!! ");
			m.setType("danger");
			session.setAttribute("message", m);
		}
		return "adminlogin";
	}

	@RequestMapping("/loginresponse")
	public String loginresponse(HttpServletRequest request, HttpServletResponse response) {

		user u = new user(request.getParameter("username"), request.getParameter("password"));
		int result = userdao.verifyUser(u);
		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("current-user", u);
			return "loginresponse";
		} else {
			HttpSession session = request.getSession();
			message m = new message();
			m.setContent("Please check your user password or username !!! ");
			m.setType("danger");
			session.setAttribute("message", m);
		}
		return "login";
	}

	@RequestMapping("/admindashboard")
	public String adminlogin(Model m) {
		m.addAttribute("mstatus", admindao.getMovieStatus());
		m.addAttribute("gtoadd", admindao.genreToAdd());
		return "admindashboard";
	}

	@RequestMapping("/adminlogin")
	public String admin(Model m) {
		return "adminlogin";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "logout";
	}

	@RequestMapping("/adminlogout")
	public String adminlogout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "adminlogout";
	}

	@RequestMapping("/seatbooking")
	public String seatbooking(@RequestParam("movieId") String id, Model m) {
		m.addAttribute("mshow", moviedao.bookMovie(id));
		return "seatbooking";
	}

	@RequestMapping("/bookingstatus")
	public String bookingstatus(@RequestParam("movieId") String id, Model m) {
		m.addAttribute("mshow", moviedao.bookMovie(id));
		m.addAttribute("date", new Date());
		return "bookingstatus";
	}

	@RequestMapping("/booking")
	public String booking(@RequestParam("userid") String userid, Model m, HttpSession session) {
		if (userid == null) {
			message me = new message();
			me.setContent("Please Login Before Accessing Bookings !!! ");
			me.setType("danger");
			session.setAttribute("message", me);
			m.addAttribute("inTheaterMovie", moviedao.getInTheater());
			m.addAttribute("upcoming", moviedao.getupcoming());
			return "home";
		}
		m.addAttribute("bookedmovie", userdao.bookedMovie(userid));
		return "booking";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/signupresponse")
	public String signupresponse(HttpServletRequest request, HttpServletResponse response) {
		String id =request.getParameter("username");
		String p1 =request.getParameter("password1");
		String p2 =request.getParameter("password2");
		if (p1.equals(p2)) {
			user u = new user(id,p1);
			int result = userdao.saveUser(u);
			System.out.println(result);
			if (result == 0 ) {
				message me = new message();
				me.setContent("User Added Successfully  !!! ");
				me.setType("success");
				request.getSession().setAttribute("message", me);
				return "signupresponse";
			}
			else {
				message me = new message();
				me.setContent("User was not added  !!! ");
				me.setType("danger");
				request.getSession().setAttribute("message", me);
				return "signup";
			}
		}
		message me = new message();
		me.setContent("both password does't match try again   !!! ");
		me.setType("danger");
		request.getSession().setAttribute("message", me);
		return "signup";
	}

	@RequestMapping("/carddetails")
	public String carddetails(@RequestParam("movieId") String id, @RequestParam("userid") String userid, Model m) {
		MovieInShow movie = moviedao.bookMovie(id);
		m.addAttribute("mshow", movie);
		userdao.bookingConfirmed(movie, userid);
		return "carddetails";
	}

	@RequestMapping("/single")
	public String single(@RequestParam("movieId") String id, Model m) {

		try {
			m.addAttribute("movie", moviedao.getmovie(id));
			m.addAttribute("smovie", moviedao.getsimilarmovie(id));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "single";
	}

	@RequestMapping("/search")
	public String search(@RequestParam("movie-name") String mname, Model m) {
		try {
			m.addAttribute("movie", moviedao.searchresult(mname));
			if (moviedao.rlen(mname) > 2)
				return "choice";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "noresult";
	}

	@RequestMapping("/changestatus")
	public String changestatus(@RequestParam("movieId") String id, Model m) {
		admindao.changeStatus(id);
		m.addAttribute("mstatus", admindao.getMovieStatus());
		return "admindashboard";
	}

	@RequestMapping("/removegenre")
	public String removegenre(@RequestParam("movieId") String id, Model m) {
		admindao.removeGenre(id);
		m.addAttribute("mstatus", admindao.getMovieStatus());
		m.addAttribute("gtoadd", admindao.genreToAdd());
		return "admindashboard";
	}

	@RequestMapping("/addgenre")
	public String addgenre(@RequestParam("genre") String genre, Model m) {
		admindao.addGenre(genre);
		m.addAttribute("mstatus", admindao.getMovieStatus());
		m.addAttribute("gtoadd", admindao.genreToAdd());
		return "admindashboard";
	}

	@RequestMapping("/editmovie")
	public String editmovie(@RequestParam("movieId") String id, Model m) {
		MovieInShow movie = moviedao.bookMovie(id);
		m.addAttribute("movie", movie);
		return "editmovie";
	}

	@RequestMapping(value = "/updatedetails", method = RequestMethod.POST)
	public String updatedetails(@RequestParam(required = false, name = "mid") String imdbID,
			@RequestParam("name") String title, @RequestParam("language") String language,
			@RequestParam("price") String price, @RequestParam("plot") String plot,
			@RequestParam(required = false, name = "genre") String genre, @RequestParam("time") String showTime,
			@RequestParam("poster") String poster, @RequestParam("status") String status, Model m) {
		MovieInShow movie = new MovieInShow(title, genre, plot, language, poster, imdbID, Integer.parseInt(price),
				showTime, status);
		System.out.println(movie);
		admindao.updateMovie(movie);
		m.addAttribute("mstatus", admindao.getMovieStatus());
		m.addAttribute("gtoadd", admindao.genreToAdd());
		return "admindashboard";
	}

}
