package menu.dao.customerDao;

import menu.model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerDao {
    void insertCustomer(Customer customer);

    public List<Customer> selectAllCustomer();

    void updateCustomer(Customer customer) throws SQLException;

    public  Customer getCustomerById(String id);

    void deleteCustomer(String id) throws SQLException;

    public List<Customer> searchByName(String name);
}
