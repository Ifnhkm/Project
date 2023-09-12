/**
 *
 * 
 */
package model;

public class Reservation implements java.io.Serializable {
    
    private int reservationid;
    private int userid;
    private String email;
    private String date;
    private String time;
    private String room;
    private String status;

    public Reservation() {
    }

    public Reservation(int reservationid, String email, String date, String time, String room, String status) {
        this.reservationid = reservationid;
        this.email = email;
        this.date = date;
        this.time = time;
        this.room = room;
        this.status = status;
    }
    
    
    
    public int getReservationid() {
        return reservationid;
    }

    public void setReservationid(int reservationid) {
        this.reservationid = reservationid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    

}