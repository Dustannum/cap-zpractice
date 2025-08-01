package cap.training.zpractice.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Room;
import cds.gen.mainservice.RoomSetStatusMaintenanceContext;
import cds.gen.mainservice.Room_;

@Component
@ServiceName("MainService")
public class SetStatusMaintenanceHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @On(event = RoomSetStatusMaintenanceContext.CDS_NAME, entity = Room_.CDS_NAME)
    public void SetStatusMaintenance(RoomSetStatusMaintenanceContext context) {
        Room room = db.run(context.getCqn()).single(Room.class);
        room.setStatus("Maintenance");

        CqnUpdate updateSql = Update.entity(Room_.CDS_NAME).entry(room);
        db.run(updateSql);

        context.setCompleted();
    }
}
