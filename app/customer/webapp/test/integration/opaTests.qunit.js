sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'customer/test/integration/FirstJourney',
		'customer/test/integration/pages/CustomerList',
		'customer/test/integration/pages/CustomerObjectPage',
		'customer/test/integration/pages/ReservationObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomerList, CustomerObjectPage, ReservationObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('customer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomerList: CustomerList,
					onTheCustomerObjectPage: CustomerObjectPage,
					onTheReservationObjectPage: ReservationObjectPage
                }
            },
            opaJourney.run
        );
    }
);