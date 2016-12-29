package com.jcg.examples.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jcg.examples.viewBean.LoginBean;
import com.jcg.examples.viewBean.ReservationBean;


@Controller
public class ReservationController {

	
	@RequestMapping(value="/reservationAction",method=RequestMethod.POST)
	public ModelAndView reserveNumber(HttpServletRequest request, HttpServletResponse response, ReservationBean reservationBean)
	{
		ModelAndView model = new ModelAndView("reservation");
		
		List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		
		reservationList.add(new ReservationBean(reservationBean.getMsisdn(),
				reservationBean.getSsnId(),
				reservationBean.getReservationBy(),
				reservationBean.getReservationDate()));
		reservationList.add(new ReservationBean("044789456","256349-456D","Robot", "20-10-2016 10:50:20"));
		reservationList.add(new ReservationBean("041235896","123093-345B","Robot", "09-06-2016 14:09:00"));
		reservationList.add(new ReservationBean("044589647","3452096-3","Robot", "22-12-2016 16:36:60"));
		
		model.addObject("reservationList", reservationList);
		model.addObject("message", "Reserving " + reservationBean.getMsisdn() + " MSISDN completed successfully");
		
		
		return model;
	}
	
}
