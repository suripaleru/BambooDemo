package com.jcg.examples.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jcg.examples.delegate.LoginDelegate;
import com.jcg.examples.viewBean.LoginBean;
import com.jcg.examples.viewBean.ReservationBean;


@Controller
public class LoginController
{
		@Autowired
		private LoginDelegate loginDelegate;

		@RequestMapping(value={"/login", "/"},method=RequestMethod.GET)
		public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response, LoginBean loginBean)
		{
			ModelAndView model = new ModelAndView("login");
			//LoginBean loginBean = new LoginBean();
			model.addObject("loginBean", loginBean);
			return model;
		}
		@RequestMapping(value={"/login", "/"},method=RequestMethod.POST)
		public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean)
		{
				ModelAndView model= null;
				try
				{
						/*boolean isValidUser = loginDelegate.isValidUser(loginBean.getUsername(), loginBean.getPassword());
						if(isValidUser)
						{*/
								System.out.println("User Login Successful");
								request.setAttribute("loggedInUser", loginBean.getUsername());
								model = new ModelAndView("reservation");
								
								List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
								
								reservationList.add(new ReservationBean("044789456","256349-456D","Robot", "20-10-2016 10:50:20"));
								reservationList.add(new ReservationBean("041235896","123093-345B","Robot", "09-06-2016 14:09:00"));
								reservationList.add(new ReservationBean("044589647","3452096-3","Robot", "22-12-2016 16:36:60"));
								
								model.addObject("reservationBean", new ReservationBean());
								model.addObject("reservationList", reservationList);
								model.addObject("message", loginBean.getUsername() != null ? "Welcome "+loginBean.getUsername() : "");
								
						/*}
						else
						{
								model = new ModelAndView("login");
								request.setAttribute("message", "Invalid credentials!!");
						}*/

				}
				catch(Exception e)
				{
						e.printStackTrace();
				}

				return model;
		}
}
