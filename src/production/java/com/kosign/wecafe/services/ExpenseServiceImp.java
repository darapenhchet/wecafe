package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Expense;
import com.kosign.wecafe.entities.ExpenseDetail;
import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ExpenseForm;

import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@Service
public class ExpenseServiceImp implements ExpenseService {
	@Inject UserService userService;
	@Autowired SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Expense> listAllExpense() {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM Expense");
			List<Expense>	expense = (List<Expense>)query.list();	
			return expense;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}

	@Override
	@Transactional
	public List<ExpenseDetail> listExpenseDetail(Long id) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ExpenseDetail where expense_id=" + id);
			List<ExpenseDetail>	expensedetail = (List<ExpenseDetail>)query.list();	
			return expensedetail;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {			
		}
		return null;
	}

	@Override
	@Transactional
	public Boolean saveExpense(List<ExpenseForm> expenseForm) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Expense expense = new Expense();
			expense.setExp_date(new Date());
			User user = userService.findUserByUsername(getPrincipal());
			expense.setExp_user_id(user.getId());
			
			for(int i=0; i < expenseForm.size();i++){
				ExpenseDetail expensedetail = new ExpenseDetail();
				expensedetail.setExp_qty(expenseForm.get(i).getQuantity());
				expensedetail.setExp_unitprice(expenseForm.get(i).getUnitPrice());
				expensedetail.setCustomer(expenseForm.get(i).getSuppliername());
				expensedetail.setRemark(expenseForm.get(i).getRemark());
				expensedetail.setExp_description(expenseForm.get(i).getProname());
				expensedetail.setExpense(expense);
				expense.getExpenseDetails().add(expensedetail);
			}
			session.save(expense);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {			
		}
		
		return false;
	}
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	@Override
	@Transactional
	public Boolean updateExpense(List<ExpenseForm> expenseform, Long id) {
		// TODO Auto-generated method stub
		 try {
				Expense expense = sessionFactory.getCurrentSession().get(Expense.class, id);
				Set<ExpenseDetail> expenseDetails = expense.getExpenseDetails();
				System.out.println("IMPORT DETAILS SIZE=" + expenseDetails.size());
			    expense.getExpenseDetails().clear();
				for (int i=0;i<expenseDetails.size();i++){
					ExpenseDetail expensedetail = new ExpenseDetail();
					expensedetail.setExp_qty(expenseform.get(i).getQuantity());
					expensedetail.setExp_unitprice(expenseform.get(i).getUnitPrice());
					expensedetail.setCustomer(expenseform.get(i).getSuppliername());
					expensedetail.setRemark(expenseform.get(i).getRemark());
					expensedetail.setExp_description(expenseform.get(i).getProname());
					expensedetail.setExpense(expense);
					expense.getExpenseDetails().add(expensedetail);					
				}
				sessionFactory.getCurrentSession().update(expense);
				return true;
		 }catch(Exception e){ 
			 e.printStackTrace();
			 System.out.println(e.getMessage());
			}finally {			
			}
		return false;
	}
}
