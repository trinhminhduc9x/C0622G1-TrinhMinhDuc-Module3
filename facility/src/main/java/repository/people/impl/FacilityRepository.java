package repository.people.impl;

import model.people.Customer;
import model.people.Facility;
import repository.people.IFacilityRepository;
import service.People.IFacilityService;

import java.util.List;
import java.util.Map;

public class FacilityRepository implements IFacilityRepository {
    private final String FIND_ALL_CUSTOMERS = "SELECT * FROM customer";
    private final String ADD_CUSTOMER = "INSERT INTO customer (customer_type_id,customer_name," +
            "date_of_birth,gender,id_card,phone_number,email,address) VALUE (?,?,?,?,?,?,?,?)";
    private final String FIND_BY_ID = "select * from customer where customer_id = ?";
    private final String UPDATE_CUSTOMER = "update customer set customer_type_id =?,customer_name =?," +
            "date_of_birth =?,gender = ?,id_card =?,phone_number=?, email = ?,address =?" +
            "where customer_id = ?;";
    private final String DELETE_BY_ID ="delete from customer where customer_id=?";
    private final String SEARCH_CUSTOMER = "select * from customer where customer_name like ? and phone_number like ? " +
            "and email like ? and customer_type_id like ?";



    @Override
    public List<Facility> FindAll() {
        return null;
    }

    @Override
    public boolean addFacility(Facility Facility) {
        return false;
    }

    @Override
    public boolean updateFacility(Facility Facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public Facility findById(int id) {
        return null;
    }

    @Override
    public List<Facility> searchFacility(String name, String standardRoom, String descriptionOtherConvenience, String Facility_type) {
        return null;
    }

    @Override
    public Map<String, String> checkValidateFacility(Customer customer) {
        return null;
    }
}

