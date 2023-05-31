package com.example.manage_product.repository;

import com.example.manage_product.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Iphone", 25000, "SmartPhone", "Apple"));
        productList.add(new Product(2, "Macbook", 50000, "Laptop", "Apple"));
        productList.add(new Product(3, "Airblace", 20000, "MotorBike", "Apple"));
    }

    @Override
    public List<Product> getList() {
        return productList;
    }

    @Override
    public void addProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void deleteProduct(int id) {
        int size = productList.size();
        for (int j = 0; j < size; j++) {
            if (productList.get(j).getId() == id) {
                productList.remove(j);
                break;
            }
        }
    }

    @Override
    public void editProduct(int id, Product product) {
        int size = productList.size();
        for (int j = 0; j < size; j++) {
            if (productList.get(j).getId() == id) {
                productList.set(j, product);
                break;
            }
        }
    }

}
