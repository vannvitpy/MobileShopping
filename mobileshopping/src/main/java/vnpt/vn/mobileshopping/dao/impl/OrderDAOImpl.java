package vnpt.vn.mobileshopping.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import vnpt.vn.mobileshopping.dao.OrderDAO;
import vnpt.vn.mobileshopping.dao.ProductDAO;
import vnpt.vn.mobileshopping.dao.UserDAO;
import vnpt.vn.mobileshopping.entity.Order;
import vnpt.vn.mobileshopping.entity.OrderDetail;
import vnpt.vn.mobileshopping.entity.Product;
import vnpt.vn.mobileshopping.model.CartInfo;
import vnpt.vn.mobileshopping.model.CartLineInfo;
import vnpt.vn.mobileshopping.model.OrderDetailInfo;
import vnpt.vn.mobileshopping.model.OrderInfo;
import vnpt.vn.mobileshopping.model.PaginationResult;

public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private UserDAO userDAO;

	private int getMaxOrderNum() {
		String sql = "Select max(o.orderNum) from " + Order.class.getName()
				+ " o ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(sql);
		Integer value = (Integer) query.uniqueResult();
		if (value == null) {
			return 0;
		}
		return value;
	}

	Object username;
	@Override
	public void saveOrder(CartInfo cartInfo) {
		try{
			Session session = sessionFactory.getCurrentSession();

			int orderNum = this.getMaxOrderNum() + 1;
			Order order = new Order();
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			username = userDetails.getUsername();
			System.out.println("##userDetails.getUsername(): " + userDetails.getUsername());
			if(userDetails != null && userDetails.getUsername() != null){
				order.setOrderNum(orderNum);
				order.setOrderDate(new Date());
				order.setAmount(cartInfo.getAmountTotal());
				order.setUser(userDAO.findUser(userDetails.getUsername()));
			}
			
			session.persist(order);

			List<CartLineInfo> lines = cartInfo.getCartLines();

			for (CartLineInfo line : lines) {
				OrderDetail detail = new OrderDetail();
				detail.setOrder(order);
				detail.setAmount(line.getAmount());
				detail.setPrice(line.getProductInfo().getPrice());
				detail.setQuantity(line.getQuantity());

				String id = line.getProductInfo().getId();
				Product product = this.productDAO.findProduct(id);
				detail.setProduct(product);

				session.persist(detail);
			}

			// Set OrderNum for report.
			// Set OrderNum để thông báo cho người dùng.
			cartInfo.setOrderNum(orderNum);
		}catch(Exception ex){
			System.out.println("###" + ex.getStackTrace());
			System.out.println("###" + ex.getMessage());
		}
		
	}

	// @page = 1, 2, ...
	@Override
	public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult,
			int maxNavigationPage) {
		String sql = "Select new "
				+ OrderInfo.class.getName()//
				+ "(ord.id, ord.orderDate, ord.orderNum, ord.amount, "
				+ " ord.customerName, ord.customerAddress, ord.customerEmail, ord.customerPhone) "
				+ " from " + Order.class.getName() + " ord "//
				+ " order by ord.orderNum desc";
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql);

		return new PaginationResult<OrderInfo>(query, page, maxResult,
				maxNavigationPage);
	}

	public Order findOrder(int orderId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Order.class);
		crit.add(Restrictions.eq("id", orderId));
		return (Order) crit.uniqueResult();
	}

	@Override
	public OrderInfo getOrderInfo(int orderId) {
		Order order = this.findOrder(orderId);
		if (order == null) {
			return null;
		}
		return new OrderInfo(order.getId(),
				order.getOrderDate(), 
				order.getOrderNum(), 
				order.getAmount(),
				order.getUser().getFullName(), 
				order.getUser().getAddress(),
				order.getUser().getEmail(),
				order.getUser().getPhone());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetailInfo> listOrderDetailInfos(int orderId) {
		String sql = "Select new "
				+ OrderDetailInfo.class.getName() //
				+ "(d.id, d.product.code, d.product.name , d.quanity,d.price,d.amount) "//
				+ " from " + OrderDetail.class.getName() + " d "//
				+ " where d.order.id = :orderId ";

		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql);
		query.setParameter("orderId", orderId);

		return query.list();
	}

}