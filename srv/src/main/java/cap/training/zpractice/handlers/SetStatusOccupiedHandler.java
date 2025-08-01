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
import cds.gen.mainservice.RoomSetStatusOccupiedContext;
import cds.gen.mainservice.Room_;

@Component
@ServiceName("MainService")
public class SetStatusOccupiedHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @On(event = RoomSetStatusOccupiedContext.CDS_NAME, entity = Room_.CDS_NAME)
    public void SetStatusOccupied(RoomSetStatusOccupiedContext context) {
        Room room = db.run(context.getCqn()).single(Room.class);
        room.setStatus("Occupied");

        CqnUpdate updateSql = Update.entity(Room_.CDS_NAME).entry(room);
        db.run(updateSql);

        context.setCompleted();
    }
}
