package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping("/addPurchaseView.do")
	public ModelAndView addPurchaseView(Model model,@RequestParam("prodNo") int prodNo) throws Exception{
		System.out.println("/addPurchaseView");
				
		Product product = productService.getProduct(prodNo);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("purchase/addPurchaseView.jsp");
		
		
		model.addAttribute("product", product);
				
		return modelAndView;
	}
	
	@RequestMapping("/addPurchase.do")
	public ModelAndView addPurchase(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("user") User user, @RequestParam("prodNo") int prodNo) throws Exception{
		System.out.println("/addPurchase");
		
		Product product = productService.getProduct(prodNo);
		product.setQuantity(product.getQuantity()-purchase.getPurQuantity());
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		System.out.println("펄체이스 :  " + purchase);
		purchase.setTranCode("1");
		purchase.setIsPurchaseCode(1);
		productService.updateProduct(product);		
		purchaseService.addPurchase(purchase);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("purchase/addPurchase.jsp");
		modelAndView.addObject("purchase", purchase);
		
		return modelAndView;	
	}
	
	@RequestMapping("/listPurchase.do")
	public ModelAndView getListPurchase(@ModelAttribute("search") Search search,HttpSession session) throws Exception{
		System.out.println("/listPurchase");
		
		User user = (User)session.getAttribute("user");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search, user.getUserId());
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listPurchase.jsp");
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search",search);
				
		return modelAndView;
	}
	
	@RequestMapping("/getPurchase.do")
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/getPurchase");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/getPurchase.jsp");		
		modelAndView.addObject("purchase",purchase);
		
		return modelAndView;	
	}
	
	@RequestMapping("/updatePurchaseView.do")
	public ModelAndView updatePurchaseView(@RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/updatePurchaseView");
				
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/updatePurchaseView.jsp");		
		modelAndView.addObject("purchase",purchase);
		
		return modelAndView;
	}
	
	@RequestMapping("/updatePurchase.do")
	public ModelAndView updatePurchase(@ModelAttribute("purchase") Purchase purchase, @RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/updatePurchase");
		System.out.println("업데이트 될 펄체이스" + purchase);
		
		purchaseService.updatePurcahse(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/getPurchase.do");		
		modelAndView.addObject("tranNo",tranNo);

		return modelAndView;
	}
	
	@RequestMapping("/delivery.do")
	public ModelAndView getDelivery(@ModelAttribute("search") Search search, @RequestParam("prodNo") int prodNo) throws Exception{
		System.out.println("/delivery");
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		
		Map<String, Object> map = purchaseService.getDeliveryList(search, prodNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/delivery.jsp");
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search",search);
				
		return modelAndView;

	}
	

}
