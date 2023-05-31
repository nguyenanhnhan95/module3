package com.example.manage_product.service;

import com.example.manage_product.model.Product;
import com.example.manage_product.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();
    private List<Product> productList;

    @Override
    public List<Product> findAll() {
        productList = new ArrayList<>();
        productList = productRepository.getList();
        return productList;
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public Product findProduct(int id) {
        productList = new ArrayList<>();
        productList = findAll();
        for (Product p : productList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    @Override
    public void editProduct(int id, Product product) {
        productRepository.editProduct(id, product);
    }
}
