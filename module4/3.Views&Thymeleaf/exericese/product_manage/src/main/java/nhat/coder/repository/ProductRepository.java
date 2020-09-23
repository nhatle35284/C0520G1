package nhat.coder.repository;

import nhat.coder.model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void save (Product product);
    Product findById(int id);
    void update(int id,Product product);
    void delete(int id);
}
