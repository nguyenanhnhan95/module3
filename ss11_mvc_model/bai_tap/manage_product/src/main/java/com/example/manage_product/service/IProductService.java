package com.example.manage_product.service;

import com.example.manage_product.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void addProduct(Product product);

    void deleteProduct(int id);

    Product findProduct(int id);

    void editProduct(int id, Product product);
}
