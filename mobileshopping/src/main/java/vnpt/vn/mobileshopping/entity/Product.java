package vnpt.vn.mobileshopping.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Products")
public class Product implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private ProductType productType;
	private Manufacture manuf;
	private Provider provider;
	private String name;
	private Date createDate;
	private Date expirationDate;
	private double price;
	private double saleOff;
	private byte[] image;
	
	@Id
	@Column(name = "Product_ID")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Product_Type_ID", nullable = false, 
	foreignKey = @ForeignKey(name = "products_Product_Type_FK"))
	public ProductType getProductType() {
		return productType;
	}
	public void setProductType(ProductType productType) {
		this.productType = productType;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Manuf_ID", nullable = false, 
	foreignKey = @ForeignKey(name = "products_Manufactures_FK"))
	public Manufacture getManuf() {
		return manuf;
	}
	public void setManuf(Manufacture manuf) {
		this.manuf = manuf;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Provider_ID", nullable = false, 
	foreignKey = @ForeignKey(name = "products_Providers_FK"))
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	
	@Column(name = "Name", length = 200, nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "Create_Date", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Column(name = "Expiration_Date", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	public Date getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	@Column(name = "Price", nullable = false)
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Column(name = "SaleOff", nullable = false)
	public double getSaleOff() {
		return saleOff;
	}
	public void setSaleOff(double saleOff) {
		this.saleOff = saleOff;
	}
	
	@Column(name = "Image", length = Integer.MAX_VALUE, nullable = false)
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
}
