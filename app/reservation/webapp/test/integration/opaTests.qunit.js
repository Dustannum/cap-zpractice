sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'reservation/test/integration/FirstJourney',
		'reservation/test/integration/pages/ReservationList',
		'reservation/test/integration/pages/ReservationObjectPage',
		'reservation/test/integration/pages/RequestObjectPage'
    ],
    function(JourneyRunner, opaJourney, ReservationList, ReservationObjectPage, RequestObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('reservation') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheReservationList: ReservationList,
					onTheReservationObjectPage: ReservationObjectPage,
					onTheRequestObjectPage: RequestObjectPage
                }
            },
            opaJourney.run
        );
    }
);