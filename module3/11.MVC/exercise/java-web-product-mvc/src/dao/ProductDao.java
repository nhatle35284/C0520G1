package dao;

import model.Product;

import java.util.List;

public interface ProductDao {
    List<Product> getListProduct();

    void save(Product product);

    Product findById(int id);

    void deleteById(int id);

    List<Product> findByName(String name);
}
