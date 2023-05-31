package com.example.manage_product.repository;

import com.example.manage_product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    void addProduct(Product product);

    void deleteProduct(int id);

    void editProduct(int id, Product product);
}
