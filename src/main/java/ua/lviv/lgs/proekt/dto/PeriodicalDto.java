package ua.lviv.lgs.proekt.dto;

import org.springframework.web.multipart.MultipartFile;

public class PeriodicalDto {
	public String name;
	public String description;
	public Double price;
	public MultipartFile image;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "PeriodicalDto [name=" + name + ", description=" + description + ", price=" + price + ", image=" + image
				+ "]";
	}
	
}
