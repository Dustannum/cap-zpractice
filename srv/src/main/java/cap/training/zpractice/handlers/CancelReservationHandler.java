package cap.training.zpractice.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Reservation;
import cds.gen.mainservice.ReservationCancelReservationContext;
import cds.gen.mainservice.Reservation_;

@Component
@ServiceName("MainService")
public class CancelReservationHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @On(event = ReservationCancelReservationContext.CDS_NAME, entity = Reservation_.CDS_NAME)
    public void onCancelReservation(ReservationCancelReservationContext context) {
        Reservation reservation = db.run(context.getCqn()).single(Reservation.class);
        reservation.setStatus("Cancelled");

        CqnUpdate updateSql = Update.entity(Reservation_.CDS_NAME).entry(reservation);
        db.run(updateSql);

        context.setCompleted();
    }
}
