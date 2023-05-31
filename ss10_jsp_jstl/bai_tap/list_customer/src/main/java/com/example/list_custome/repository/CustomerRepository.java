package com.example.list_custome.repository;

import com.example.list_custome.model.Customer;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> listCustomer;

    static {
        listCustomer = new ArrayList<>();
        listCustomer.add(new Customer(1, "Mai Văn Hoàn", LocalDate.parse("1983-08-20"), "Hà Nội", "https://toigingiuvedep.vn/wp-content/uploads/2021/07/mau-anh-the-dep-lam-the-can-cuoc.jpg"));
        listCustomer.add(new Customer(2, "Nguyễn Văn Nam", LocalDate.parse("1983-08-21"), "Bắc Giang", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToDLWp54MtALp0rFFz972_wuOC_AgEnU9Uybo4QLE&s"));
        listCustomer.add(new Customer(3, "Nguyễn Thái Hòa", LocalDate.parse("1983-08-22"), "Nam Định", "https://toplistcantho.com/wp-content/uploads/2022/06/anh-the-dep-quang-tri-708030.jpg"));
    }

    @Override
    public List<Customer> getList() {
        return listCustomer;
    }
}
