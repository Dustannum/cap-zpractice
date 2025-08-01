sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'room/test/integration/FirstJourney',
		'room/test/integration/pages/RoomList',
		'room/test/integration/pages/RoomObjectPage',
		'room/test/integration/pages/ReservationObjectPage'
    ],
    function(JourneyRunner, opaJourney, RoomList, RoomObjectPage, ReservationObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('room') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRoomList: RoomList,
					onTheRoomObjectPage: RoomObjectPage,
					onTheReservationObjectPage: ReservationObjectPage
                }
            },
            opaJourney.run
        );
    }
);