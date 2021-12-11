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

  public int getPriceAllCount(String price_n) {
    return mapper.getPriceAllCount(price_n);
  }

  public int getSearchCount(String keyword) {
    return mapper.getSearchCount(keyword);
  }

  public int getTotalCountCategory(String pro_sub, String price_n, String color) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("price_n", price_n);
    map.put("color", color);
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

  public List<ProductDto> getSearch(String keyword, int start, int perPage) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("keyword", keyword);
    map.put("start", start);
    map.put("perpage", perPage);

    return mapper.getSearch(map);
  }

  public List<ProductDto> getSearchLowPri(String keyword, int start, int perPage) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("keyword", keyword);
    map.put("start", start);
    map.put("perpage", perPage);

    return mapper.getSearchLowPri(map);
  }

  public List<ProductDto> getSearchHigPri(String keyword, int start, int perPage) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("keyword", keyword);
    map.put("start", start);
    map.put("perpage", perPage);

    return mapper.getSearchHigPri(map);
  }

  public List<ProductDto> getAllListsLowPri(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllListsLowPri(map);
  }

  public List<ProductDto> getAllCateLowPri(String pro_sub, int start, int perPage, String price_n,
      String color) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    map.put("color", color);
    return mapper.getAllCateLowPri(map);
  }

  public List<ProductDto> getAllListsHigPri(int start, int perPage) {
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    map.put("start", start);
    map.put("perpage", perPage);
    return mapper.getAllListsHigPri(map);
  }

  public List<ProductDto> getAllCateHigPri(String pro_sub, int start, int perPage, String price_n,
      String color) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    map.put("color", color);
    return mapper.getAllCateHigPri(map);
  }

  public List<ProductOpDto> getAllOptions(String pro_id) {
    System.out.println("pro_id=" + pro_id);
    return mapper.getAllOptions(pro_id);

  }

  public List<ProductOpDto> getAllTest(String pro_id) {
    System.out.println("pro_id=" + pro_id);
    return mapper.getAllTest(pro_id);

  }

  public List<ProductDto> getCategory(String pro_sub, int start, int perPage, String price_n,
      String color) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("pro_sub", pro_sub);
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    map.put("color", color);



    return mapper.getCategory(map);
  }

  public List<ProductDto> getPriceList(int start, int perPage, String price_n) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    return mapper.getPriceList(map);
  }

  public List<ProductDto> getPriceListLowPri(int start, int perPage, String price_n) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    return mapper.getPriceListLowPri(map);
  }

  public List<ProductDto> getPriceListHigPri(int start, int perPage, String price_n) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("start", start);
    map.put("perpage", perPage);
    map.put("price_n", price_n);
    return mapper.getPriceListHigPri(map);
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

  public List<ProductOpDto> getJoinNum(String idx, String color, String pro_id) {
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("idx", idx);
    map.put("color", color);
    map.put("pro_id", pro_id);

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

  public void updateSu(ProductOpDto dto) {
    mapper.updateSu(dto);
  }

}
