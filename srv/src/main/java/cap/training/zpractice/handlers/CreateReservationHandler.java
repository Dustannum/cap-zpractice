package cap.training.zpractice.handlers;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.mainservice.Reservation;
import cds.gen.mainservice.Reservation_;

@Component
@ServiceName("MainService")
public class CreateReservationHandler implements EventHandler {

    @Before
    public void setDefaultCheckInDate(DraftNewEventContext context, Reservation reservation) {
        reservation.setCheckInDate(LocalDate.now());
    }

    @Before(event = CqnService.EVENT_CREATE, entity = Reservation_.CDS_NAME)
    public void checkCheckOutDate(CdsCreateEventContext context) {
        context.getCqn().entries().forEach(entry -> {
            LocalDate checkInDate = LocalDate.parse(entry.get("CheckInDate").toString());
            LocalDate checkOutDate = LocalDate.parse(entry.get("CheckOutDate").toString());
            if (!(checkOutDate.isAfter(checkInDate))) {
                throw new ServiceException("Check-Out Date must be after Check-In Date");
            }
        });
    }
}
