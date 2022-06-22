package com.project.entity;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="movieinshow")
public class MovieInShow {
	
	private String Title;
	private String Genre;
	private String Plot;
	private String Language;
	private String Poster;
	@Id
	private String imdbID;
	private int price;
	private String showTime;
	private String status;
	
	
	
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getPlot() {
		return Plot;
	}
	public void setPlot(String plot) {
		Plot = plot;
	}
	public String getLanguage() {
		return Language;
	}
	public void setLanguage(String language) {
		Language = language;
	}
	public String getPoster() {
		return Poster;
	}
	public void setPoster(String poster) {
		Poster = poster;
	}
	public String getImdbID() {
		return imdbID;
	}
	public void setImdbID(String imdbID) {
		this.imdbID = imdbID;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getShowTime() {
		return showTime;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MovieInShow [Title=" + Title + ", Genre=" + Genre + ", Plot=" + Plot + ", Language=" + Language
				+ ", Poster=" + Poster + ", imdbID=" + imdbID + ", price=" + price + ", showTime=" + showTime + "]";
	}
	
	public MovieInShow(String title, String genre, String plot, String language, String poster, String imdbID,
			int price, String showTime, String status) {
		super();
		Title = title;
		Genre = genre;
		Plot = plot;
		Language = language;
		Poster = poster;
		this.imdbID = imdbID;
		this.price = price;
		this.showTime = showTime;
		this.status = status;
	}
	public MovieInShow() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		return Objects.hash(Genre, Language, Plot, Poster, Title, imdbID, price, showTime);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MovieInShow other = (MovieInShow) obj;
		return Objects.equals(Genre, other.Genre) && Objects.equals(Language, other.Language)
				&& Objects.equals(Plot, other.Plot) && Objects.equals(Poster, other.Poster)
				&& Objects.equals(Title, other.Title) && Objects.equals(imdbID, other.imdbID) && price == other.price
				&& showTime == other.showTime;
	}
	

}
