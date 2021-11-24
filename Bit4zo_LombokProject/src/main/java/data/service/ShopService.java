package data.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.ProductDto;
import data.dto.ProductOpDto;
import data.mapper.ShopMapper;

@Service
public class ShopService {

  @Autowired
  ShopMapper mapper;

  public void insertShop(ProductDto dto) {
    mapper.insertShop(dto);
  }

  public void insertShopOp(ProductOpDto dto) {
    mapper.insertShopOp(dto);
  }

  public int getTotalCount() {
    return mapper.getTotalCount();
  }

  public ProductDto getData(String num) {
    return mapper.getData(num);
  }



  public List<ProductDto> getAllLists(int start, int perpage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perpage);
    return mapper.getAllLists(map);
  }

  public List<ProductOpDto> getAllOptions(String pro_id) {
    System.out.println("pro_id=" + pro_id);

    return mapper.getAllOptions(pro_id);


  }

  public void updateReadCount(String num) {
    mapper.updateReadCount(num);
  }


}
