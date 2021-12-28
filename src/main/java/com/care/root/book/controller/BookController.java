package com.care.root.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.book.service.BookService;

@Controller
public class BookController {
	@Autowired BookService bs;
	@GetMapping("/bookMain")
	public String bookMain(Model model) {
		
		
		return "book/bookMain";
	}
	
	@GetMapping("/seat")
	public String seat(Model model,
			@RequestParam String i,
			@RequestParam String title,
			@RequestParam String time,
			@RequestParam String theater) throws Exception{
		
		model.addAttribute("i", i); //날짜
		model.addAttribute("title", title); //제목
		model.addAttribute("time", time); //시간
		model.addAttribute("theater",theater); // 관 
		
		System.out.println("날짜: "+i);
		System.out.println("제목: "+title);
		System.out.println("시간: "+time);
		model.addAttribute("code",bs.seat(title,i,time));
		return "book/seat";
	}
	
	@RequestMapping(value="payment", method = RequestMethod.GET)
	public String payment(Model model, String title, String time, String theater,
							String i, String ticketNumber, String selectedSeat,
<<<<<<< HEAD
							String payMoney) {	
		System.out.println("title: "+title);
		System.out.println("time: "+time);
		System.out.println("theater: "+theater);
		System.out.println("i: "+i);
		System.out.println("ticketNumber: "+ticketNumber);
		System.out.println("selectedSeat: "+selectedSeat);
		System.out.println("payMoney: "+payMoney);
		
		
		bs.payment(i, title, time, theater, selectedSeat,payMoney);
		
		
		
=======
							String payMoney) {		
		bs.payment(i, title, time, theater, selectedSeat);
>>>>>>> 9892a626718e0c6c491c8fd224a5975e325ec51e
		return "book/payment";
	}
}
