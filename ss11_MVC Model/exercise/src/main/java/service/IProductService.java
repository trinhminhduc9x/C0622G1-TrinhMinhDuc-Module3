package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    Product productDetail(int id);
    void add(Product product);
    void update(int id,Product product);
    void delete(int id);
    List<Product> searchByName(String name);

}
