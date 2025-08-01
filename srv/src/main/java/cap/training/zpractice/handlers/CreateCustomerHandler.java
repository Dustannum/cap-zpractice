package cap.training.zpractice.handlers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Customer;
import cds.gen.mainservice.Customer_;

@Component
@ServiceName("MainService")
public class CreateCustomerHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before
    public void setDefaultCustomerID(DraftNewEventContext context, Customer customer) {
        CqnSelect selectSql = Select.from(Customer_.CDS_NAME).columns(c -> c.get("CustomerID"))
                .orderBy(o -> o.get("CustomerID").desc());
        Optional<Customer> lastCustomer = db.run(selectSql).first(Customer.class);
/*         String draftID = customer.getCustomerID(); */
        String id;
        if (lastCustomer.isPresent()) {
            String id_last = lastCustomer.get().getCustomerID();
            Long id_int = Long.parseLong(id_last);
             id = String.valueOf(id_int + 1);
/*        } else if (!(draftID.isEmpty())) {
            Long id_int = Long.parseLong(draftID);
            id = String.valueOf(id_int + 1); */
        } else {
            id = "3000000001";
        }

        customer.setCustomerID(id);

    }
}