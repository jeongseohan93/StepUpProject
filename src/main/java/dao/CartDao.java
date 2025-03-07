package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import vo.CartVO;

import java.util.List;

public class CartDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<CartVO> selectCart(String stepup_id){

        return sqlSession.selectList("cart.selectCart",stepup_id);

    }

    public void updateCartQuantity(CartVO cartVO){
        sqlSession.update("cart.updateCartQuantity",cartVO);
    }

    public void cartInsert(CartVO cartVO){

        sqlSession.update("cart.insertCart",cartVO);

    }

    public void deletCart(Integer cart_idx){

        sqlSession.delete("cart.deleteCart",cart_idx);
    }

    public CartVO selectcart(int cart_idx){
        CartVO cart = sqlSession.selectOne("cart.cart_out", cart_idx);
        return cart;
    }

    public void curseInsert(CartVO cartVO){

        sqlSession.insert("cart.insertCurse",cartVO);
    }


}
