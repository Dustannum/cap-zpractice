using MainService as service from '../../srv/services';
annotate service.Customer with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Customerid}',
                Value : CustomerID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Firstname}',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Lastname}',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Email}',
                Value : Email,
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
            Label : '{i18n>Customerid}',
            Value : CustomerID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Fullname}',
            Value : FullName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : Email,
        },
    ],
);

