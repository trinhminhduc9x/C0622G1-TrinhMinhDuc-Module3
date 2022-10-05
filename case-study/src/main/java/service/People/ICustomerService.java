package service.People;

import model.people.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    Customer findById(int id);
    void add(Customer student);
    void delete(int id);
}
