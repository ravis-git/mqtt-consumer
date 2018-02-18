package com.example.deviceevents.rest

import groovy.json.JsonBuilder

import javax.ws.rs.GET
import javax.ws.rs.Path
import javax.ws.rs.Produces
import javax.ws.rs.core.MediaType
import java.time.Instant
import java.time.ZoneOffset

/**
 * Created by ravipalakodeti on 11/16/17.
 */
@Path('')
class DeviceEventService {

    static final JsonBuilder jsonBuilder = new JsonBuilder()

    @GET
    @Path('health')
    @Produces(MediaType.APPLICATION_JSON)
    def getResourceHealth() {

        return jsonBuilder.health (
            service: "ship-notice",
            status: "UP",
            timestamp: Instant.now().atOffset(ZoneOffset.UTC).toString()
        )
    }
}
