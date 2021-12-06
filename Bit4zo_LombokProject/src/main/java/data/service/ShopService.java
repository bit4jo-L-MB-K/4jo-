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

  public void insertShopOP(ProductOpDto dto) {
    mapper.insertShopOP(dto);
  }

  public int getTotalCount() {
    return mapper.getTotalCount();
  }

  public int getPriceAllCount() {
    return mapper.getPriceAllCount();
  }

  public int getTotalCountCategory(String pro_sub, String price_n) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("price_n", price_n);
    return mapper.getTotalCountCategory(map);
  }



  public ProductDto getData(String idx) {
    return mapper.getData(idx);
  }

  public List<ProductDto> getAllLists(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllLists(map);
  }

  public List<ProductDto> getAllListsLowPri(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllListsLowPri(map);
  }

  public List<ProductDto> getAllCateLowPri(String pro_sub, int start, int perPage) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllCateLowPri(map);
  }

  public List<ProductDto> getAllListsHigPri(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllListsHigPri(map);
  }

  public List<ProductDto> getAllCateHigPri(String pro_sub, int start, int perPage) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllCateHigPri(map);
  }

  public List<ProductOpDto> getAllOptions(String pro_id) {
    System.out.println("pro_id=" + pro_id);
    return mapper.getAllOptions(pro_id);

  }

  public List<ProductDto> getCategory(String pro_sub, int start, int perpage, String price_n,
      String color) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perpage);
    map.put("price_n", price_n);
    map.put("color", color);


    return mapper.getCategory(map);
  }

  public List<ProductDto> getPriceList(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getPriceList(map);
  }

  public void updateReadCount(String idx) {
    mapper.updateReadCount(idx);
  }

  public List<ProductOpDto> getAllOp() {

    return mapper.getAllOp();
  }

  public void updateProduct(ProductDto dto) {
    mapper.updateProduct(dto);
  }

  public void updateOption(ProductOpDto dto) {
    mapper.updateOption(dto);
  }

  public List<ProductOpDto> getJoinList(int start, int perpage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perpage);

    return mapper.getJoinList(map);
  }

  public List<ProductOpDto> getJoinNum(String idx, String color) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("idx", idx);
    map.put("color", color);

    return mapper.getJoinNum(map);
  }

  public List<ProductOpDto> getJoinListLeft(int start, int perpage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perpage);

    return mapper.getJoinListLeft(map);
  }

  public void deleteOne(String idx, String color) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("idx", idx);
    map.put("color", color);

    mapper.deleteOne(map);
  }
  
  public void deleteAll(String idx) {
	  mapper.deleteAll(idx);
  }
  
  public int getTotalCountOption() {
	  return mapper.getTotalCountOption();
  }
  
  public int getProIdCheck(String pro_id) {
	  return mapper.getProIdCheck(pro_id);
  }

}
