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
import trader.Stock;

/**
 *
 * @author admin
 */
@ManagedBean
@RequestScoped
public class StocksManagedBean {

    //private BrokerModel brokerModelImpl;
    @EJB private BrokerModel brokerModelImpl;

    /**
     * Creates a new instance of StocksManagedBean
     * 
     */
    public StocksManagedBean() {
        //brokerModelImpl = BrokerModelImpl.getInstance();
    }

    public Stock[] getAllStocks() {
        try {
            return brokerModelImpl.getAllStocks();
        } catch (BrokerException ex) {
            Logger.getLogger(StocksManagedBean.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
