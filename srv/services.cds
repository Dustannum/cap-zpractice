using db.schema from '../db/schemas';

service MainService {
    @odata.draft.enabled
    entity Customer    as projection on schema.Customer;

    @odata.draft.enabled
    entity Room        as projection on schema.Room
        actions {
            action SetStatusOccupied();
            action SetStatusMaintenance();
            action SetStatusAvailable()
        };

    @odata.draft.enabled
    entity Reservation as projection on schema.Reservation
        actions {
            action CancelReservation()
        };

    entity Request     as projection on schema.Request
        actions {
            action SetRequestCompleted();
            action SetRequestCancelled()
        };
}
