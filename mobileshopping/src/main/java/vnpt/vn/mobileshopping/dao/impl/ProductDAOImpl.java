package vnpt.vn.mobileshopping.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import vnpt.vn.mobileshopping.dao.ProductDAO;
import vnpt.vn.mobileshopping.entity.Manufacture;
import vnpt.vn.mobileshopping.entity.Product;
import vnpt.vn.mobileshopping.model.PaginationResult;
import vnpt.vn.mobileshopping.model.ProductInfo;
import vnpt.vn.mobileshopping.util.Utils;

public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProducts() {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createCriteria(Product.class).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByName(String key) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class, "product");
		// where cond1
		crit.add(Restrictions.like("product.name", "%" + key + "%"));
		// Inner join
		crit.createAlias("product.productType", "productType");
		crit.createAlias("product.manuf", "manuf");
		// Or cond2
		Criterion c1 = Restrictions.like("productType.name", "%" + key + "%");
		Criterion c2 = Restrictions.like("manuf.name", "%" + key + "%");
		crit.add(Restrictions.or(c1, c2));

		return crit.list();
	}

	@Override
	public Product findProduct(String id) {

		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class);
		crit.add(Restrictions.eq("id", id));

		return (Product) crit.uniqueResult();
	}

	@Override
	public ProductInfo findProductInfo(String code) {
		Product product = this.findProduct(code);
		if (product == null) {
			return null;
		}
		return new ProductInfo(product.getId(), product.getName(),
				product.getPrice(), product.getSaleOff());
	}

	@Override
	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
			int maxNavigationPage, String likeName) {
		String sql = "Select new " + ProductInfo.class.getName() //
				+ "(p.id, p.name, p.price, p.saleOff) " + " from "//
				+ Product.class.getName() + " p ";
		if (likeName != null && likeName.length() > 0) {
			sql += " Where lower(p.name) like :likeName ";
		}
		sql += " order by p.createDate desc ";
		//
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql);
		if (likeName != null && likeName.length() > 0) {
			query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
		}
		return new PaginationResult<ProductInfo>(query, page, maxResult,
				maxNavigationPage);
	}

	@Override
	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
			int maxNavigationPage) {
		return queryProducts(page, maxResult, maxNavigationPage, null);
	}

	@Override
	public void save(ProductInfo productInfo) {
		String code = productInfo.getId();

		Product product = null;

		boolean isNew = false;
		if (code != null) {
			product = this.findProduct(code);
		}
		if (product == null) {
			isNew = true;
			product = new Product();
			product.setCreateDate(new Date());
		}
		product.setId(code);
		product.setName(productInfo.getName());
		product.setPrice(productInfo.getPrice());

		if (productInfo.getFileData() != null) {
			byte[] image = productInfo.getFileData().getBytes();
			if (image != null && image.length > 0) {
				product.setImage(image);
			}
		}
		if (isNew) {
			this.sessionFactory.getCurrentSession().persist(product);
		}
		// If error in DB, Exceptions will be thrown out immediately
		// Nếu có lỗi tại DB, ngoại lệ sẽ ném ra ngay lập tức
		this.sessionFactory.getCurrentSession().flush();
	}

	@Override
	public PaginationResult<ProductInfo> searchProducts(int page,
			int maxResult, int maxNavigationPage, String keyword) {
		String sql = "Select new " + ProductInfo.class.getName() //
				+ "(p.id, p.name, p.price, p.saleOff) " + " from "//
				+ Product.class.getName() + " p ";
		if (keyword != null && keyword.length() > 0) {
			if (Utils.isNumber(keyword)) {
				sql += " Where p.price = :keyword";
			} else {
				sql += " Where lower(p.name) like :keyword";
			}
		}

		sql += " order by p.createDate desc ";
		//

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql);
		if (keyword != null && keyword.length() > 0 && !Utils.isNumber(keyword)) {
			query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
		} else {
			query.setParameter("keyword", Double.parseDouble(keyword));
		}
		return new PaginationResult<ProductInfo>(query, page, maxResult,
				maxNavigationPage);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Manufacture> getAllManufacture() {

		Session session = sessionFactory.getCurrentSession();
		List<Manufacture> list = session.createCriteria(Manufacture.class)
				.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByManufId(int manufId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class, "product")
				.createAlias("product.manuf", "manuf");
		crit.add(Restrictions.eq("manuf.id", manufId));
		System.out.println("## findByManufId: " + crit.list());

		return crit.list();
	}

}
