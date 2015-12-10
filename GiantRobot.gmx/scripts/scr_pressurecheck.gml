/// scr_pressurecheck();
with ( CompartmentController ) {
    for ( i = 0; i < GameState.numOfCompartments; i++ ) {
        show_debug_message('Checking CompartmentController for compartment' + string(i));
        show_debug_message('inCompartment = ' + string(inCompartment));
        if ( inCompartment == i ) {
            // Set CompartmentController.floodfill to true for this compartment
            floodfill = true;
        }
    }
}
