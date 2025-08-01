using MainService as service from '../../srv/services';
annotate service.Reservation with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Checkindate}',
                Value : CheckInDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Checkoutdate}',
                Value : CheckOutDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Status}',
                Value : Status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Customer}',
            ID : 'Customer',
            Target : '@UI.FieldGroup#Customer',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Room}',
            ID : 'Room',
            Target : '@UI.FieldGroup#Room',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Requests}',
            ID : 'Requests',
            Target : 'Requests/@UI.SelectionPresentationVariant#Requests',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : CustomerID.FullName,
            Label : '{i18n>Fullname}',
        },
        {
            $Type : 'UI.DataField',
            Value : RoomID.RoomNumber,
            Label : '{i18n>Roomnumber}',
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
            Label : '{i18n>Status}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.CancelReservation',
            Label : '{i18n>Cancelreservation}',
        },
    ],
    UI.FieldGroup #Customer : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CustomerID.CustomerID,
                Label : '{i18n>Customerid}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerID.FullName,
                Label : '{i18n>Fullname}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerID.Email,
                Label : '{i18n>Email}',
            },
        ],
    },
    UI.FieldGroup #Room : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : RoomID.RoomNumber,
                Label : '{i18n>Roomnumber}',
            },
            {
                $Type : 'UI.DataField',
                Value : RoomID.Price,
                Label : '{i18n>Price}',
            },
            {
                $Type : 'UI.DataField',
                Value : RoomID.Type,
                Label : '{i18n>Type}',
            },
        ],
    },
);

annotate service.Reservation with {
    CustomerID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customer',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : CustomerID_CustomerID,
                ValueListProperty : 'CustomerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FirstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'LastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FullName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Email',
            },
        ],
    }
};

annotate service.Reservation with {
    RoomID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Room',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : RoomID_RoomID,
                ValueListProperty : 'RoomID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'RoomNumber',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Type',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Price',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Status',
            },
        ],
    }
};

annotate service.Request with @(
    UI.LineItem #Requests : [
        {
            $Type : 'UI.DataField',
            Value : RequestName,
            Label : '{i18n>Requestname}',
        },
        {
            $Type : 'UI.DataField',
            Value : RequestDescription,
            Label : '{i18n>Requestdescription}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformation}',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : RequestName,
                Label : '{i18n>Requestname}',
            },
            {
                $Type : 'UI.DataField',
                Value : RequestDescription,
                Label : '{i18n>Requestdescription}',
            },
            {
                $Type : 'UI.DataField',
                Value : RequestDateTime,
                Label : '{i18n>Requestdatetime}',
            },
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SetRequestCompleted',
            Label : '{i18n>Setrequestcompleted}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SetRequestCancelled',
            Label : '{i18n>Setrequestcancelled}',
        },
    ],
    UI.SelectionPresentationVariant #Requests : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#Requests',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : RequestDateTime,
                    Descending : true,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
);

