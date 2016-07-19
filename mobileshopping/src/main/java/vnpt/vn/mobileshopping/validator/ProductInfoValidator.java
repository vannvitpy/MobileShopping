package vnpt.vn.mobileshopping.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import vnpt.vn.mobileshopping.dao.ProductDAO;
import vnpt.vn.mobileshopping.entity.Product;
import vnpt.vn.mobileshopping.model.ProductInfo;

// Khai báo là một @Component (Nghĩa là 1 Bean).
@Component
public class ProductInfoValidator implements Validator {
 
   @Autowired
   private ProductDAO productDAO;
 
  
   // Validator này chỉ dùng để kiểm tra class ProductInfo.
   @Override
   public boolean supports(Class<?> clazz) {
       return clazz == ProductInfo.class;
   }
 
   @Override
   public void validate(Object target, Errors errors) {
       ProductInfo productInfo = (ProductInfo) target;
 
  
       // Kiểm tra các trường (field) của ProductInfo.
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.productForm.code");
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.productForm.name");
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.productForm.price");
 
       String id = productInfo.getId();
       if (id != null && id.length() > 0) {
           if (id.matches("\\s+")) {
               errors.rejectValue("code", "Pattern.productForm.code");
           } else if(productInfo.isNewProduct()) {
               Product product = productDAO.findProduct(id);
               if (product != null) {
                   errors.rejectValue("code", "Duplicate.productForm.code");
               }
           }
       }
   }
 
}
