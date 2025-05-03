package com.luxhav.model;

public class Reservation {
    private int reservationId;
    private int userId;
    private int roomId;
    private String checkInDate;
    private String checkOutDate;
    private String status;
    private String createdAt;

    // View-only fields
    private String guestName;
    private String roomNumber;
    private String roomType;
    
	public int getReservationId() {
		return reservationId;
	}
	public int getUserId() {
		return userId;
	}
	public int getRoomId() {
		return roomId;
	}
	public String getCheckInDate() {
		return checkInDate;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public String getStatus() {
		return status;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getGuestName() {
		return guestName;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
}