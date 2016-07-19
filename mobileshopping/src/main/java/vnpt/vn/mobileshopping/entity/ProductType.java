package vnpt.vn.mobileshopping.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Product_Type")
public class ProductType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String screen;
	private String operatingSystem;
	private String cpu;
	private String camera;
	private String sizeOfPower;
	
	@Id
	@Column(name = "Product_Type_ID")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "Name", length = 100, nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "Screen", length = 30, nullable = false)
	public String getScreen() {
		return screen;
	}
	public void setScreen(String screen) {
		this.screen = screen;
	}
	
	@Column(name = "Operating_System", length = 30, nullable = false)
	public String getOperatingSystem() {
		return operatingSystem;
	}
	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}
	
	@Column(name = "CPU", length = 30, nullable = false)
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	@Column(name = "Camera", length = 30, nullable = false)
	public String getCamera() {
		return camera;
	}
	public void setCamera(String camera) {
		this.camera = camera;
	}
	
	@Column(name = "Size_of_power", length = 30, nullable = false)
	public String getSizeOfPower() {
		return sizeOfPower;
	}
	public void setSizeOfPower(String sizeOfPower) {
		this.sizeOfPower = sizeOfPower;
	}
	
	
}
