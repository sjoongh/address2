package com.example.address.comtroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.address.dao.AddressBookDao;
import com.example.address.dao.AddressBookDaoImpl;
import com.example.address.vo.AddressVo;



@WebServlet("/ad")
public class AddressBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		
		if ("form".equals(actionName)) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/address/form.jsp");
			rd.forward(req, resp);
		} else {
			AddressBookDao dao = new AddressBookDaoImpl();
			List<AddressVo> list = dao.getList();
			req.setAttribute("list", list);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/address/index.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		
		if ("add".equals(actionName)) {
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String tel = req.getParameter("tel");
			
			AddressVo vo = new AddressVo();
			vo.setName(name);
			vo.setHp(hp);
			vo.setTel(tel);
			
			AddressBookDao dao = new AddressBookDaoImpl();
			int insertedCount = dao.insert(vo); 
			
			resp.sendRedirect(req.getContextPath() + "/ad");
//		} else if ("delete".equals(actionName)) {
//			Long no = Long.valueOf(req.getParameter("no"));
//			
//			AddressBookDao dao = new AddressBookDaoImpl();
//			int deletedCount = dao.delete(no);
//			
			resp.sendRedirect(req.getContextPath() + "/ad");
		} else {
			doGet(req, resp);
		}
	}
	

}
