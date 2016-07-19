package vnpt.vn.mobileshopping.dao;

import java.util.List;

import vnpt.vn.mobileshopping.entity.Manufacture;
import vnpt.vn.mobileshopping.entity.Product;
import vnpt.vn.mobileshopping.model.PaginationResult;
import vnpt.vn.mobileshopping.model.ProductInfo;

public interface ProductDAO {
	
	//Get all products
	public List<Product> getAllProducts();
	
	//Find product by key (productName, ManufactureName)
	public List<Product> findByName(String key);
	
	//Find product by id
	public Product findProduct(String id);
	
    public ProductInfo findProductInfo(String code);
	
	//Paging by...
	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,int maxNavigationPage);
			
	//Paging by...
	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,int maxNavigationPage, String likeName);
		
	//Save Product
	public void save(ProductInfo productInfo);
	
	//Search Product
	public PaginationResult<ProductInfo> searchProducts(int page, int maxResult,int maxNavigationPage, String keyword);

	//Get Manufacturers
	public List<Manufacture> getAllManufacture();
	
	//Get Product by manufId
	public List<Product> findByManufId(int manufId);
}
