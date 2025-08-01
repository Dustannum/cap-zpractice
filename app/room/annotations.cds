using MainService as service from '../../srv/services';
annotate service.Room with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Roomnumber}',
                Value : RoomNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Type}',
                Value : Type,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
                Value : Price,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Roomnumber}',
            Value : RoomNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Type}',
            Value : Type,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : Price,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Status}',
            Value : Status,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SetStatusOccupied',
            Label : '{i18n>Setstatusoccupied}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SetStatusMaintenance',
            Label : '{i18n>Setstatusmaintenance}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SetStatusAvailable',
            Label : '{i18n>Setstatusavailable}',
        },
    ],
);

