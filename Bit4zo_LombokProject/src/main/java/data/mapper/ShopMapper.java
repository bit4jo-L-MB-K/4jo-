package data.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.ProductDto;
import data.dto.ProductOpDto;

@Mapper
public interface ShopMapper {



  public int getTotalCount();

  public int getTotalCountCategory(String pro_sub);

  public List<ProductDto> getAllLists(HashMap<String, Integer> map);

  public List<ProductDto> getAllListsLowPri(HashMap<String, Integer> map);

  public List<ProductDto> getAllCateLowPri(HashMap<String, Object> map);

  public List<ProductDto> getAllListsHigPri(HashMap<String, Integer> map);

  public List<ProductDto> getAllCateHigPri(HashMap<String, Object> map);

  public List<ProductOpDto> getAllOptions(String pro_id);

  public List<ProductDto> getCategory(HashMap<String, Object> map);

  public List<ProductDto> getPriceList(HashMap<String, Integer> map);

  public List<ProductOpDto> getAllOp();

  public ProductDto getData(String idx);

  public int getPriceAllCount();

  public void updateReadCount(String idx);

  public void insertShop(ProductDto dto);

  public void insertShopOP(ProductOpDto dto);

  public List<ProductOpDto> getJoinList(HashMap<String, Integer> map);

  public void updateProduct(ProductDto dto);

  public List<ProductOpDto> getJoinListLeft(HashMap<String, Integer> map);

  public List<ProductOpDto> getJoinNum(HashMap<String, String> map);

  public void updateOption(ProductOpDto dto);

  public void deleteOne(HashMap<String, String> map);


}
