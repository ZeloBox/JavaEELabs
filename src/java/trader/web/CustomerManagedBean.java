/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trader.web;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import trader.BrokerException;
import trader.BrokerModel;
import trader.BrokerModelImpl;
import trader.Customer;

/**
 *
 * @author admin
 */
@ManagedBean
@RequestScoped

public class CustomerManagedBean {

    @EJB
    private BrokerModel brokerModel;
    // private BrokerModel brokerModelImpl;
    private String message;
    private String customerId;
    private String customerName;
    private String customerAddress;

    /**
     * Creates a new instance of CustomerManagedBean
     */
    public CustomerManagedBean() {
        this.customerAddress = "";
        this.customerName = "";
        this.customerId = "";
        this.message = "";

        //  brokerModelImpl = BrokerModelImpl.getInstance();
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the customerId
     */
    public String getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    /**
     * @return the customerName
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * @return the customerAddress
     */
    public String getCustomerAddress() {
        return customerAddress;
    }

    /**
     * @param customerAddress the customerAddress to set
     */
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String retrieveCustomer() {
        try {
            Customer customer = brokerModel.getCustomer(customerId);
            customerId = customer.getId();
            customerAddress = customer.getAddr();
            customerName = customer.getName();
        } catch (BrokerException ex) {
            message = ex.getLocalizedMessage();
        }
        return "CustomerDetails";
    }

    public String updateCustomer() {
        return null;
    }

    public String addCustomer() {
        return null;
    }

    public String deleteCustomer() {
        return null;
    }
}
