package com.care.root.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.book.dto.MovieInfoDTO;
import com.care.root.mybatis.book.BookInfoMapper;
import com.care.root.mybatis.book.BookMapper;

@Service
public class BookServiceImpl implements BookService{
	@Autowired BookMapper mapper;
	@Autowired BookInfoMapper bmapper;
	
	@Override
	public List<MovieInfoDTO> movieDay(String title) {
		return mapper.movieDay(title);
	}

	@Override
	public void payment(String i, String title, String time, int theater, String selectedSeat,String payMoney,String pn) {
		
		
		
		String seat = selectedSeat;
		mapper.payment(i,seat,title,time,theater,payMoney,pn);
	}

	@Override
	public void getBookList(Model model, String pn) {
		// TODO Auto-generated method stub
		model.addAttribute("bookList", bmapper.getBookInfo(pn));
	}
		
	@Override
	public void seat(String writer, Model model) {
		model.addAttribute("member",mapper.seat(writer));
		}

	@Override
	public List<MovieInfoDTO> movieList() {
		// TODO Auto-generated method stub
		return mapper.movieList();
	}

	@Override
	public void cancel(String title, int days, String times, int theater, String seats) {
		// TODO Auto-generated method stub
		bmapper.cancel(title, days, times, theater, seats);
	}

	@Override
	public void seatconfirm(String title, String days, String times, Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("booklist", bmapper.seatconfirm(title,days,times));
	}
	public void seatInfo(String title,int i,String time,Model model) {
		
		//model.addAttribute("List",bmapper.seatconfirm(title,i,time));
	}
}