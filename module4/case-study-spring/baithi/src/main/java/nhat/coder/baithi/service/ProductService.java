package nhat.coder.baithi.service;

import nhat.coder.baithi.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Page<Product> findAll(Pageable pageable);

//    Page<Product> findAllByProductId(String search,Pageable pageable);
//    Page<Product> findAllByProductName(String search,Pageable pageable);
//    Page<Product> findAllByColor(String search,Pageable pageable);

    void save(Product product);

    Product findById(Long id);

    void update(Product product);

    void remove(Long id);

//    Page<Product> findAllByStatusTrue(Pageable pageable);

//    Page<Product> findAllByProductNameContainingOrColorContaining(String name,String color,Pageable pageable);

    //    List<Product> findAllByOrOrderByProductNameDesc();
//List<Product> findByStatusTrueOrOrderByProductNameDesc();

}
