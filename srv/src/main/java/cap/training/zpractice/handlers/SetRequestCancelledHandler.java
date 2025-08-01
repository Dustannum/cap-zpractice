package cap.training.zpractice.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Request;
import cds.gen.mainservice.RequestSetRequestCancelledContext;
import cds.gen.mainservice.Request_;

@Component
@ServiceName("MainService")
public class SetRequestCancelledHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before(event = RequestSetRequestCancelledContext.CDS_NAME, entity = Request_.CDS_NAME)
    public void beforeSetRequestCancelled(RequestSetRequestCancelledContext context) {
        Request request = db.run(context.getCqn()).single(Request.class);

        if (request.getStatus().equals("Cancelled")) {
            throw new ServiceException("Request has already been cancelled");
        } else if (request.getStatus().equals("Completed")) {
            throw new ServiceException("Completed request cannot be cancelled");
        }
    }

    @On(event = RequestSetRequestCancelledContext.CDS_NAME, entity = Request_.CDS_NAME)
    public void onSetRequestCancelled(RequestSetRequestCancelledContext context) {
        Request request = db.run(context.getCqn()).single(Request.class);

        request.setStatus("Cancelled");

        CqnUpdate updateSql = Update.entity(Request_.CDS_NAME).entry(request);
        db.run(updateSql);

        context.setCompleted();
    }
}
