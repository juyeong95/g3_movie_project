package com.care.root.oneOnOneBoard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.common.session.SessionName;
import com.care.root.mybatis.member.MemberMapper;
import com.care.root.mybatis.oneOnOneBoard.OneOnOneBoardMapper;
import com.care.root.oneOnOneBoardDTO.OneOnOneBoardDTO;

@Service
public class OneOnOneBoardServiceImpl implements OneOnOneBoardService{
	@Autowired OneOnOneBoardMapper mapper;
	@Autowired MemberMapper mmapper;
	@Autowired checkMessage cm;

	public void allList(HttpSession session,Model model) {
		model.addAttribute("List",mmapper.getMember((String)session.getAttribute(SessionName.LOGIN)));
	}


	@Override
	public String saved(HttpServletRequest request) {
		// TODO Auto-generated method stub
		OneOnOneBoardDTO dto = new OneOnOneBoardDTO();
		int result = 0;
	      String msg, url;
	      try {
	    	  result = mapper.save(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	      if(result == 1) {
	         msg = "문의 메일을 보냈습니다.";
	         url = "/service/mainService";
	      }else {
	         msg = "문제가 발생되었습니다.";
	         url = "/service/oneOnOneQna";
	      }
	      return cm.getMessage(request, msg, url);
	}
}
