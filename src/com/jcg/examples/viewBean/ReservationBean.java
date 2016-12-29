package com.jcg.examples.viewBean;

import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

public class ReservationBean {

	private String msisdn;
	private String ssnId;
	private String reservationDate;
	private String reservationBy;
	
	
	public ReservationBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationBean(String msisdn, String ssnId,
			String reservationDate, String reservationBy) {
		super();
		this.msisdn = msisdn;
		this.ssnId = ssnId;
		this.reservationDate = reservationDate;
		this.reservationBy = reservationBy;
	}

	public String getMsisdn() {
		return msisdn;
	}


	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}


	public String getSsnId() {
		return ssnId;
	}


	public void setSsnId(String ssnId) {
		this.ssnId = ssnId;
	}


	public String getReservationDate() {
		return reservationDate;
	}


	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}


	public String getReservationBy() {
		return reservationBy;
	}


	public void setReservationBy(String reservationBy) {
		this.reservationBy = reservationBy;
	}	
}
