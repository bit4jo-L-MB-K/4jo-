package data.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.ProductDto;
import data.dto.ProductOpDto;

@Mapper
public interface ShopMapper {
  public void insertShop(ProductDto dto);

  public void insertShopOp(ProductOpDto dto);

  public int getTotalCount();

  public List<ProductDto> getAllLists(HashMap<String, Integer> map);

  public List<ProductOpDto> getAllOptions(String pro_id);

  public ProductDto getData(String num);


  public void updateReadCount(String num);


}
