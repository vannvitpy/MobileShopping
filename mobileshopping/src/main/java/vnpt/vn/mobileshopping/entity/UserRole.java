package vnpt.vn.mobileshopping.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User_Roles")
public class UserRole {
	private int roleId;
	private String roleName;
	
	
	public UserRole(){}
	
	public UserRole(String roleName){
		this.roleName = roleName;
	}
	@Id
	@Column(name = "Role_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
	@Column(name = "Role_Name", length = 50, nullable = false)
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	

}
