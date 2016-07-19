package vnpt.vn.mobileshopping.model;

import java.util.Date;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import vnpt.vn.mobileshopping.entity.Product;

public class ProductInfo {
	private String id;
	private String name;
	private Date createDate;
	private Date expirationDate;
	private double price;
	private double saleOff;
	private byte[] image;

	private boolean newProduct = false;

	// Upload file.
	private CommonsMultipartFile fileData;

	public ProductInfo() {
	}

	public ProductInfo(Product product) {
		this.id = product.getId();
		this.name = product.getName();
		this.price = product.getPrice();
	}

	// Không thay đổi Constructor này,
	// nó được sử dụng trong Hibernate query.
	public ProductInfo(String id, String name, double price, double saleOff) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.saleOff = saleOff;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

	public boolean isNewProduct() {
		return newProduct;
	}

	public void setNewProduct(boolean newProduct) {
		this.newProduct = newProduct;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public double getSaleOff() {
		return saleOff;
	}
	public void setSaleOff(double saleOff) {
		this.saleOff = saleOff;
	}
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
}
