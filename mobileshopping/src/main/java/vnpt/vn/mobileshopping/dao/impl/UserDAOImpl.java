package vnpt.vn.mobileshopping.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import vnpt.vn.mobileshopping.dao.UserDAO;
import vnpt.vn.mobileshopping.entity.User;

public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findUser(String userName) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("userName", userName));
		return (User) crit.uniqueResult();
	}

}
