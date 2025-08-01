namespace db.schema;

entity Customer {
        @readonly
    key CustomerID   : String(10);

        @mandatory
        FirstName    : String;
        LastName     : String;
        FullName     : String = case
                                    when LastName  =  null
                                         then FirstName
                                    else FirstName || ' ' || LastName
                                end;

        @mandatory
        @assert.format: '[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$'
        Email        : String;
        Reservations : Association to many Reservation
                           on Reservations.CustomerID = $self;
}

type RoomType          : String enum {
    Single;
    Double;
    Queen;
    King
};

type RoomStatus        : String enum {
    Available;
    Occupied;
    Maintenance
};


@assert.unique: {RoomNumber: [RoomNumber]}
entity Room {
    key RoomID       : String;

        @assert.range: [
            000,
            999
        ]
        RoomNumber   : Integer;

        @assert.range
        Type         : RoomType;
        Price        : Double;

        @assert.range
        Status       : RoomStatus;

        @readonly
        IsAvailable  : Boolean = case
                                     when Status = 'Available'
                                          then true
                                     else false
                                 end;
        Reservations : Association to many Reservation
                           on Reservations.RoomID = $self;
}

type ReservationStatus : String enum {
    Confirmed;
    Cancelled
};

entity Reservation {
    key ReservationID : String;
        CustomerID    : Association to one Customer;
        RoomID        : Association to one Room;
        CheckInDate   : Date;
        CheckOutDate  : Date;

        @readonly
        @assert.range
        Status        : ReservationStatus default 'Confirmed';
        Requests      : Composition of many Request
                            on Requests.ReservationID = $self;
}

type RequestStatus     : String enum {
    Pending;
    Completed;
    Cancelled
};

entity Request {
    key RequestID          : String;
        ReservationID      : Association to one Reservation;

        @mandatory
        RequestName        : String;
        RequestDescription : String;

        @mandatory
        RequestDateTime    : DateTime;

        @readonly
        @assert.range
        Status             : RequestStatus default 'Pending';
}
