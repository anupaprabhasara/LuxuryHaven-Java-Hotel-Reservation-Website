package com.luxhav.model;

public class Room {
	private int roomId;
    private String roomNumber;
    private String roomType;
    private double pricePerNight;
    private String status;
    
	public int getRoomId() {
		return roomId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public String getRoomType() {
		return roomType;
	}
	public double getPricePerNight() {
		return pricePerNight;
	}
	public String getStatus() {
		return status;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public void setPricePerNight(double pricePerNight) {
		this.pricePerNight = pricePerNight;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}