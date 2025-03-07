package com.kh.a;

import common.Common;
import dao.AcademyDao;
import dao.CartDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vo.AcademyVO;
import vo.CartVO;
import vo.TossVO;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {

    CartDao cartDao;
    AcademyDao academyDao;

    public void setCartDao(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    public void setAcademyDao(AcademyDao academyDao) {
        this.academyDao = academyDao;
    }

    @RequestMapping("cart_page.do")
    public String cartPage(String stepup_id, Model model) {

        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        List<CartVO> list = cartDao.selectCart(stepup_id);

        model.addAttribute("region", region);
        model.addAttribute("category", category);
        model.addAttribute("list", list);


        return Common.cart.VIEW_PATH + "cart.jsp";
    }

    @RequestMapping("/cartAdd.do")
    public String cartAdd(CartVO cartVO) {
        List<CartVO> list = cartDao.selectCart(cartVO.getStepup_id());
        System.out.println(cartVO.getSchedule_idx());
        boolean isCartCheck = false;

        for (CartVO cart : list) {
            if (cart.getSchedule_idx() == cartVO.getSchedule_idx() &&
                    cart.getStepup_id().equals(cartVO.getStepup_id())) {

                cart.setQuantity(cart.getQuantity() + 1);
                cartDao.updateCartQuantity(cart);
                isCartCheck = true;
                break;
            }

        }

        if (!isCartCheck) {
            cartDao.cartInsert(cartVO);
        }

        return "redirect:/cart_page.do?stepup_id=" + cartVO.getStepup_id();
    }

    @RequestMapping("/check_out.do")
    public String toss(Model model, int cart_idx, int total_price, int quantity, String stepup_id) {
        // cart_idx로 단일 장바구니 항목 조회
        CartVO cart = cartDao.selectcart(cart_idx);
        cart.setStepup_id(stepup_id);
        cart.setTotal_price(total_price);
        cart.setQuantity(quantity);

        // 바인딩
        model.addAttribute("vo", cart);


        return Common.cart.VIEW_PATH + "cash.jsp";
    }

    @RequestMapping("/success.do")
    public String paymentSuccess(
            @RequestParam("stepup_id") String stepup_id,
            @RequestParam("schedule_idx") int schedule_idx,
            @RequestParam("stepup_name") String stepup_name,
            @RequestParam("subject") String subject,
            @RequestParam("school_type") String school_type,
            @RequestParam("total_price") int total_price,
            @RequestParam("quantity") int quantity,
            @RequestParam("instructor_idx") int instructor_idx,
            Integer cart_idx,
            Model model,
            TossVO vo) {
        // CurseVO 객체 생성 후 DB에 저장
        CartVO cart = new CartVO();
        cart.setStepup_id(stepup_id);
        cart.setSchedule_idx(schedule_idx);
        cart.setStepup_name(stepup_name);
        cart.setSubject(subject);
        cart.setSchool_type(school_type);
        cart.setTotal_price(total_price);
        cart.setQuantity(quantity);
        cart.setInstructor_idx(instructor_idx);

        cartDao.curseInsert(cart);
        cartDao.deletCart(cart_idx);

        model.addAttribute("vo", vo);

        return "redirect:/mainhome.do";
    }
}



