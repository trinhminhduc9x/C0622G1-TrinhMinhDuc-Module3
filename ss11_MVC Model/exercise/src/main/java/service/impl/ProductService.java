package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository studentRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public Product productDetail(int id) {
        return null;
    }

    @Override
    public void add(Product product) {
        // validae dữ liệu
        // lưu và db
         studentRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Product> searchByName(String name) {
        return null;
    }
}
