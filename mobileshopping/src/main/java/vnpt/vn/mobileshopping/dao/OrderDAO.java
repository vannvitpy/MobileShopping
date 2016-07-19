package vnpt.vn.mobileshopping.dao;

import java.util.List;

import vnpt.vn.mobileshopping.model.CartInfo;
import vnpt.vn.mobileshopping.model.OrderDetailInfo;
import vnpt.vn.mobileshopping.model.OrderInfo;
import vnpt.vn.mobileshopping.model.PaginationResult;

public interface OrderDAO {
	
	public void saveOrder(CartInfo cartInfo);

	public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult,int maxNavigationPage);
			
	public OrderInfo getOrderInfo(int orderId);

	public List<OrderDetailInfo> listOrderDetailInfos(int orderId);
}
