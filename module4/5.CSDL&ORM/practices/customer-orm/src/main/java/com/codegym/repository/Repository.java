package com.codegym.repository;

import com.codegym.model.Customer;

import java.util.List;

public interface Repository<T> {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id,Customer customer);
}
